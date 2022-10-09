import { useQuery } from "@tanstack/react-query"
import { useNavigate, useParams } from "react-router"
import { http } from "../api/axios"

const info = [
  {
    img: "/images/personalPage/nftlist.png",
    name: "보유한 NFT 목록",
    description: "현재 소장하고 있는 NFT 목록을 확인 할 수 있습니다.",
    link: "list",
  },
  {
    img: "/images/personalPage/achivement.png",
    name: "달성한 업적",
    description: "게임을 통해서 달성한 업적을 볼 수 있습니다.",
    link: "achievement",
  },
  {
    img: "/images/personalPage/museum.png",
    name: "3D 박물관",
    description: "보유중인 NFT를 볼 수 있는 3D 전시관입니다. ",
    link: "museum",
  },
]

const PersonalHome = () => {
  const navigate = useNavigate()
  const { address } = useParams()
  const { data } = useQuery(
    ["nickname", address],
    async () => await http.get(`auth/info/nickname/${address}`)
  )
  return (
    <div className="w-full h-[550px]  rounded-lg shadow-md bg-beige-400 mapleStory text-brown-500">
      <div className=" h-[80px] text-center leading-[80px] text-2xl  font-medium ">
        <span className="font-semibold text-brown-500">
          {data?.data.nickname}
        </span>{" "}
        님의 페이지 입니다.
      </div>
      <div className="flex w-full ">
        {info.map((item) => {
          return (
            <div className="w-1/3 h-[450px]  p-2 " key={item.name}>
              <div
                className="flex flex-col items-center w-full h-full p-4 pt-8 transition ease-in-out delay-150 rounded-lg cursor-pointer  bg-beige-100 hover:scale-105"
                onClick={() => navigate(item.link)}
              >
                <img
                  src={item.img}
                  className="w-[250px] h-[250px] rounded-lg border-2 border-white"
                />
                <h2 className="h-[50px] text-xl leading-[50px]">{item.name}</h2>
                <p className="p-4 pt-0 text-center">
                  <span className="text-base font-semibold">
                    {" "}
                    {data?.data.nickname}{" "}
                  </span>
                  님이 {item.description}
                </p>
              </div>
            </div>
          )
        })}
      </div>
    </div>
  )
}

export default PersonalHome
