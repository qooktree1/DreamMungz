import { atom } from "recoil"

const tradeAtom = atom({
  key: "tradeAtom",
  default: {
    modalOpen1: false, // 판매 중지 모달
    modalOpen2: false, // 즉시 구매 모달
    modalOpen3: false, // 가격 제안하기 모달
    modalOpen4: false, // 가격 제안취소 모달
    modalOpen5: false, // 가격 제안수락 모달
    modalOpen6: false, // 스피너 모달
    modalOpen7: false, // 가격 제안 환불 모달
    modalOpen8: false, // 판매 등록 모달
    isSellingForm: false, // 판매 등록 클릭 boolean
    selectedOfferId: 0, // 선택된 Nego Id
    buyNowPrice: 0, // 즉시 구매 가격
    offerPrice: 0, // 네고 제안 가격
    clickedOfferId: 0,
    clickedTradeId: 0,
    clickedTokenId: 0,
  },
})

export default tradeAtom
