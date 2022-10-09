import React, { useState, useEffect } from "react"
import { useLocation, useNavigate } from "react-router-dom"
import { faArrowLeft } from "@fortawesome/free-solid-svg-icons"
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome"
import parse from "html-react-parser"

const loginTutorialContents = [
  {
    image: "login/login1.png",
    title: "메타마스크 설치",
    text: "1. <a className='text-blue-500' href='https://chrome.google.com/webstore/detail/metamask/nkbihfbeogaeaoehlefnkodbefgpgknn?hl=ko'>크롬 웹스토어</a> 에서 메타마스크를 다운받으세요. 파란 글씨를 클릭하면 다운로드 페이지로 이동합니다.",
    index: 0,
  },
  {
    image: "login/login2.png",
    title: "메타마스크 가입",
    text: "2. 메타마스크 확장프로그램에 접속하여 지갑 가져오기 또는 지갑 생성을 진행해주세요.",
    index: 1,
  },
  {
    image: "login/login3.png",
    title: "SSAFY 네트워크 추가",
    text: "3. 설치된 메타마스크의 위쪽 네트워크 버튼을 클릭하시고, 테스트 네트워크를 보기 모드로 변경 후에 네트워크 추가를 눌러주세요.",
    index: 3,
  },
  {
    image: "login/login4.png",
    title: "SSAFY 네트워크 추가",
    text: "4. 차례대로 기입 후 네트워크를 추가해 주세요. <br/> <b>네트워크 이름</b>: SSAFY NETWORK 　　　　　　<b>새 RPC URL</b>: http://20.196.209.2:8545 <br/>  <b>체인 ID</b>: 31221 　　　　　　 　　　　　　　　 <b>통화 기호</b>: M",
    index: 4,
  },
  {
    image: "login/login5.png",
    title: "드림멍즈 로그인",
    text: "5. 이제 드림멍즈 로그인이 가능합니다! 최초 회원가입시 10000 MUNG 을 지원하고 있으니 모든 거래를 승인해주세요. 로그인이 완료되면 메인페이지로 이동합니다.",
    index: 4,
  },
]

const gameTutorialContents = [
  {
    image: "game/game1.png",
    title: "게임 모드",
    text: `1. 드림멍즈는 게임 시작을 위한 두 가지의 모드를 제공합니다. 위쪽의 버튼을 눌러 모드를 결정할 수 있습니다. `,
    index: 0,
  },
  {
    image: "game/game2.png",
    title: "게임 시작",
    text: "2. 아기 강아지 모드는 100 멍을 지불하고 시작합니다. 메타마스크 거래 요청을 승인해주세요.",
    index: 1,
  },
  {
    image: "game/game3.png",
    title: "게임 시작",
    text: "3. 웨딩 모드는 현재 플레이어가 보유중인 NFT 중 남자멍과 여자멍을 결혼시켜 물려받은 능력치를 가지고 시작합니다. 지불 금액은 조합한 NFT의 등급에 따라 달라집니다. 메타마스크 거래 요청을 승인해주세요.",
    index: 2,
  },
  {
    image: "game/game4.png",
    title: "게임 진행",
    text: "4. 스토리를 진행하며 선택지를 고를 수 있습니다. 선택지에 따라 강아지의 능력치가 변화합니다.",
    index: 3,
  },
  {
    image: "game/game5.png",
    title: "게임 엔딩",
    text: "5. 게임이 끝난 후 능력치에 따라 강아지의 직업이 결정됩니다. NFT 민팅하기를 눌러 플레이어만의 NFT를 만들 수 있습니다. 엔딩 크레딧을 보며 메타마스크 거래 요청을 승인해주세요.",
    index: 4,
  },
]

