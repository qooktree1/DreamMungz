import { http } from "./axios"

const getUserNickname = async (address: string) => {
  const { data } = await http.get(`auth/info/nickname/${address}`)
  return data
}

export { getUserNickname }
