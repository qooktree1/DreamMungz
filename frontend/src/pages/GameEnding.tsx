import html2canvas from "html2canvas"
import { useRef, useEffect, useState } from "react"
import { useNavigate } from "react-router-dom"
import { create } from "ipfs-http-client"
import { MFTContract } from "../utils/Web3Config"
import { http } from "../api/axios"
import parse from "html-react-parser"

import memberAtom from "../recoil/member/atom"
import tradeAtom from "../recoil/trade/atom"
import playingGame from "../recoil/game/atom"
import playingMusic from "../recoil/music/atom"
import { useRecoilState } from "recoil"
import findKOR from "../utils/findKOR"
import EndingList from "../components/game/EndingList"
import GameEndingCredit from "../components/game/GameEndingCredit"
import Swal from "sweetalert2"

export default function GameEnding() {
  const [NFT, setNFT] = useState({
    color: "PINK",
    hair: "CURLY",
    face: "BEAN",
    tier: "NORMAL",
    job: "JOBLESS",
    status: [
      {
        name: "QUICK",
        value: 3,
      },
    ],
    gender: "M",
  })

  const comment: { [index: string]: string } = {
    KING: "부족한 구석 없이 훌륭한 강아지로 자랐구나. <br/> 너에게는 세상의 왕이 될 자격이 있다.",
    ASTRONAUT:
      "영리하고 재빠르며, 직감과 카리스마를 갖췄구나. <br/> 우주비행사가 되어 더 넓은 세상을 누리고 다니거라.",
    ATHLETE:
      "튼튼하고 재빠르며, 발재주와 인기까지 갖췄구나. <br/> 운동선수가 되어 금메달을 목에 걸거다.",
    DOCTOR:
      "영리하고 감이 좋으며, 발재주가 있고 명성을 널리 알렸구나. <br/> 많은 이들을 고쳐주는 의사가 되거라.",
    POLICE:
      "튼튼하고 재빠르며, 카리스마 있고 목청까지 크구나. <br/> 경찰이 되어 이 세상의 안전을 지켜주렴.",
    CHEF: "재빠르며 감이 좋고, 발재주와 감수성이 탁월하다. <br/> 요리사가 되어 세상의 진미를 찾아내거라.",
    IDOL: "감수성과 목청으로 이름을 널리 알렸구나. <br/> 아이돌이 되어 세상에 네 노래를 들려주렴.",
    DEVELOPER:
      "튼튼하고 감이 좋으며 훌륭한 발재주를 가졌다. <br/> 개발자가 되어 세상의 이로운 것들을 만들거라.",
    MUNGPIA:
      "재빠르고 용기 있으나 정의롭지 못하군. <br/> 멍피아가 되어 세상의 무법자가 되거라!",
    TEACHER:
      "영리하고 카리스마 있으며, 감수성도 갖췄구나. <br/> 선생님이 되어 너른 세상에 지식을 전하렴.",
    JUDGE:
      "영리하고 카리스마 있으며, 목청도 좋구나. <br/> 판사가 되어 세상에 네 정의를 알리거라.",
    MYSTERIOUS_THIEF:
      "재빠르고 발재주가 좋지만 정의롭진 않구나. <br/> 괴도가 되어 세상의 보물을 네 것으로 만들거라.",
    TRAVELER:
      "감이 좋고 감수성도 충만하구나. <br/> 여행자가 되어 세상 모든 것들을 네 눈에 담으렴.",
    ARTIST:
      "감수성이 있고 발재주도 좋구나. <br/> 화가가 되어 캔버스 위로 네 상상을 싹틔우렴.",
    SCIENTIST:
      "영리하기도 하고, 감이 좋구나. <br/> 과학자가 되어 세상 많은 것들을 탐구하거라.",
    JANITOR:
      "튼튼하기도 하고, 발재주도 갖췄구나. <br/> 청소부가 되어 세상을 조금 더 깨끗하게 만들어주렴.",
    REPORTER:
      "영리하고 용기 있는 강아지가 되었구나. <br/> 기자가 되어 세상의 소식을 널리 알려주거라.",
    BUILDING_OWNER:
      "부족함이 없는 재력을 갖췄구나! <br/> 네게 어울리는 직업은 바로 건물주다.",
    VOCALIST:
      "부족함이 없는 목청을 갖췄구나! <br/> 네게 어울리는 직업은 바로 성악가다.",
    SCULPTOR:
      "부족함이 없는 발재주를 갖췄구나! <br/> 네게 어울리는 직업은 바로 조각가다.",
    UNKNOWN_AUTHOR:
      "부족함이 없는 감수성을 갖췄구나! <br/> 네게 어울리는 직업은 바로 작가다.",
    YOUTUBER:
      "부족함이 없는 인기를 갖췄구나! <br/> 네게 어울리는 직업은 바로 유튜버다.",
    BODYGUARD:
      "부족함이 없는 카리스마를 갖췄구나! <br/> 네게 어울리는 직업은 바로 보디가드다.",
    FORTUNE_TELLER:
      "부족함이 없는 직감을 갖췄구나! <br/> 네게 어울리는 직업은 바로 점술사다.",
    THIEF:
      "부족함이 없는 재빠름을 갖췄구나! <br/> 네게 어울리는 직업은 도둑이다.",
    PHILOSOPHER:
      "부족함이 없는 영리함을 갖췄구나! <br/> 네게 어울리는 직업은 바로 철학자다.",
    FARMER:
      "부족함이 없는 튼튼함을 갖췄구나! <br/> 네게 어울리는 직업은 바로 농부다.",
    JOBLESS:
      "이렇다 할 꿈을 아직 찾지 못했구나... <br/> 지금의 너는 아무 직업도 가질 수 없다.",
  }

  const publicAddress = localStorage.getItem("publicAddress")
  const navigate = useNavigate()
  const [member] = useRecoilState(memberAtom)
  const [trade, setTrade] = useRecoilState(tradeAtom)
  const [game, setGame] = useRecoilState(playingGame)
  const [music, setMusic] = useRecoilState(playingMusic)

  useEffect(() => {
    async function GetStory() {
      await http
        .get(`nft/result/address/${localStorage.getItem("publicAddress")}`)
        .then((res) => {
          setNFT(res.data)
          // console.log(res.data)
        })
    }
    GetStory()

    async function gameEnding() {
      const { data } = await http.post("game/endingCredit", {
        address: localStorage.getItem("publicAddress"),
      })
      setGame((prev) => {
        const variable = { ...prev }
        variable.endingCreditData = data
        return { ...variable }
      })
    }
    gameEnding()
  }, [])

  const canvasRef = useRef(null)
  const client = create({
    url: "https://j7a605.p.ssafy.io/ipfs/",
  })

  const copyDOM = async () => {
    window.scrollTo(0, 0)

    Swal.fire({
      text: "메타마스크에서 민팅을 승인해주세요.",
      showConfirmButton: false,
      icon: "warning",
      timer: 3000,
    })

    setTimeout(async () => {
      await setGame((prev) => {
        const variable = { ...prev }
        variable.endingCreditShow = true
        return { ...variable }
      })

      // 엔딩곡 변경
      await setMusic("End")
    }, 3000)

    let url = ""
    await html2canvas(canvasRef.current!).then(async (canvas) => {
      url = canvas.toDataURL("image/jpg")
      let arr = url.split(",")
      let mime = arr[0].match(/:(.*?);/)![1]
      let bstr = window.atob(arr[1])
      let n = bstr.length
      let u8arr = new Uint8Array(n)
      while (n--) {
        u8arr[n] = bstr.charCodeAt(n)
      }

      // 난수 생성 코드
      const file = new File([u8arr], `munggae.png`, { type: mime })
      const hash = await client.add(file)
      const imageURL = "https://ipfs.io/ipfs/" + hash.path

      // 이미지 URL
      // console.log("이미지 URL", imageURL)
      Object.assign(NFT, { url: imageURL })

      // 중요!
      // NFT 별 MetaData를 다르게 하기 위한 코드 2줄
      const nansu = new Date().getTime() + Math.random()
      Object.assign(NFT, { nansu: nansu })
      const newHash = await client.add(JSON.stringify(NFT))

      // NFT Token ID
      let nftTokenId
      const metadata = "https://ipfs.io/ipfs/" + newHash.path
      // console.log("메타데이터", metadata)
      const metadataURI = { metadata: metadata }
      Object.assign(NFT, { id: nftTokenId })
      Object.assign(NFT, metadataURI)

      const newNFT = {
        color: NFT.color,
        hair: NFT.hair,
        face: NFT.face,
        tier: NFT.tier,
        job: NFT.job,
        status: NFT.status,
        gender: NFT.gender,
        metadata: metadata,
        url: imageURL,
      }

      try {
        await MFTContract.methods
          .create("https://ipfs.io/ipfs/" + newHash.path)
          .send({ from: publicAddress })
          .then((res: any) => {
            nftTokenId = res.events.Transfer.returnValues.tokenId
            Object.assign(newNFT, { id: nftTokenId })
            // console.log("최종", newNFT)
          })

        await http
          .post(`nft/result/address/${publicAddress}`, newNFT)
          .then((response) => {
            // console.log("NFT DB에 저장되어 있는지 확인", response)
            navigate(`/personal/${publicAddress}/list`)
          })
          .catch((error) => console.error("안의 error", error))

        await Swal.fire({
          text: "민팅이 완료되었습니다.",
          showConfirmButton: false,
          icon: "success",
          timer: 3000,
        })

        await setGame((prev) => {
          const variable = { ...prev }
          variable.endingCreditShow = false
          return { ...variable }
        })
        // 다시 처음 곡으로 변경
        await setMusic("Start")

        navigate("/nft/list")
      } catch (err) {
        console.error("NFT 민팅 에러", err)
      }
    })
  }

  return (
    <div
      className="flex w-full h-full bg-cover rounded-3xl relative"
      style={{ backgroundImage: "url(/images/ending.jpg)" }}
    >
      {game.endingCreditShow === true ? (
        <div className="absolute top-[0] z-[100] w-full h-[65px] rounded-t-lg bg-beige-300 p-2">
          <p className="text-center font-semibold text-xl mapleStory text-brown-400">
            NFT 민팅이 완료되면 자동으로 페이지가 이동됩니다.
            <br /> 잠시만 기다려주세요!
          </p>
        </div>
      ) : null}

      {game.endingCreditShow === true ? (
        <GameEndingCredit></GameEndingCredit>
      ) : null}

      <div className="flex justify-center w-full bg-gradient-to-r from-[#ffffff00] via-[#ffffff00] to-white px-20 pl-24 rounded-3xl">
        <div className="flex items-center justify-center w-1/2 h-full">
          <div className="relative">
            <div ref={canvasRef} className="h-[400px] w-[400px] bg-blue-200">
              <img
                src={`/assets/bg/${NFT.job}.png`}
                className="h-[400px] absolute top-0 left-0"
              />
              <img
                src={`/assets/haircolor/${NFT.hair}_${NFT.color}.png`}
                className="h-[400px] absolute top-0 left-0"
              />
              <img
                src={`/assets/face/${NFT.face}.png`}
                className="h-[400px] absolute top-0 left-0"
              />
              <img
                src={`/assets/job/${NFT.job}.png`}
                className="h-[400px] absolute top-0 left-0"
              />
              <img
                src={`/assets/tier/${NFT.tier}.png`}
                className="h-[400px] absolute top-0 left-0"
              />
            </div>
          </div>
        </div>
        <div className="flex flex-col items-center justify-center w-1/2 to-white rounded-r-3xl">
          <div className="flex justify-center text-3xl font-bold mapleStory">
            {findKOR(NFT.job)} 멍멍이가 되었다!
          </div>
          <div className="flex justify-center pt-3 pb-8 text-sm leading-6 ridiBatang">
            {parse(comment[NFT.job])}
          </div>
          <div className="flex flex-col items-center justify-center w-full mapleStory">
            <EndingList name="직업" option={NFT.job} />
            <EndingList name="성별" option={NFT.gender} />
            <EndingList name="모질" option={NFT.hair} />
            <EndingList name="색상" option={NFT.color} />
            <EndingList name="얼굴" option={NFT.face} />
            <EndingList name="등급" option={NFT.tier} />
          </div>
          <button
            className="w-[300px] h-[50px] bg-pink-400 mt-10 rounded-full mapleStory text-xl font-bold text-beige-700 hover:bg-pink-600 hover:text-brown-900"
            onClick={copyDOM}
          >
            NFT 민팅하기
          </button>
        </div>
      </div>
    </div>
  )
}
