import Gender from "../nftInfo/Gender"

export default function NftGenderExpain() {
  return (
    <div className="bg-white absolute rounded-md z-[2] w-[200px] h-[150px] top-[40px] shadow-md">
      <div className="flex flex-col items-center justify-center w-full h-full text-base border-black">
        <p className="mb-2 text-lg font-semibold">성별</p>

        <div className="flex">
          <div className="flex items-center mr-2">
            <Gender gender="M" />
            <p className="ml-2">남성</p>
          </div>
          <div className="flex items-center ml-2">
            <Gender gender="F" />
            <p className="ml-2">여성</p>
          </div>
        </div>
      </div>
    </div>
  )
}
