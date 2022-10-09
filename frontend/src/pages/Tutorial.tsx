import { useNavigate } from "react-router-dom"
import TutorialChapter from "../components/tutorial/TutorialChapter"

const Tutorial = () => {
  const navigate = useNavigate()
  const tutoList = [
    {
      title: "로그인 튜토리얼",
      imageName: "tutologin",
      path: "/tutorial-detail/1",
    },
    {
      title: "게임 튜토리얼",
      imageName: "tutogame",
      path: "/tutorial-detail/2",
    },
    {
      title: "거래 튜토리얼",
      imageName: "tutooffer",
      path: "/tutorial-detail/3",
    },
  ]
  return (
    <div
      className="w-full h-full rounded-2xl shadow-md mapleStory text-lg flex items-center px-8 bg-cover bg-center"
      style={{ backgroundImage: "url(/images/mode2.png)" }}
    >
      <div className="flex w-full h-[90%] items-center flex-col justify-center">
        <span className="text-4xl p-2 px-10 bg-pink-300 text-brown-500 rounded-3xl font-bold">
          튜토리얼
        </span>
        <p className="pt-2 pb-6 text-brown-300">
          쉽고 재밌게 드림멍즈를 즐겨보세요!
        </p>
        <div className="flex justify-center items-center w-[90%] h-[75%] cursor-pointer">
          {tutoList.map(({ title, imageName, path }, index) => {
            return (
              <TutorialChapter
                title={title}
                imageName={imageName}
                path={path}
                key={index}
              />
            )
          })}
        </div>
      </div>
    </div>
  )
}

export default Tutorial