const tradeTutorialContents = [
  {
    image: "trade/trade1.png",
    title: "판매 등록",
    text: "1. 본인의 NFT 상세 페이지에서 판매 시작을 누르면 판매 등록이 가능합니다. 즉시 구매 가격과 제안 여부를 설정해주세요. 제안을 허락할 시 다른 사용자가 구매하기 원하는 가격을 제안할 수 있습니다. 이후 판매 등록을 위한 메타마스크 거래 요청을 승인해주세요.",
    index: 0,
  },
  {
    image: "trade/trade2.png",
    title: "판매 중지",
    text: "2. 판매를 중지하려면 판매 중인 NFT의 판매중지 버튼을 눌러 판매 중지를 위한 메타마스크 승인을 진행해주세요.",
    index: 1,
  },
  {
    image: "trade/trade3.png",
    title: "즉시구매와 제안",
    text: "3. NFT를 구매하고 싶을 경우 판매자가 설정한 가격을 지불하여 즉시 구매 하거나 판매자에게 판매 가격을 제안할 수 있습니다. 제안 또한 즉시 구매와 마찬가지로 제안한 가격을 지불합니다. 메타마스크 승인을 진행해주세요.",
    index: 2,
  },
  {
    image: "trade/trade3.png",
    title: "제안 취소",
    text: "4. 본인이 했던 제안을 취소하려면 NFT의 제안 이력의 ❌ 버튼을 클릭 후 메타마스크 승인을 진행해주세요. 마이페이지의 제안 내역에서도 취소가 가능합니다.",
    index: 3,
  },
  {
    image: "trade/trade4.png",
    title: "환불",
    text: "5. 만약 제안했던 NFT를 다른 이용자가 구매를 하면 제안할때 본인이 지불했던 가격을 환불 받을 수 있습니다. 환불을 받으려면 마이페이지의 제안 내역 탭을 클릭 후 오퍼 상태가 환불 가능인 것을 찾아 클릭후 메타마스크 승인을 진행해주세요.",
    index: 4,
  },
  {
    image: "trade/trade5.png",
    title: "제안 승인",
    text: "6. 판매자의 경우 NFT 상세 페이지에서 원하는 제안의 ✅ 버튼을 클릭해서 제안을 수락할 수 있습니다.",
    index: 5,
  },
]

