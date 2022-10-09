import { useEffect, useState } from "react"
import playingGame from "../../recoil/game/atom"
import { useRecoilState } from "recoil"
import CreditImage from "./CreditImage"
import "./gameEndingCredit.css"

export default function GameEndingCredit() {
  const [game, setGame] = useRecoilState(playingGame)

  return (
    <div
      style={{
        backgroundImage:
          "url('https://cdn.pixabay.com/photo/2016/11/08/03/16/seamless-1807376__340.jpg')",
        backgroundSize: "100% 100%",
      }}
      className="w-full h-full absolute z-[20] full-game-epilogue overflow-hidden flex rounded-lg"
    >
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
