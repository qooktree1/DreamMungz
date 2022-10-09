import { useQueries, useQuery } from "@tanstack/react-query"
import { useState } from "react"
import { getDealHistory } from "../../api/nft"
import Pagination from "../pagination/Pagination"
import HistoryItem, { HistoryListHead } from "./HistoryListItem"

const items = [
  {
    id: 1,
    url: "metadata_url",
    type: "SELL",
    sellerNickname: "a12d2f3",
    sellerAddress: "0x23423423423423",
    buyerNickname: "sdf2de2",
    buyerAddress: "0x34234f3r324234",
    date: "2022-09-16",
    price: 12,
  },
  {
    id: 2,
    url: "metadata_url",
    type: "BUY",
    sellerNickname: "df2de2",
    sellerAddress: "0x34234f3r324234",
    buyerNickname: "a12d2f3",
    buyerAddress: "0x23423423423423",
    date: "yyyy-mm-dd",
    price: 12,
  },
  {
    id: 1,
    url: "metadata_url",
    type: "SELL",
    sellerNickname: "a12d2f3",
    sellerAddress: "0x23423423423423",
    buyerNickname: "sdf2de2",
    buyerAddress: "0x34234f3r324234",
    date: "2022-09-16",
    price: 12,
  },
  {
    id: 2,
    url: "metadata_url",
    type: "BUY",
    sellerNickname: "df2de2",
    sellerAddress: "0x34234f3r324234",
    buyerNickname: "a12d2f3",
    buyerAddress: "0x23423423423423",
    date: "yyyy-mm-dd",
    price: 12,
  },
  {
    id: 1,
    url: "metadata_url",
    type: "SELL",
    sellerNickname: "a12d2f3",
    sellerAddress: "0x23423423423423",
    buyerNickname: "sdf2de2",
    buyerAddress: "0x34234f3r324234",
    date: "2022-09-16",
    price: 12,
  },
  {
    id: 2,
    url: "metadata_url",
    type: "BUY",
    sellerNickname: "df2de2",
    sellerAddress: "0x34234f3r324234",
    buyerNickname: "a12d2f3",
    buyerAddress: "0x23423423423423",
    date: "yyyy-mm-dd",
    price: 12,
  },
]
const thead = {
  id: "ID",
  price: "가격",
  type: " 거래 종류 ",
  date: "거래 날짜 ",
}

type dealItemType = {
  id: number
  url: string
  metadata: string
  type: string
  sellerNickname: string
  sellerAddress: string
  buyerNickname: string
  buyerAddress: string
  date: string
  price: number
}

const NftHistoryList = ({ address }: { address: string }) => {
  const [page, setPage] = useState(0)
  const { data } = useQuery(["DealList", page], () =>
    getDealHistory(address, page)
  )

  return (
    <div className="relative flex flex-col items-center justify-center w-full h-full pb-1 text-center ">
      <div className="w-4/5 space-y-4 h-[80%] ">
        <HistoryListHead item={thead} />
        {data && data.items.length === 0 && (
          <div className=" py-28">거래 내역이 존재하지 않습니다.</div>
        )}
        {data &&
          data.items.map((item: dealItemType, idx: number) => {
            const deal = { ...item, date: item.date.split(" ")[0] }
            return <HistoryItem item={deal} key={idx} />
          })}

        {/* {items.map((item, idx: number) => {
          const deal = { ...item, date: item.date.split(" ")[0] }
          return <HistoryItem item={deal} key={idx} />
        })} */}
      </div>
      {data?.totalPage >= 0 && (
        <Pagination
          page={page}
          setPage={setPage}
          totalPage={data.totalPage + 1}
        />
      )}
    </div>
  )
}

export default NftHistoryList
