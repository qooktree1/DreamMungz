import React from "react"
import { useNavigate } from "react-router-dom"
import { useRecoilState } from "recoil"
import tradeAtom from "../../recoil/trade/atom"
import memberAtom from "../../recoil/member/atom"
import { getBalance } from "../../utils/web3"

const tmp = [
  {
    cancel: false,
    choice: false,
    offerAddress: "dffffff",
    offerDate: "2022-10-2",
    offerId: 13,
    offerNickname: "천재지영",
    offerPrice: 3000,
    refund: false,
    tokenId: 12,
    tradeId: 3,
  },
  {
    cancel: false,
    choice: false,
    offerAddress: "dffffff",
    offerDate: "2022-10-2",
    offerId: 13,
    offerNickname: "천재지영",
    offerPrice: 3000,
    refund: false,
    tokenId: 12,
    tradeId: 3,
  },
  {
    cancel: false,
    choice: false,
    offerAddress: "dffffff",
    offerDate: "2022-10-2",
    offerId: 13,
    offerNickname: "천재지영",
    offerPrice: 3000,
    refund: false,
    tokenId: 12,
    tradeId: 3,
  },
  {
    cancel: false,
    choice: false,
    offerAddress: "dffffff",
    offerDate: "2022-10-2",
    offerId: 13,
    offerNickname: "천재지영",
    offerPrice: 3000,
    refund: false,
    tokenId: 12,
    tradeId: 3,
  },
  {
    cancel: false,
    choice: false,
    offerAddress: "dffffff",
    offerDate: "2022-10-2",
    offerId: 13,
    offerNickname: "천재지영",
    offerPrice: 3000,
    refund: false,
    tokenId: 12,
    tradeId: 3,
  },
  {
    cancel: false,
    choice: false,
    offerAddress: "dffffff",
    offerDate: "2022-10-2",
    offerId: 13,
    offerNickname: "천재지영",
    offerPrice: 3000,
    refund: false,
    tokenId: 12,
    tradeId: 3,
  },
  {
    cancel: false,
    choice: false,
    offerAddress: "dffffff",
    offerDate: "2022-10-2",
    offerId: 13,
    offerNickname: "천재지영",
    offerPrice: 3000,
    refund: false,
    tokenId: 12,
    tradeId: 3,
  },
  {
    cancel: false,
    choice: false,
    offerAddress: "dffffff",
    offerDate: "2022-10-2",
    offerId: 13,
    offerNickname: "천재지영",
    offerPrice: 3000,
    refund: false,
    tokenId: 12,
    tradeId: 3,
  },
]

export default function OfferHistory(info: any, publicAddress: string) {
  const navigate = useNavigate()
  const [, setTrade] = useRecoilState(tradeAtom)
  const [, setMember] = useRecoilState(memberAtom)

  return (
    <div className="w-full ">
      <p className="mb-2 text-2xl font-semibold text-center text-brown-400">
        가격 제안 이력
      </p>
      <div className="w-full bg-transparent h-[90%] shadow-sm text-sm ">
        {/* {info ? ( */}
        {info && info.info.offer.length > 0 ? (
          <div className="h-[150px] ">
            <div className="rounded-t-lg bg-lgBrown-400">
              <div className="flex w-full p-2">
                <p className="w-[30%] pl-2">가격</p>
                <p className="w-[30%]">제안자</p>
                <p>가격 제안 날짜</p>
              </div>
            </div>
            <ul className="h-full overflow-y-auto scrollbar-hide">
              {/* {tmp.map( */}
              {info.info.offer.map(
                (
                  {
                    cancel,
                    choice,
                    offerAddress,
                    offerDate,
                    offerId,
                    offerNickname,
                    offerPrice,
                    refund,
                    tokenId,
                    tradeId,
                  }: {
                    cancel: boolean
                    choice: boolean
                    offerAddress: string
                    offerDate: string
                    offerId: number
                    offerNickname: string
                    offerPrice: number
                    refund: boolean
                    tokenId: number
                    tradeId: number
                  },
                  index: number
                ) => {
                  return (
                    <li
                      key={index}
                      className="relative my-1 bg-white rounded-sm shadow-xl last:rounded-b-lg"
                    >
                      <div className="flex w-full p-1">
                        <div className="w-[30%] pl-2">
                          {String(offerPrice).replace(
                            /\B(?=(\d{3})+(?!\d))/g,
                            ","
                          )}{" "}
                          M
                        </div>

                        <div
                          className="w-[30%] text-lgBrown-600 hover:text-lgBrown-700 cursor-pointer"
                          onClick={() => {
                            navigate(`/personal/${offerAddress}`)
                          }}
                        >
                          {offerNickname}
                        </div>
                        <div>{offerDate.slice(0, 10)}</div>

                        {offerAddress === info.publicAddress ? (
                          <div
                            className="absolute ml-3 cursor-pointer hover:scale-110 right-5"
                            onClick={async () => {
                              const receivedBalance = await getBalance()
                              setMember((prev: any) => {
                                const variable = { ...prev }
                                variable.walletBalance = receivedBalance
                                return { ...variable }
                              })
                              setTrade((prev: any) => {
                                const variable = { ...prev }
                                variable.modalOpen4 = true
                                variable.selectedOfferId = offerId
                                return { ...variable }
                              })
                            }}
                          >
                            ❌
                          </div>
                        ) : null}
                        {info.info.sellerAddress === info.publicAddress ? (
                          <div
                            className="ml-3 cursor-pointer hover:scale-110"
                            onClick={() => {
                              setTrade((prev) => {
                                const variable = { ...prev }
                                variable.modalOpen5 = true
                                variable.selectedOfferId = offerId
                                return { ...variable }
                              })
                            }}
                          >
                            ✅
                          </div>
                        ) : null}
                      </div>
                    </li>
                  )
                }
              )}
            </ul>
          </div>
        ) : (
          <div className="h-[200px] text-center  leading-[200px] border-2 border-brown-200 rounded-lg text-brown-300">
            가격 제안 내역이 없습니다.
          </div>
        )}
      </div>
    </div>
  )
}
