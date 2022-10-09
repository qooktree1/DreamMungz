import React, { useEffect, useState } from "react"
import { useNavigate } from "react-router-dom"
import axios from "axios"
import {
  chainId,
  MUNGContract,
  MUNGContractAddress,
} from "../../utils/Web3Config"
import Web3 from "web3"

import memberAtom from "../../recoil/member/atom"
import tradeAtom from "../../recoil/trade/atom"
import { useRecoilState } from "recoil"
import Swal from "sweetalert2"
import mungImage from "../../assets/token.png"

export default function Login() {
  const [, setMember] = useRecoilState(memberAtom)
  const [trade, setTrade] = useRecoilState(tradeAtom)

  const navigate = useNavigate()
  let web3: any

  // Functions
  const handleAuthenticate = async ({
    publicAddress,
    signature,
  }: {
    publicAddress: string
    signature: string
  }) => {
    await axios
      .post(`https://j7a605.p.ssafy.io/api/auth/signature`, {
        address: publicAddress,
        signature: signature,
      })
      .then((res) => {
        localStorage.setItem("token", res.data.token)
        localStorage.setItem("expiration", res.data.expiration)
      })
      .catch((err) => console.error("handleAuthentiacte ERROR", err))
  }
  const handleSignMessage = async ({
    publicAddress,
    nonce,
  }: {
    publicAddress: string
    nonce: string
  }) => {
    try {
      const signature = await web3!.eth.personal.sign(nonce, publicAddress, "")
      return { publicAddress, signature }
    } catch (err: any) {
      throw new Error("You need to sign the message to be able to log in.")
    }
  }
  // 회원가입
  const handleSignin = (publicAddress: string) => {
    return axios
      .post(`https://j7a605.p.ssafy.io/api/auth/signin`, {
        address: publicAddress,
      })
      .then((res) => res.data.nonce)
      .catch((err) => console.error("에러", err))
  }
  // SSAFY 네트워크 연결 함수
  const handleEthereumNetwork = async (chainId: number) => {
    await window.ethereum.request({
      method: "wallet_switchEthereumChain",
      params: [{ chainId: web3?.utils.toHex(chainId) }],
    })
  }
  // 회원 닉네임 저장 함수
  const saveNickname = async ({ publicAddress }: { publicAddress: string }) => {
    await axios
      .get(`https://j7a605.p.ssafy.io/api/auth/info/nickname/${publicAddress}`)
      .then((res) => {
        // walletAddress, memberNickname recoil 전역변수에 저장
        setMember((prev: any) => {
          const value = { ...prev }
          value.memberNickname = res.data.nickname
          value.walletAddress = publicAddress
          return value
        })
      })
      .catch((err) => console.error("닉네임 에러", err))
  }

  const handleClick = async () => {
    // 메타마스크가 설치되어있는지 확인
    if (!window.ethereum) {
      Swal.fire({
        text: "메타마스크를 먼저 설치해주세요.",
        icon: "warning",
        confirmButtonText: "확인",
      })
      return
    }

    if (!web3) {
      try {
        await window.ethereum.enable()
        web3 = new Web3(window.ethereum)
      } catch (error) {
        Swal.fire({
          text: "메타마스크를 먼저 설치해주세요.",
          icon: "warning",
          confirmButtonText: "확인",
        })
        return
      }
    }

    await setTrade((prev) => {
      const variable = { ...prev }
      variable.modalOpen6 = true
      return { ...variable }
    })

    // 멍(ERC-20) 토큰 추가 함수
    const setERC20 = async () => {
      await window.ethereum
        .request({
          method: "wallet_watchAsset",
          params: {
            type: "ERC20",
            options: {
              address: `${MUNGContractAddress}`,
              symbol: "M",
              decimals: 18,
              image: mungImage,
            },
          },
        })
        .then((success: any) => {
          if (success) {
            // console.log("지갑에 MUNG 토큰이 추가되었습니다!")
          } else {
            throw new Error("화폐 추가 과정에서 문제가 발생했습니다.")
          }
        })
        .catch(console.error)
    }

    const coinbase = await web3.eth.getCoinbase()
    if (!coinbase) {
      await setTrade((prev) => {
        const variable = { ...prev }
        variable.modalOpen6 = false
        return { ...variable }
      })
      Swal.fire({
        text: "메타마스크를 먼저 실행해주세요.",
        icon: "warning",
        showConfirmButton: false,
      })
      // window.alert("먼저 메타마스크를 실행해주세요.")
      return
    }

    const publicAddress = await coinbase.toLowerCase()

    // 지갑주소 Recoil 변수 저장
    await setMember((prev: any) => {
      const value = { ...prev }
      value.walletAddress = publicAddress
      return value
    })
    let nonce: any
    let isNew: any
    // Look if user with current publicAddress is already present on backend
    await axios
      .get(`https://j7a605.p.ssafy.io/api/auth/info/${publicAddress}`)
      .then((res) => {
        nonce = res.data.nonce
        isNew = false
      })
      .catch(async () => {
        async function handleSigninFunction() {
          nonce = await handleSignin(publicAddress)
        }
        await handleSigninFunction()
        isNew = true
      })

    // Popup MetaMask confirmation modal to sign message
    const auth: any = await handleSignMessage({ publicAddress, nonce })

    // Send signature to backend on the /auth route
    await handleAuthenticate(auth)
    // SSAFY Network 연결
    try {
      await handleEthereumNetwork(chainId)
      await setERC20()

      // 지갑주소 localStorage에 추가
      localStorage.setItem("publicAddress", publicAddress)

      // 회원 닉네임 전역변수에 저장
      await saveNickname({ publicAddress })

      // 최초 가입 시 100000 M 지급
      // isNew === true 로 바꿔야 함
      if (isNew === true) {
        await Swal.fire({
          text: "최초가입하셨네요! 100000 M을 지급해드립니다!",
          icon: "success",
          showConfirmButton: false,
          timer: 3000,
        })
        try {
          await MUNGContract.methods
            .mintToMember(publicAddress, 100000)
            .send({ from: publicAddress })
        } catch {
          await Swal.fire({
            text: "돈을 거부하다니..",
            showConfirmButton: false,
            timer: 3000,
          })
        }
      }
      await setTrade((prev) => {
        const variable = { ...prev }
        variable.modalOpen6 = false
        return { ...variable }
      })

      navigate("/mainpage")
    } catch (err) {
      await setTrade((prev) => {
        const variable = { ...prev }
        variable.modalOpen6 = false
        return { ...variable }
      })
      Swal.fire({
        text: "싸피네트워크가 등록되어 있지 않습니다!",
        icon: "warning",
        confirmButtonText: "확인",
      })
    }
  }

  return (
    <div
      className="Login-button Login-mm flex items-center border-2 border-white shadow-md bg-[#273850] p-5 mapleStory text-xl rounded-2xl px-7 hover:bg-[#102747]"
      onClick={handleClick}
    >
      <img
        src="images/metamask.png"
        className="mr-3"
        alt="Metamask 로그인 이미지"
      />
      <p className="font-semibold text-white">MetaMask 로그인</p>
    </div>
  )
}
