import React from "react"
import { useNavigate } from "react-router-dom"

const tmp = [
  {
    buyerAddress: "천재지영",
    buyerNickname: "aaaa",
    sellerAddress: "aaaa",
    sellerNickname: "진짜천재지영",
    tradeDate: "2022-10-03",
    tradeId: 14,
    tradePrice: 3000,
  },
  {
    buyerAddress: "천재지영",
    buyerNickname: "aaaa",
    sellerAddress: "aaaa",
    sellerNickname: "진짜천재지영",
    tradeDate: "2022-10-03",
    tradeId: 14,
    tradePrice: 3000,
  },
  {
    buyerAddress: "천재지영",
    buyerNickname: "aaaa",
    sellerAddress: "aaaa",
    sellerNickname: "진짜천재지영",
    tradeDate: "2022-10-03",
    tradeId: 14,
    tradePrice: 3000,
  },
  {
    buyerAddress: "천재지영",
    buyerNickname: "aaaa",
    sellerAddress: "aaaa",
    sellerNickname: "진짜천재지영",
    tradeDate: "2022-10-03",
    tradeId: 14,
    tradePrice: 3000,
  },
  {
    buyerAddress: "천재지영",
    buyerNickname: "aaaa",
    sellerAddress: "aaaa",
    sellerNickname: "진짜천재지영",
    tradeDate: "2022-10-03",
    tradeId: 14,
    tradePrice: 3000,
  },
  {
    buyerAddress: "천재지영",
    buyerNickname: "aaaa",
    sellerAddress: "aaaa",
    sellerNickname: "진짜천재지영",
    tradeDate: "2022-10-03",
    tradeId: 14,
    tradePrice: 3000,
  },
]

export default function TradeHistory(info: any) {
  const navigate = useNavigate()
  return (
    <div className="rounded-lg h-1/2">
      <p className="mb-2 text-2xl font-semibold text-center text-brown-400">
        거래 이력
      </p>
      <div className="w-full h-[90%] bg-transparent text-sm">
        {info && info.info.trade.length > 0 ? (
          // {info ? (
          <div className="h-[160px]   ">
            <div className="flex w-full rounded-t-lg bg-lgBrown-400">
              <div className="flex w-full p-2">
                <p className="w-[20%]">가격</p>
                <p className="w-[30%]">판매자</p>
                <p className="w-[25%]">구매자</p>
                <p>거래 날짜</p>
              </div>
            </div>
            <ul className="h-full overflow-y-auto scrollbar-hide">
              {info.info.trade.map(
                // {tmp.map(
                ({
                  buyerAddress,
                  buyerNickname,
                  sellerAddress,
                  sellerNickname,
                  tradeDate,
                  tradeId,
                  tradePrice,
                }: {
                  buyerAddress: string
                  buyerNickname: string
                  sellerAddress: string
                  sellerNickname: string
                  tradeDate: string
                  tradeId: number
                  tradePrice: number
                }) => {
                  return (
                    <li
                      key={tradeId}
                      className="my-1 bg-white rounded-sm shadow-xl last:rounded-b-lg"
                    >
                      <div className="flex w-full p-1">
                        <div className="w-[20%]">
                          {String(tradePrice).replace(
                            /\B(?=(\d{3})+(?!\d))/g,
                            ","
                          )}{" "}
                          M
                        </div>

                        <div
                          className="w-[30%] text-lgBrown-600 hover:text-lgBrown-700 cursor-pointer"
                          onClick={() => {
                            navigate(`/personal/${sellerAddress}`)
                          }}
                        >
                          {sellerNickname}
                        </div>
                        <div
                          className="w-[25%] text-lgBrown-600 hover:text-lgBrown-700 cursor-pointer"
                          onClick={() => {
                            navigate(`/personal/${buyerAddress}`)
                          }}
                        >
                          {buyerNickname}
                        </div>
                        <div>{tradeDate.slice(0, 10)}</div>
                      </div>
                    </li>
                  )
                }
              )}
            </ul>
          </div>
        ) : (
          <div className="h-[200px] text-center  leading-[200px] border-2 border-brown-200 rounded-lg text-brown-300">
            거래 내역이 없습니다.
          </div>
        )}
      </div>
    </div>
  )
}
