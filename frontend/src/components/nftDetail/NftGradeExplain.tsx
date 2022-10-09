import Tier from "../nftInfo/Tier"

export default function NftGenderExpain() {
  return (
    <div className="bg-white absolute rounded-md z-[2] w-[600px] h-[100px] shadow-md bottom-[0px]">
      <div className="flex flex-col justify-center items-center w-full h-full">
        <p className="mb-2 text-lg font-semibold">등급표</p>
        <div className="flex text-sm font-normal">
          <div className="flex mr-2 items-center">
            <Tier tier="NORMAL" />
            <p className="ml-2 mr-2">NORMAL</p>
          </div>
          <div className="flex mr-2 items-center">
            <Tier tier="RARE" />
            <p className="ml-2 mr-2">RARE</p>
          </div>
          <div className="flex mr-2 items-center">
            <Tier tier="EPIC" />
            <p className="ml-2 mr-2">EPIC</p>
          </div>
          <div className="flex mr-2 items-center">
            <Tier tier="UNIQUE" />
            <p className="ml-2 mr-2">UNIQUE</p>
          </div>
          <div className="flex items-center">
            <Tier tier="LEGENDARY" />
            <p className="ml-2">LEGENDARY</p>
          </div>
        </div>
      </div>
    </div>
  )
}
