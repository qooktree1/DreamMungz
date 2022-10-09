import { faCoins } from "@fortawesome/free-solid-svg-icons"
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome"
import { useNavigate } from "react-router"
import { useRecoilValue } from "recoil"
import listModeAtom from "../../recoil/list/atom"
import Gender, { LargeGender } from "../nftInfo/Gender"
import { StatType } from "../nftInfo/Stat"
import StatList from "../nftInfo/StatList"
import Tier from "../nftInfo/Tier"

const borderColor: { [index: string]: string } = {
  NORMAL: "border-gray-400",
  RARE: "border-amber-300",
  EPIC: "  border-sky-400  ",
  UNIQUE: "border-rose-300 ",
  LEGENDARY: "  border-lime-500 ",
}

const formatPrice = (price: number) => {
  return price
    .toString()
    .replace(/[^0-9.]/g, "")
    .replace(/(\..*)\./g, "$1")
    .replace(/\B(?=(\d{3})+(?!\d))/g, ",")
}

export interface NftListItemType {
  id: number
  url: string
  metadata: string
  job: string
  hair: string
  tier: string
  color: string
  gender: string
  face: string
  sell: boolean
  status: StatType[]
  price: number
}

const NftListItem = ({ item }: { item: NftListItemType }) => {
  const navigate = useNavigate()
  const showInfo = useRecoilValue(listModeAtom)
  const { id, url, tier, sell, status, gender, price, job } = item

  if (!showInfo) {
    return (
      <div
        className={`relative   rounded-lg bg-4  p-0.5  w-[25%]  hover:scale-105 transition ease-in-out delay-10 `}
        onClick={() => {
          navigate(`/nft/detail/${id}`)
        }}
        style={{ cursor: "pointer" }}
      >
        <div
          className={`w-full  flex items-center justify-center flex-col  h-full  rounded-lg `}
        >
          <div className="relative flex justify-center w-full h-full ">
            <div
              className={`relative flex justify-center w-[220px] h-[220px] `}
            >
              <div
                style={{
                  backgroundImage: `url(${url})`,
                }}
                className="w-full h-full bg-center bg-cover rounded-lg"
              ></div>
            </div>
          </div>
        </div>
      </div>
    )
  }

  return (
    <div
      className={`relative  p-2 rounded-lg bg-4   w-[25%]  h-1/2  hover:scale-105 transition ease-in-out delay-10`}
      onClick={() => {
        navigate(`/nft/detail/${id}`)
      }}
      style={{ cursor: "pointer" }}
    >
      <div
        className={`w-full  flex items-center justify-center flex-col  h-full  rounded-xl bg-beige-100  border-beige-400 border-4 `}
      >
        <div className="relative flex justify-center w-full h-full ">
          <div
            className={`relative flex justify-center  bg-cover w-full h-full bg-center rounded-lg`}
            style={{
              backgroundImage: `url(/assets/bg/${job}.png)`,
              backgroundSize: "300px 300px",
            }}
          >
            <div className="relative flex items-center w-full h-full rounded-lg ">
              <div
                className={` rounded-lg  w-[120px] h-[180px] bg-white  bg-center border-4  ${borderColor[tier]} ml-2 outline outline-2 outline-white
                `}
                style={{
                  backgroundImage: `url(${url})`,
                  backgroundSize: "240px 240px",
                }}
              >
                {tier && (
                  <div className="absolute flex top-3 left-2">
                    <Tier tier={tier} large={true} />
                    <LargeGender gender={gender} large={true} />
                  </div>
                )}
              </div>

              {status && (
                <div className="absolute space-y-1 top-4 right-1">
                  <StatList statList={status} border={true} />
                </div>
              )}
            </div>
          </div>
          {sell && (
            <div className="absolute bottom-0 flex justify-center w-full ">
              <div className="w-full h-[35px] flex items-center  justify-center py-0.5  bg-brown-400   rounded-b-md">
                <div className="flex text-lg font-bold text-white">
                  {formatPrice(price)}
                  <img
                    src="/images/token.png"
                    alt="token"
                    className="w-[25px] h-[25px] ml-1"
                  />
                  {/* <FontAwesomeIcon
                    icon={faCoins}
                    className="text-lg text-yellow-300 w-[30px]"
                  /> */}
                </div>
              </div>
            </div>
          )}
        </div>
      </div>
    </div>
  )
}

export default NftListItem
