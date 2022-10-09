import { atom } from "recoil"
import { recoilPersist } from "recoil-persist"

const { persistAtom } = recoilPersist()

const memberAtom = atom({
  key: "memberAtom",
  default: {
    walletAddress: "",
    memberNickname: "Default",
    contractId: 0,
    walletBalance: 0,
  },
  effects_UNSTABLE: [persistAtom],
})

export default memberAtom
