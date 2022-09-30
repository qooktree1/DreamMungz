import { useEffect, useState } from "react"
import playingGame from "../../recoil/game/atom"
import { useRecoilState } from "recoil"
import CreditImage from "./CreditImage"
import "./gameEndingCredit.css"

export default function GameEndingCredit() {
  const [showBtn, setShowBtn] = useState(false)
  const [game, setGame] = useRecoilState(playingGame)

  useEffect(() => {
    setTimeout(() => {
      setShowBtn(true)
    }, 5000)
  }, [])
  return (
    <div
      // style={{
      //   backgroundImage:
      //     "url('https://c6.staticflickr.com/4/3165/2558160805_c15dd40154_n.jpg')",
      //   backgroundSize: "100% 100%",
      // }}
      className="w-full h-full absolute z-[20] full-game-epilogue bg-lgBrown-600 overflow-hidden flex rounded-lg"
    >
      {showBtn === true ? (
        <div className="flex items-end justify-end w-full">
          <button
            className="cursor-pointer z-[120] mb-2 mr-4 text-white text-xl font-semibold mapleStory hover:text-brown-100"
            onClick={() => {
              setGame((prev) => {
                const variable = { ...prev }
                variable.endingCreditShow = false
                return { ...variable }
              })
            }}
          >
            CLOSE
          </button>
        </div>
      ) : null}

      <div id="target">
        <div>
          <div className="h-[700px]"></div>
          {game.endingCreditData.map(
            ({
              image,
              title,
              sequence,
            }: {
              image: string
              title: string
              sequence: number
            }) => {
              return (
                <div key={sequence}>
                  {sequence % 2 === 0 ? (
                    <div className="flex justify-end mx-[80px]">
                      <CreditImage
                        imgUrl={image}
                        title={title}
                        sequence={sequence}
                      />
                    </div>
                  ) : (
                    <div className="flex justify-start mx-[80px]">
                      <CreditImage
                        imgUrl={image}
                        title={title}
                        sequence={sequence}
                      />
                    </div>
                  )}
                </div>
              )
            }
          )}
          <div className="flex justify-center mt-[600px]">
            <p className="text-7xl font-semibold mapleStory  text-white">
              To Be Continued
            </p>
          </div>
        </div>
      </div>
    </div>
  )
}
