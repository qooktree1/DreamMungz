import Gender from "../components/nftInfo/Gender"
import Stat from "../components/nftInfo/Stat"
import Tier from "../components/nftInfo/Tier"
import { stat_list, tier_list } from "../utils/gameWord"

export default function Sample() {
  return (
    <div className="w-full">
      색상표
      <div className="flex space-x-3">
        <div className="flex flex-col ">
          <div className=""> 디폴트 </div>
          <div className="">100</div>
          <div className="">200</div>
          <div className="">300</div>
          <div className="">400</div>
          <div className="">500</div>
          <div className="">600</div>
          <div className="">700</div>
          <div className="">800</div>
          <div className="">900</div>
        </div>
        <div className="flex flex-col ">
          <div className="bg-brown">brown</div>
          <div className="bg-brown-100">brown-100</div>
          <div className="bg-brown-200">brown-200</div>
          <div className="bg-brown-300">brown-300</div>
          <div className="bg-brown-400">brown-400</div>
          <div className="bg-brown-500">brown-500</div>
          <div className="bg-brown-600">brown-600</div>
          <div className="bg-brown-700">brown-700</div>
          <div className="bg-brown-800">brown-800</div>
          <div className="bg-brown-900">brown-900</div>
        </div>
        <div className="flex flex-col ">
          <div className="bg-lgBrown">lgBrown</div>
          <div className="bg-lgBrown-100">lgBrown-100</div>
          <div className="bg-lgBrown-200">lgBrown-200</div>
          <div className="bg-lgBrown-300">lgBrown-300</div>
          <div className="bg-lgBrown-400">lgBrown-400</div>
          <div className="bg-lgBrown-500">lgBrown-500</div>
          <div className="bg-lgBrown-600">lgBrown-600</div>
          <div className="bg-lgBrown-700">lgBrown-700</div>
          <div className="bg-lgBrown-800">lgBrown-800</div>
          <div className="bg-lgBrown-900">lgBrown-900</div>
        </div>
        <div className="flex flex-col ">
          <div className="bg-beige">beige</div>
          <div className="bg-beige-100">beige-100</div>
          <div className="bg-beige-200">beige-200</div>
          <div className="bg-beige-300">beige-300</div>
          <div className="bg-beige-400">beige-400</div>
          <div className="bg-beige-500">beige-500</div>
          <div className="bg-beige-600">beige-600</div>
          <div className="bg-beige-700">beige-700</div>
          <div className="bg-beige-800">beige-800</div>
          <div className="bg-beige-900">beige-900</div>
        </div>
        <div className="flex flex-col ">
          <div className="bg-pink">pink</div>
          <div className="bg-pink-100">pink-100</div>
          <div className="bg-pink-200">pink-200</div>
          <div className="bg-pink-300">pink-300</div>
          <div className="bg-pink-400">pink-400</div>
          <div className="bg-pink-500">pink-500</div>
          <div className="bg-pink-600">pink-600</div>
          <div className="bg-pink-700">pink-700</div>
          <div className="bg-pink-800">pink-800</div>
          <div className="bg-pink-900">pink-900</div>
        </div>
      </div>
      <div className="flex space-x-3">
        <div className="flex flex-col mt-8 space-y-2">
          {stat_list.map((item) => (
            <Stat name={item.eng} value={1} key={item.eng} />
          ))}
        </div>
        <div className="flex flex-col mt-8 space-y-2">
          {tier_list.map((item, i) => (
            <div className="flex" key={i}>
              <Tier tier={item.eng} />
              <span>{item.kor}</span>
            </div>
          ))}
        </div>
        <div className="flex flex-col mt-8 space-y-2">
          <Gender gender="M" />
          <Gender gender="F" />
        </div>
      </div>
    </div>
  )
}
