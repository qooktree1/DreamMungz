import { useNavigate } from "react-router-dom"

export interface TutoProp {
  title: string
  imageName: string
  path: string
}

export default function TutorialChapter({ title, imageName, path }: TutoProp) {
  const navigate = useNavigate()

  return (
    <div
      className="w-full h-full px-5 py-4"
      onClick={() => {
        navigate(path)
      }}
    >
      <div
        className="flex flex-col items-center justify-center w-full h-full rounded-xl bg-beige-100 hover:scale-105 shadow-lg bg-cover bg-center relative border-pink-400 border-4"
        style={{
          backgroundImage: `url(/images/${imageName}.png)`,
        }}
      >
        <div className="w-full h-full backdrop-blur-sm rounded-xl">
          <div className="bg-[#00000088] absolute w-[90%] h-[20%] rounded-lg bottom-0 left-1/2 transform -translate-x-1/2 -translate-y-1/2 flex justify-center items-center">
            <span className="text-3xl font-bold text-[#EEEEEE]">{title}</span>
          </div>
        </div>
      </div>
    </div>
  )
}
