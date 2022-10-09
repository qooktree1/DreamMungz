const info = [
  { type: "단편", title: "	은하수" },
  { type: "단편", title: "	등산" },
  { type: "단편", title: "	원반 던지기" },
  { type: "단편", title: "	영리한 자만이 배부름을 누릴 수 있다" },
  { type: "단편", title: "	도깨비 불(?)" },
  { type: "단편", title: "	벌집" },
  { type: "단편", title: "	길치" },
  { type: "단편", title: "	아기 고양이 삼형제" },
  { type: "단편", title: "	과일과 과일 장수" },
  { type: "단편", title: "	버려진 집" },
  { type: "단편", title: "	신의 장난" },
  { type: "단편", title: "	뒤져서 나오면" },
  { type: "단편", title: "	마지막 사과" },
  { type: "단편", title: "	마을로 이동" },
  { type: "단편", title: "	버스킹" },
  { type: "단편", title: "	기선제압" },
  { type: "단편", title: "	소나기" },
  { type: "단편", title: "	가치관" },
  { type: "단편", title: "	지나가고 싶으면.." },
  { type: "단편", title: "	물수제비" },
  { type: "단편", title: "	떠돌이 화가" },
  { type: "단편", title: "	폭포" },
  { type: "단편", title: "	서점" },
  { type: "단편", title: "	흔들다리" },
  { type: "단편", title: "	팬클럽" },
  { type: "단편", title: "	나를 맞춰 봐" },
  { type: "단편", title: "	중2병" },
  { type: "단편", title: "	주식투자" },
  { type: "단편", title: "	진정한 맛" },
  { type: "단편", title: "	조각 실력" },
  { type: "단편", title: "	손주" },
  { type: "단편", title: "	프라모델" },
  { type: "단편", title: "	남자에게 필요한 건.." },
  { type: "단편", title: "	오리 가족" },
  { type: "단편", title: "	체육 대회" },
  { type: "단편", title: "	달고나" },
  { type: "단편", title: "	나르시스트" },
  { type: "단편", title: "	갯벌" },
  { type: "단편", title: "	사자의 밥그릇" },
  { type: "단편", title: "	멍로몬의 선택" },
  { type: "중편", title: "	강아지 귀신?" },
  { type: "중편", title: "	아기 고양이는 심심해" },
  { type: "중편", title: "	SOS 수상구조대" },
  { type: "중편", title: "	감자밭과 농사꾼" },
  { type: "중편", title: "	I'm such a good surfer" },
  { type: "중편", title: "	농장 알바" },
  { type: "중편", title: "	패션왕" },
  { type: "중편", title: "	벼룩시장" },
  { type: "중편", title: "	일일 밴드" },
  { type: "중편", title: "	환경 지키미" },
  { type: "중편", title: "	온천" },
  { type: "중편", title: "	멍토벤" },
  { type: "중편", title: "	멍멍신상 참배" },
  { type: "중편", title: "	수해 복구" },
  { type: "중편", title: "	놀이 공원" },
  { type: "장편", title: "	호랑이 장가가는 날 (여우비)" },
  { type: "장편", title: "	르노 삼촌의 고민거리" },
  { type: "장편", title: "	할아버지의 낡은 시계" },
  { type: "장편", title: "	특명! 멍피트!" },
  { type: "장편", title: "	눈이 손보다 빠르다" },
  { type: "장편", title: "	저마다의 속도" },
  { type: "장편", title: "	서커스단 입단?" },
  { type: "장편", title: "	동굴 탈출 도전" },
]

export default function Story() {
  return (
    <div className="w-full h-full">
      <div className="flex flex-wrap justify-center items-center w-full h-full overflow-scroll scrollbar-hide">
        {/* <div></div> */}
        {info.map(({ type, title }) => {
          return (
            <div className="border-2  w-[290px] h-[40px] text-center rounded-2xl mapleStory shadow-md flex bg-pink-100 border-white text-sm mx-3 my-2">
              <div
                className={`w-[60px] flex justify-center items-center font-bold rounded-l-2xl ${
                  type === "단편" && " bg-red-300"
                } ${type === "중편" && " bg-orange-300"} ${
                  type === "장편" && " bg-yellow-300"
                }`}
              >
                {type}
              </div>
              <div className="flex items-center justify-center w-[220px]">
                {title}
              </div>
            </div>
          )
        })}
        {info.length % 2 !== 0 && <div className="w-[340px] "></div>}
      </div>
    </div>
  )
}
