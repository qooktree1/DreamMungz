import { atom } from "recoil"

const playingMusic = atom({
  key: "playingMusic",
  default: "Default",
})

export const playingNow = atom({
  key: "playingNow",
  default: true,
})

export default playingMusic
