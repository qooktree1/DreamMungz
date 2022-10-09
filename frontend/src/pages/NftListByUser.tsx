import { useParams } from "react-router"
import NftList from "../components/nftList/NftList"

const NftListByUser = (props: any) => {
  // const { address } = useParams()
  return <NftList useFilter={false} />
}

export default NftListByUser
