// import { useRecoilValue } from "recoil"

interface NftListItemProp {
  sellerNickname: string
  sellerAddress: string
  buyerNickname: string
  buyerAddress: string
  date: string
  price: number
}

const NftListItem2 = ({
  sellerNickname,
  sellerAddress,
  buyerNickname,
  buyerAddress,
  date,
  price,
}: NftListItemProp) => {
  return (
    <div>
      <div className="flex">
        <p className="w-[20%]">{price}</p>
        <p className="w-[20%]">{sellerNickname}</p>
        <p className="w-[30%]">{buyerNickname}</p>
        <p>{date}</p>
      </div>
    </div>
  )
}

export default NftListItem2
