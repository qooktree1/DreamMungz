import Filter from "../components/filter/Filter"
import { http } from "./axios"

const getNftList = async (filter: Filter) => {
  const { data } = await http.post("nft/list", filter)
  return data
}

const getDealHistory = async (address: string, page: number) => {
  const { data } = await http.get(`trade/address/${address}/page/${page}`)
  return data
}

const getOfferHistory = async (address: string, page: number) => {
  const { data } = await http.get(`trade/nego/address/${address}/page/${page}`)
  return data
}

const getNftDetail = async (tokenId: number) => {
  const { data } = await http.get(`trade/nft/${tokenId}`)
  return data
}

export { getNftDetail, getNftList, getDealHistory, getOfferHistory }
