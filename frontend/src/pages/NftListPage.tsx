import NftList from "../components/nftList/NftList"

const NftListPage = () => {
  return (
    <div className="h-full overflow-hidden mapleStory text-lgBrown-700">
      <h1 className="mb-4 text-2xl font-bold h-[10%] flex items-start ">
        드림멍즈의 모든 강아지들{" "}
      </h1>
      <NftList useFilter={true} />
    </div>
  )
}

export default NftListPage
