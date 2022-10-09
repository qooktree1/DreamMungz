import React, { useEffect, useState } from "react"
import { useNavigate, useLocation } from "react-router-dom"
import { faArrowLeft } from "@fortawesome/free-solid-svg-icons"
import { useRecoilState } from "recoil"
import { MFTContract } from "../utils/Web3Config"
import { getBalance } from "../utils/web3"
import Modal from "../components/modal/Modal"
import SpinnerModal from "../components/modal/SpinnerModal"
import TradeHistory from "../components/nftDetail/TradeHistory"

import {
  sellFormat,
  buyNowFormat,
  sellAbortFormat,
  acceptNegoFormat,
  cancelNegoFormat,
  proposalFormat,
} from "../components/nftDetail/tradeFormat"
import { getNftDetail } from "../api/nft"
import NftMainDetail from "../components/nftDetail/NftMainDetail"
import NftTradeButton from "../components/nftDetail/NftTradeButton"
import memberAtom from "../recoil/member/atom"
import tradeAtom from "../recoil/trade/atom"
import OfferHistory from "../components/nftDetail/OfferHistory"
import Spinner from "../components/spinner/Spinner"
import "../components/button/NegativeBtn.css"
import "../components/button/PositiveBtn.css"
import "../components/button/NeutralBtn.css"
import "../components/button/switch.css"
import { http } from "../api/axios"
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome"
import { faArrowRightArrowLeft } from "@fortawesome/free-solid-svg-icons"

