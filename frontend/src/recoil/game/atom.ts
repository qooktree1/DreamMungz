import { atom } from "recoil"

const playingGame = atom({
  key: "playingGame",
  default: {
    title: "스토리 타이틀",
    content: "장면 내용입니다 여기 어쩌고저쩌고",
    selection: [
      { id: 1, content: "그림을 그린다" },
      { id: 2, content: "글을 쓴다" },
      { id: 3, content: "이걸 한다" },
    ],
    image: "이거 삽화 이름임",
    bgm: "이거 bgm 이름임",
    justice: 10,
    status: [
      { name: "STOUTNESS", value: 10 },
      { name: "CLEVER", value: 10 },
      { name: "QUICK", value: 10 },
      { name: "INTUITION", value: 10 },
      { name: "CHARISMA", value: 10 },
      { name: "POPULARITY", value: 10 },
      { name: "SENSIBILITY", value: 10 },
      { name: "FOOTWORK", value: 10 },
      { name: "VOICE", value: 10 },
      { name: "WEALTH", value: 10 },
    ],
    endingCreditShow: false,
    endingCreditData: [],
  },
})

export default playingGame
