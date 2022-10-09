import { useNavigate } from "react-router-dom"

interface HistoryItem {
  id: number
  url: string
  type: string
  sellerNickname: string
  sellerAddress: string
  buyerNickname: string
  buyerAddress: string
  date: string
  price: string
}

export const HistoryListHead = ({ item }: any) => {
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

const HistoryItem = ({ ...props }) => {
  const navigate = useNavigate()
  const { id, url, type, sellerNickname, buyerNickname, date, price } =
    props.item

  const movePage = () => {
    navigate(`/nft/detail/${id}`)
  }

  return (
    <div
      onClick={movePage}
      className="bg-white  flex  w-full space-x-1 h-[50px]  items-cente justify-around leading-[50px]  rounded-2xl shadow-md cursor-pointer"
    >
      <div className=" w-[40px]">{id}</div>
      <img src={url} className="w-[45px] h-[45px] " />
      <div className=" w-[100px]">
        {type === "BUY" ? (
          <span className="text-blue-500">구매</span>
        ) : (
          <span className="text-red-500">판매</span>
        )}
      </div>
      <div className=" w-[100px]">{price} M </div>
      <div className=" w-[100px]">
        {type === "BUY" ? sellerNickname : buyerNickname}
      </div>
      <div className=" w-[120px]">{date}</div>
    </div>
  )
}

export default HistoryItem