export default function NftDetail() {
  const [member, setMember] = useRecoilState(memberAtom)
  const [trade, setTrade] = useRecoilState(tradeAtom)
  const navigate = useNavigate()
  const location = useLocation()
  const tokenId: number = parseInt(location.pathname.split("/")[3])
  const publicAddress: any = localStorage.getItem("publicAddress")

  // NFT 정보
  const [nftInfo, setNftInfo] = useState<any>(undefined)
  const [negoAble, setNegoAble] = useState(false) // 판매 등록 정보

  const [balance, setBalance] = useState(0) // 본인 지갑
  useEffect(() => {
    setBalance(member.walletBalance)
  }, [member])

  const [nftOwnerAddress, setNftOwnerAddress] = useState("") // NFT 주인 Address
  const [showMessage1, setShowMessage1] = useState(false)
  const [showMessage2, setShowMessage2] = useState(false)
  const [showMessage3, setShowMessage3] = useState(false)
  const [showMessage4, setShowMessage4] = useState(false)

  useEffect(() => {
    getNftDetailFunction(tokenId)
    setTrade((prev) => {
      const variable = { ...prev }
      variable.isSellingForm = false
      return { ...variable }
    })
  }, [])

  // 해당 NFT의 모든 정보 nftInfo로 저장
  async function getNftDetailFunction(tokenId: number) {
    // const getAllNftDetail: any = await getNftDetail({ tokenId })
    const data = await getNftDetail(tokenId)
    await setNftInfo(data)
    await setTrade((prev) => {
      const variable = { ...prev }
      variable.buyNowPrice = data.nft.price
      return { ...variable }
    })
  }

  // NFT의 주인이 나인지 확인하는 함수
  async function checkIsOwner({ tokenId }: { tokenId: number }) {
    const tmp = await MFTContract.methods.ownerOf(tokenId).call()
    setNftOwnerAddress(tmp)
  }
  useEffect(() => {
    checkIsOwner({ tokenId })
  }, [])

  // console.log(localStorage.getItem("publicAddress"))
  return (
    <div className="w-full h-full p-4 overflow-hidden mapleStory">
      <div
        className="absolute z-10 cursor-pointer top-5 text-brown-400"
        onClick={() => navigate(-1)}
      >
        <FontAwesomeIcon icon={faArrowLeft} /> 뒤로가기
      </div>
      {/* 스피너 모달 시작 */}
      <SpinnerModal
        isOpen={trade.modalOpen6}
        modalClose={() => {
          setTrade((prev) => {
            const variable = { ...prev }
            variable.modalOpen6 = false
            return { ...variable }
          })
        }}
      >
        <Spinner />
        <div className="text-2xl font-semibold absolute mt-[70%]">
          <p className="">NFT 거래중..</p>
        </div>
      </SpinnerModal>
      {/* 스피너 모달 끝 */}

      {/* 판매 중지 모달 시작 (확인 필요) */}
      <Modal
        isOpen={trade.modalOpen1}
        modalClose={() => {
          setTrade((prev) => {
            const variable = { ...prev }
            variable.modalOpen1 = false
            return { ...variable }
          })
        }}
      >
        <p className="mb-6 text-3xl font-semibold text-center">
          판매를 중지하시겠습니까?
        </p>

        <div className="flex justify-center">
          <button
            className="mr-5 bg-red-300 w-[140px] rounded-xl text-lg py-2 font-bold border-2 border-white shadow-md hover:bg-red-500"
            onClick={async () => {
              const receivedBalance = await getBalance()
              await setBalance(receivedBalance)
              await setTrade((prev) => {
                const variable = { ...prev }
                variable.modalOpen1 = false
                variable.modalOpen6 = true
                return { ...variable }
              })
              await sellAbortFormat(tokenId, publicAddress)
              await setTrade((prev) => {
                const variable = { ...prev }
                variable.modalOpen1 = false
                variable.modalOpen6 = false
                return { ...variable }
              })
            }}
          >
            중지
          </button>
          <button
            className="bg-blue-300 w-[140px] rounded-xl text-lg py-2 font-bold border-2 border-white shadow-md hover:bg-blue-500"
            onClick={() =>
              setTrade((prev) => {
                const variable = { ...prev }
                variable.modalOpen1 = false
                return { ...variable }
              })
            }
          >
            닫기
          </button>
        </div>
      </Modal>
      {/* 판매 중지 모달 끝 */}

      {/* 즉시 구매 모달 시작 (수정 완료) */}
      <Modal
        isOpen={trade.modalOpen2}
        modalClose={() =>
          setTrade((prev) => {
            const variable = { ...prev }
            variable.modalOpen2 = false
            return { ...variable }
          })
        }
      >
        <div className="flex flex-col items-center">
          <p className="mb-6 text-3xl font-semibold text-center">
            즉시 구매하시겠습니까?
          </p>
          <div className="flex text-lg mb-2 w-[280px] justify-center">
            <p className="w-[50%]">즉시 구매 가격</p>
            <p className=" w-[50%] text-end">
              {String(nftInfo?.price).replace(/\B(?=(\d{3})+(?!\d))/g, ",")} M
            </p>
          </div>
          <div className="flex text-lg mb-2 w-[280px] justify-center">
            <p className="w-[50%]">나의 소지 금액</p>
            <p className="w-[50%] text-end">
              {String(balance).replace(/\B(?=(\d{3})+(?!\d))/g, ",")} M
            </p>
          </div>

          {/* 에러 메시지 1 */}
          {showMessage1 ? (
            <p className="text-medium ml-[60px] text-red-600">
              지갑에 MUNG이 부족합니다!
            </p>
          ) : null}

          <div className="flex justify-center mt-10 ">
            <button
              className="mr-5 bg-blue-300 w-[140px] rounded-xl text-lg py-2 font-bold border-2 border-white shadow-md hover:bg-blue-500"
              onClick={async () => {
                const receivedBalance = await getBalance()
                await setBalance(receivedBalance)
                const cost = nftInfo?.price
                if (receivedBalance < cost) {
                  setShowMessage1(true)
                  setTimeout(() => {
                    setShowMessage1(false)
                  }, 4000)
                } else {
                  await setTrade((prev) => {
                    const variable = { ...prev }
                    variable.modalOpen2 = false
                    variable.modalOpen6 = true
                    return { ...variable }
                  })

                  await buyNowFormat(balance, cost, tokenId, publicAddress)
                  await setTrade((prev) => {
                    const variable = { ...prev }
                    variable.modalOpen6 = false
                    return { ...variable }
                  })
                }
              }}
            >
              구매
            </button>
            <button
              className="bg-red-300 w-[140px] rounded-xl text-lg py-2 font-bold border-2 border-white shadow-md hover:bg-red-500"
              onClick={() => {
                setTrade((prev) => {
                  const variable = { ...prev }
                  variable.modalOpen2 = false
                  return { ...variable }
                })
              }}
            >
              닫기
            </button>
          </div>
        </div>
      </Modal>
      {/* 즉시 구매 모달 끝 (수정 완료) */}

      {/* 가격 제안하기 모달 시작 */}
      <Modal
        isOpen={trade.modalOpen3}
        modalClose={() =>
          setTrade((prev) => {
            const variable = { ...prev }
            variable.modalOpen3 = false
            return { ...variable }
          })
        }
      >
        <div className="flex flex-col items-center">
          <p className="mb-6 text-3xl font-semibold text-center">
            제안할 가격을 입력해주세요.
          </p>

          <div className="flex text-lg mb-2 w-[280px] justify-center">
            <p className="w-[50%]">현재 보유 금액</p>
            <p className=" w-[50%] text-end">
              {String(balance).replace(/\B(?=(\d{3})+(?!\d))/g, ",")} M
            </p>
          </div>

          <div className="flex text-lg mb-2 w-[280px] justify-center">
            <p className="w-[50%]">제안 금액</p>
            <input
              className="border border-black mr-1 w-[50%]"
              id="proposal"
              type="text"
              onChange={async (e) => {
                e.target.value = e.target.value
                  .replace(/[^0-9.]/g, "")
                  .replace(/(\..*)\./g, "$1")
                  .replace(/\B(?=(\d{3})+(?!\d))/g, ",")

                await setTrade((prev) => {
                  const variable = { ...prev }
                  variable.offerPrice = Number(
                    e.target.value.split(",").join("")
                  )
                  return { ...variable }
                })
              }}
            />
            <label htmlFor="proposal">M</label>
          </div>

          {/* 에러 메시지 2 */}
          {showMessage2 ? (
            <p className="text-medium ml-[60px] text-red-600">
              1 MUNG 이상 제안하셔야 합니다. 다시 입력해주세요!
            </p>
          ) : null}

          {/* 에러 메시지 2 */}
          {showMessage3 ? (
            <p className="text-medium ml-[60px] text-red-600">
              지갑에 MUNG이 부족합니다!
            </p>
          ) : null}

          <div className="flex justify-center mt-10">
            <button
              className="mr-5 bg-blue-300 w-[140px] rounded-xl text-lg py-2 font-bold border-2 border-white shadow-md hover:bg-blue-500"
              onClick={async () => {
                const proposal = trade.offerPrice
                const receivedBalance = await getBalance()
                await setBalance(receivedBalance)
                if (String(proposal) == "NaN" || proposal === 0) {
                  setShowMessage2(true)
                  setTimeout(() => {
                    setShowMessage2(false)
                  }, 4000)
                } else if (proposal > balance) {
                  setShowMessage3(true)
                  setTimeout(() => {
                    setShowMessage3(false)
                  }, 4000)
                } else {
                  await setTrade((prev) => {
                    const variable = { ...prev }
                    variable.modalOpen3 = false
                    variable.modalOpen6 = true
                    return { ...variable }
                  })
                  await proposalFormat(
                    balance,
                    proposal,
                    tokenId,
                    publicAddress
                  )
                  await setTrade((prev) => {
                    const variable = { ...prev }
                    variable.modalOpen6 = false
                    return { ...variable }
                  })
                }
              }}
            >
              제안
            </button>
            <button
              className="bg-red-300 w-[140px] rounded-xl text-lg py-2 font-bold border-2 border-white shadow-md hover:bg-red-500"
              onClick={() => {
                setTrade((prev) => {
                  const variable = { ...prev }
                  variable.modalOpen3 = false
                  return { ...variable }
                })
              }}
            >
              닫기
            </button>
          </div>
        </div>
      </Modal>
      {/* 가격 제안하기 모달 끝 */}

      {/* 가격 제안취소 모달 시작 */}
      <Modal
        isOpen={trade.modalOpen4}
        modalClose={() =>
          setTrade((prev) => {
            const variable = { ...prev }
            variable.modalOpen4 = false
            return { ...variable }
          })
        }
      >
        <p className="mb-4 text-3xl font-semibold text-center">
          제안을 취소하시겠습니까?
        </p>
        <div className="flex justify-center mt-10">
          <button
            className="mr-5 bg-blue-300 w-[140px] rounded-xl text-lg py-2 font-bold border-2 border-white shadow-md hover:bg-blue-500"
            onClick={async () => {
              const clickedNegoId = trade.selectedOfferId
              await setTrade((prev) => {
                const variable = { ...prev }
                variable.modalOpen4 = false
                variable.modalOpen6 = true
                return { ...variable }
              })
              await cancelNegoFormat(clickedNegoId, publicAddress, tokenId)
              await setTrade((prev) => {
                const variable = { ...prev }
                variable.modalOpen6 = false
                return { ...variable }
              })
            }}
          >
            취소
          </button>
          <button
            className="bg-red-300 w-[140px] rounded-xl text-lg py-2 font-bold border-2 border-white shadow-md hover:bg-red-500"
            onClick={() => {
              setTrade((prev) => {
                const variable = { ...prev }
                variable.modalOpen4 = false
                return { ...variable }
              })
            }}
          >
            닫기
          </button>
        </div>
      </Modal>
      {/* 가격 제안취소 모달 끝 */}

      {/* 가격 제안수락 모달 시작 */}
      <Modal
        isOpen={trade.modalOpen5}
        modalClose={() => {
          setTrade((prev) => {
            const variable = { ...prev }
            variable.modalOpen5 = false
            return { ...variable }
          })
        }}
      >
        <p className="mb-4 text-3xl font-semibold text-center">
          제안을 수락하시겠습니까?
        </p>
        <div className="flex justify-center mt-10">
          <button
            className="mr-5 bg-blue-300 w-[140px] rounded-xl text-lg py-2 font-bold border-2 border-white shadow-md hover:bg-blue-500"
            onClick={async () => {
              const negoId = trade.selectedOfferId

              // spinner 시작
              await setTrade((prev) => {
                const variable = { ...prev }
                variable.modalOpen5 = false
                variable.modalOpen6 = true
                return { ...variable }
              })

              await acceptNegoFormat(tokenId, negoId, publicAddress)

              // spinner 종료
              await setTrade((prev) => {
                const variable = { ...prev }
                variable.modalOpen6 = false
                return { ...variable }
              })
            }}
          >
            수락
          </button>
          <button
            className="bg-red-300 w-[140px] rounded-xl text-lg py-2 font-bold border-2 border-white shadow-md hover:bg-red-500"
            onClick={() => {
              setTrade((prev) => {
                const variable = { ...prev }
                variable.modalOpen5 = false
                return { ...variable }
              })
            }}
          >
            닫기
          </button>
        </div>
      </Modal>
      {/* 가격 제안수락 모달 끝 */}

      {/* 판매 등록 모달 시작 (수정 완료) */}
      <Modal
        isOpen={trade.modalOpen8}
        modalClose={() => {
          setTrade((prev) => {
            const variable = { ...prev }
            variable.modalOpen8 = false
            return { ...variable }
          })
        }}
      >
        <div className="flex flex-col items-center">
          <p className="text-3xl font-semibold text-center mb-6">
            판매 정보를 입력해주세요
          </p>

          <div className="flex mb-4 text-lg">
            <p className="mr-[20px]">즉시 구매 가격</p>
            <input
              id="price"
              type="text"
              className="border w-[150px]"
              onChange={(e: any) => {
                e.target.value = e.target.value
                  .replace(/[^0-9.]/g, "")
                  .replace(/(\..*)\./g, "$1")
                  .replace(/\B(?=(\d{3})+(?!\d))/g, ",")

                setTrade((prev) => {
                  const variable = { ...prev }
                  variable.buyNowPrice = Number(
                    e.target.value.split(",").join("")
                  )
                  return { ...variable }
                })
              }}
            />
            <label htmlFor="price" className="ml-2">
              M
            </label>
          </div>
          <div className="flex flex-col justify-center">
            <div className="flex text-lg relative w-[294px]">
              <span className="absolute left-0">가격 제안 유무</span>
              <div className="can-toggle absolute left-40">
                <input
                  className=""
                  id="a"
                  type="checkbox"
                  onClick={() => {
                    if (negoAble) {
                      setNegoAble(false)
                    } else {
                      setNegoAble(true)
                    }
                  }}
                />
                <label htmlFor="a">
                  <div
                    className="can-toggle__switch"
                    data-checked="가능"
                    data-unchecked="불가능"
                  ></div>
                </label>
              </div>
            </div>
          </div>
          <div className="flex justify-center mt-10 mapleStory">
            <button
              type="submit"
              className="mr-5 bg-blue-300 w-[140px] rounded-xl text-lg py-2 font-bold border-2 border-white shadow-md hover:bg-blue-500"
              onClick={async () => {
                const receivedBalance = await getBalance()
                await setMember((prev: any) => {
                  const variable = { ...prev }
                  variable.walletBalance = receivedBalance
                  return { ...variable }
                })
                const buyNowPrice = trade.buyNowPrice
                await setTrade((prev: any) => {
                  const variable = { ...prev }
                  variable.modalOpen6 = true
                  variable.modalOpen8 = false
                  return { ...variable }
                })
                await sellFormat(publicAddress, negoAble, tokenId, buyNowPrice)
                await setTrade((prev: any) => {
                  const variable = { ...prev }
                  variable.modalOpen6 = false
                  return { ...variable }
                })
              }}
            >
              판매 등록
            </button>

            <button
              className="bg-red-300 w-[140px] rounded-xl text-lg py-2 font-bold border-2 border-white shadow-md hover:bg-red-500"
              onClick={() => {
                setTrade((prev) => {
                  const variable = { ...prev }
                  variable.modalOpen8 = false
                  variable.isSellingForm = false
                  return { ...variable }
                })
              }}
            >
              닫기
            </button>
          </div>
        </div>
      </Modal>
      {/* 판매 등록 모달 끝 (수정 완료) */}

      {nftInfo !== undefined ? (
        <div className="w-full h-full rounded-lg ">
          <div className="w-full rounded-lg bg-beige-500 h-[40px] p-2 px-3 text-lg flex justify-between mb-2">
            <div className="">
              <span
                className="cursor-pointer text-lgBrown-600 hover:border-b-2 border-b-lgBrown-500"
                onClick={() => navigate(`/personal/${nftInfo.sellerAddress}`)}
              >
                {nftInfo.sellerNickname}{" "}
              </span>
              님의 강아지
            </div>
            <div> 멍개 no.{nftInfo.nft.id}</div>
          </div>
          <div className="flex items-center w-full h-[550px]">
            <div className="w-1/2 h-full py-3 mr-4 rounded-lg shadow-sm bg-beige-400 ">
              <div className="flex justify-center w-full p-4 pb-0">
                <img
                  className="w-[250px] h-[250px] bg-white rounded-lg border-4 border-white  shadow-sm"
                  src={nftInfo.nft.url}
                  alt="NFT 이미지"
                />
              </div>

              <div className="w-full mt-3 ">
                {/* NFT 판매 버튼 - 판매 시작, 판매 중단, 즉시 구매, 오퍼 신청 */}
                <NftTradeButton
                  nftOwnerAddress={nftOwnerAddress}
                  publicAddress={publicAddress}
                  info={nftInfo}
                />
                {/* NFT 주요 정보 */}
                <NftMainDetail
                  info={nftInfo}
                  publicAddress={publicAddress}
                  nftOwnerAddress={nftOwnerAddress}
                />
              </div>
            </div>
            <div className="w-1/2 h-full py-3 rounded-lg shadow-sm bg-beige-400">
              {/* 거래 이력 & 오퍼리스트 출력 */}
              <div className="w-full h-full p-4 space-y-4">
                <TradeHistory info={nftInfo} />

                <OfferHistory info={nftInfo} publicAddress={publicAddress} />
              </div>
            </div>

            {/* NFT 이미지 */}
          </div>
        </div>
      ) : null}
    </div>
  )
}
