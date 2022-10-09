import React, { useState } from "react"
import { useNavigate } from "react-router-dom"
import tradeAtom from "../../recoil/trade/atom"
import { useRecoilState } from "recoil"

interface OfferHistoryItem {
  cancel: boolean
  choice: boolean
  offerAddress: string
  offerDate: string
  offerId: number
  offerNickname: number
  offerPrice: number
  refund: boolean
  tokenId: number
  tradeId: number
  url: string
}

export const OfferHistoryListHead = ({ item }: any) => {
  const { id, type, date, price } = item

  return (
    <div className="bg-white  flex  w-full space-x-1 h-[50px]  items-cente justify-around leading-[50px]  font-semibold rounded-2xl shadow-md ">
      <div className=" w-[40px]">{id}</div>
      <div className=" w-[45px]">NFT</div>
      <div className=" w-[100px]">{type}</div>
      <div className=" w-[100px]">{price} </div>
      <div className=" w-[100px]">거래자</div>
      <div className=" w-[120px]">{date}</div>
    </div>
  )
}

const OfferHistoryItem = ({ ...props }) => {
  const {
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
    url,
  } = props.item

  const navigate = useNavigate()
  const [trade, setTrade] = useRecoilState(tradeAtom)

  const movePage = () => {
    navigate(`/nft/detail/${tokenId}`)
  }

  return (
    <div className="bg-white  flex  w-full space-x-1 h-[50px]  items-center justify-around leading-[50px]  rounded-2xl shadow-md">
      <div className=" w-[40px]">{tokenId}</div>
      <img
        onClick={movePage}
        src={url}
        className="w-[45px] h-[45px] cursor-pointer"
      />
      <div className=" w-[100px]">
        {refund ? (
          <span className="text-blue-500">환불 완료</span>
        ) : refund === false && choice === false && cancel === false ? (
          <span
            className="z-10 text-red-500 cursor-pointer hover:font-semibold"
            onClick={async () => {
              await setTrade((prev) => {
                const variable = { ...prev }
                variable.modalOpen4 = true
                variable.clickedOfferId = offerId
                variable.clickedTradeId = tradeId
                variable.clickedTokenId = tokenId
                return { ...variable }
              })
            }}
          >
            취소 가능
          </span>
        ) : refund === false && choice === false && cancel === true ? (
          <span
            className="z-10 text-red-500 cursor-pointer hover:font-semibold"
            onClick={() => {
              setTrade((prev) => {
                const variable = { ...prev }
                variable.modalOpen7 = true
                variable.clickedOfferId = offerId
                variable.clickedTradeId = tradeId
                variable.clickedTokenId = tokenId
                return { ...variable }
              })
            }}
          >
            환불 가능
          </span>
        ) : refund === false && choice === true ? (
          <span className="text-gray-500">채택됨</span>
        ) : null}
      </div>
      <div className=" w-[100px]">{offerPrice} M </div>
      <div className=" w-[100px]">{offerNickname}</div>
      <div className=" w-[120px]">{offerDate.slice(0, 10)}</div>
    </div>
  )
}

export default OfferHistoryItem