const TutorialDetail = () => {
  const { pathname } = useLocation()
  const navigate = useNavigate()
  const [clickedImage, setClickedImage] = useState("")
  const [clickedText, setClickedText] = useState("")
  const [clickedIndex, setClickedIndex] = useState(0)
  const [clickedTutorial, setClickedTutorial] = useState(0)
  const [clickedTitle, setClickedTitle] = useState("")

  useEffect(() => {
    async function firstCarouselSlide() {
      if (pathname === "/tutorial-detail/1") {
        setClickedTutorial(1)
      } else if (pathname === "/tutorial-detail/2") {
        setClickedTutorial(2)
      } else if (pathname === "/tutorial-detail/3") {
        setClickedTutorial(3)
      }
    }
    firstCarouselSlide()
  }, [])

  const moveLeft = async () => {
    if (clickedTutorial === 1) {
      if (clickedIndex === 0) {
        return
      } else {
        await setClickedImage(loginTutorialContents[clickedIndex - 1].image)
        await setClickedText(loginTutorialContents[clickedIndex - 1].text)
        await setClickedTitle(loginTutorialContents[clickedIndex - 1].title)
        await setClickedIndex(clickedIndex - 1)
      }
    } else if (clickedTutorial === 2) {
      if (clickedIndex === 0) {
        return
      } else {
        await setClickedImage(gameTutorialContents[clickedIndex - 1].image)
        await setClickedText(gameTutorialContents[clickedIndex - 1].text)
        await setClickedTitle(gameTutorialContents[clickedIndex - 1].title)
        await setClickedIndex(clickedIndex - 1)
      }
    } else if (clickedTutorial === 3) {
      if (clickedIndex === 0) {
        return
      } else {
        await setClickedImage(tradeTutorialContents[clickedIndex - 1].image)
        await setClickedTitle(tradeTutorialContents[clickedIndex - 1].title)
        await setClickedText(tradeTutorialContents[clickedIndex - 1].text)
        await setClickedIndex(clickedIndex - 1)
      }
    }
  }

  const moveRight = async () => {
    if (clickedTutorial === 1) {
      if (clickedIndex === loginTutorialContents.length - 1) {
        return
      } else {
        await setClickedImage(loginTutorialContents[clickedIndex + 1].image)
        await setClickedText(loginTutorialContents[clickedIndex + 1].text)
        await setClickedTitle(loginTutorialContents[clickedIndex + 1].title)

        await setClickedIndex(clickedIndex + 1)
      }
    } else if (clickedTutorial === 2) {
      if (clickedIndex === gameTutorialContents.length - 1) {
        return
      } else {
        await setClickedImage(gameTutorialContents[clickedIndex + 1].image)
        await setClickedText(gameTutorialContents[clickedIndex + 1].text)
        await setClickedTitle(gameTutorialContents[clickedIndex + 1].title)
        await setClickedIndex(clickedIndex + 1)
      }
    } else if (clickedTutorial === 3) {
      if (clickedIndex === tradeTutorialContents.length - 1) {
        return
      } else {
        await setClickedImage(tradeTutorialContents[clickedIndex + 1].image)
        await setClickedText(tradeTutorialContents[clickedIndex + 1].text)
        await setClickedTitle(tradeTutorialContents[clickedIndex + 1].title)
        await setClickedIndex(clickedIndex + 1)
      }
    }
  }

  return (
    <div
      className="flex w-full h-full p-5 bg-center bg-cover shadow-md rounded-2xl bg-beige-400 mapleStory text-brown-500"
      style={{
        scrollBehavior: "smooth",
        backgroundImage: "url(/images/mode2.png)",
      }}
    >
      <div className="w-[15%] py-3">
        <div
          className="cursor-pointer flex justify-center items-center text-brown-400 pb-2 h-[8%]"
          onClick={() => navigate(-1)}
        >
          <FontAwesomeIcon icon={faArrowLeft} className="mr-2" /> 뒤로 가기
        </div>

        {/* 좌측 슬라이더 시작 */}

        <div className="h-[92%] w-full p-3 grid grid-cols-1 gap-y-1 overflow-y-auto scrollbar-hide bg-brown-200 rounded-xl">
          {pathname === "/tutorial-detail/1" &&
            loginTutorialContents.map(({ image, text, title }, index) => {
              return (
                <div
                  className="w-full h-[80px] cursor-pointer rounded-lg hover:scale-105 ease-in-out transition delay-150 shadow-lg hover:border-brown-400"
                  key={index}
                  onClick={async () => {
                    await setClickedImage(image)
                    await setClickedText(text)
                    await setClickedTutorial(1)
                    await setClickedIndex(index)
                    await setClickedTitle(title)
                  }}
                >
                  <img
                    src={`/images/tutorial/${image}`}
                    alt="튜토리얼 이미지"
                    className="w-full h-full border-2 border-transparent rounded-lg"
                  />
                </div>
              )
            })}
          {pathname === "/tutorial-detail/2" &&
            gameTutorialContents.map(({ image, text, title }, index) => {
              return (
                <div
                  className="w-full h-[80px] cursor-pointer rounded-lg hover:scale-105 ease-in-out transition delay-150 shadow-lg hover:border-brown-400"
                  key={index}
                  onClick={async () => {
                    await setClickedImage(image)
                    await setClickedText(text)
                    await setClickedTutorial(2)
                    await setClickedIndex(index)
                    await setClickedTitle(title)
                  }}
                >
                  <img
                    src={`/images/tutorial/${image}`}
                    alt="튜토리얼 이미지"
                    className="w-full h-full border-2 border-transparent rounded-lg"
                  />
                </div>
              )
            })}

          {pathname === "/tutorial-detail/3" &&
            tradeTutorialContents.map(({ image, text, title }, index) => {
              return (
                <div
                  className="w-full h-[80px] cursor-pointer rounded-lg hover:scale-105 ease-in-out transition delay-150 shadow-lg hover:border-brown-400"
                  key={index}
                  onClick={async () => {
                    await setClickedImage(image)
                    await setClickedText(text)
                    await setClickedTutorial(3)
                    await setClickedIndex(index)
                    await setClickedTitle(title)
                  }}
                >
                  <img
                    src={`/images/tutorial/${image}`}
                    alt="튜토리얼 이미지"
                    className="w-full h-full border-2 border-transparent rounded-lg"
                  />
                </div>
              )
            })}
        </div>
      </div>
      {/* 좌측 슬라이더 끝 */}

      {clickedText ? (
        <div className="w-[85%] h-full py-4 pl-4 rounded-lg flex flex-col items-center">
          <p className="flex justify-center mb-8 text-2xl font-bold">
            {clickedTitle}
          </p>
          <div className="flex justify-center items-center w-full h-[60%] rounded-lg relative">
            <button
              className="absolute z-10 left-3 h-[30px] w-[30px] rounded-full bg-beige-300 hover:scale-110"
              onClick={moveLeft}
            >
              {"<"}
            </button>
            <button
              className="absolute z-10 right-3 h-[30px] w-[30px] rounded-full bg-beige-300 hover:scale-110"
              onClick={moveRight}
            >
              {">"}
            </button>

            <img
              src={`/images/tutorial/${clickedImage}`}
              alt=""
              className="border-2 border-transparent rounded-lg w-[680px] shadow-lg"
            />
          </div>

          <div className="flex w-[680px] h-[30%] border-2 mt-10 border-brown-200 mapleStory rounded-lg p-4 px-5 leading-7 bg-lgBrown-100">
            <p>{parse(clickedText)}</p>
          </div>
        </div>
      ) : pathname === "/tutorial-detail/1" ? (
        <div className="w-[85%] h-full py-4 pl-4 rounded-lg flex flex-col items-center">
          <p className="flex justify-center mb-8 text-2xl font-bold">
            {loginTutorialContents[0].title}
          </p>
          <div className="flex justify-center items-center w-full h-[60%] rounded-lg relative">
            <button
              className="absolute z-10 left-3 h-[30px] w-[30px] rounded-full bg-beige-300 hover:scale-110"
              onClick={moveLeft}
            >
              {"<"}
            </button>
            <button
              className="absolute z-10 right-3 h-[30px] w-[30px] rounded-full bg-beige-300 hover:scale-110"
              onClick={moveRight}
            >
              {">"}
            </button>
            <img
              src={`/images/tutorial/${loginTutorialContents[0].image}`}
              alt=""
              className="border-2 border-transparent rounded-lg w-[680px] shadow-lg"
            />
          </div>

          <div className="flex w-[680px] h-[30%] border-2 mt-10 border-brown-200 mapleStory rounded-lg p-4 px-5 leading-7 bg-lgBrown-100">
            <p>{parse(loginTutorialContents[0].text)}</p>
          </div>
        </div>
      ) : pathname === "/tutorial-detail/2" ? (
        <div className="w-[85%] h-full py-4 pl-4 rounded-lg flex flex-col items-center">
          <p className="flex justify-center mb-8 text-2xl font-bold">
            {gameTutorialContents[0].title}
          </p>
          <div className="flex justify-center items-center w-full h-[60%] rounded-lg relative">
            <button
              className="absolute z-10 left-3 h-[30px] w-[30px] rounded-full bg-beige-100 hover:scale-110"
              onClick={moveLeft}
            >
              {"<"}
            </button>
            <button
              className="absolute z-10 right-3 h-[30px] w-[30px] rounded-full bg-beige-100 hover:scale-110"
              onClick={moveRight}
            >
              {">"}
            </button>
            <img
              src={`/images/tutorial/${gameTutorialContents[0].image}`}
              alt=""
              className="border-2 border-transparent rounded-lg w-[680px] shadow-lg"
            />
          </div>

          <div className="flex w-[680px] h-[30%] border-2 mt-10 border-brown-200 mapleStory rounded-lg p-4 px-5 leading-7 bg-lgBrown-100">
            <p>{parse(gameTutorialContents[0].text)}</p>
          </div>
        </div>
      ) : pathname === "/tutorial-detail/3" ? (
        <div className="w-[85%] h-full py-4 pl-4 rounded-lg flex flex-col items-center">
          <p className="flex justify-center mb-8 text-2xl font-bold">
            {tradeTutorialContents[0].title}
          </p>
          <div className="flex justify-center items-center w-full h-[60%] rounded-lg relative">
            <button
              className="absolute z-10 left-3 h-[30px] w-[30px] rounded-full bg-beige-100 hover:scale-110"
              onClick={moveLeft}
            >
              {"<"}
            </button>
            <button
              className="absolute z-10 right-3 h-[30px] w-[30px] rounded-full bg-beige-100 hover:scale-110"
              onClick={moveRight}
            >
              {">"}
            </button>
            <img
              src={`/images/tutorial/${tradeTutorialContents[0].image}`}
              alt=""
              className="border-2 border-transparent rounded-lg w-[680px] shadow-lg"
            />
          </div>

          <div className="flex w-[680px] h-[30%] border-2 mt-10 border-brown-200 mapleStory rounded-lg p-4 px-5 leading-7 bg-lgBrown-100">
            <p>{parse(tradeTutorialContents[0].text)}</p>
          </div>
        </div>
      ) : null}
    </div>
  )
}

export default TutorialDetail
