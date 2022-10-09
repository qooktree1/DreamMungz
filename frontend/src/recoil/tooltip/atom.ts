import { atom } from "recoil"

const tooltipAtom = atom({
  key: "tooltipAtom",
  default: {
    genderExplainShow: false, // 성별 설명
    abilityExplainShow: false, // 능력치 설명
    gradeExplainShow: false, // 등급 설명
    jobExplainShow: false, // 직업 설명
  },
})

export default tooltipAtom
