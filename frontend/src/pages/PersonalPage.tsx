import { Link, Outlet, useMatch, useParams } from "react-router-dom"
import TabList from "../components/tab/TabList"
import UserInfo from "../components/userInfo/UserInfo"
import PersonalHome from "./PersonalHome"

const personalMenu = [
  { title: "홈", path: "" },
  { title: "보유 NFT", path: "list" },
  { title: "업적", path: "achievement" },
  { title: "박물관 ", path: "museum" },
  { title: "거래 내역 ", path: "history" },
  { title: "제안 내역 ", path: "offer" },
]

const PersonalPage = () => {
  const { address } = useParams()
  const homePath = useMatch("/personal/:address")
  if (address === "null") {
    // console.log(address)
    return <div> 해당 유저가 존재하지 않습니다. </div>
  }

  return (
    <div className="w-full h-full overflow-hidden">
      <div className="w-full  h-[10%]  mb-4 flex items-end   justify-between  border-b-4 border-beige-500">
        <TabList list={personalMenu} />
        <UserInfo />
      </div>
      <div className="w-full  h-[90%] ">
        {homePath && <PersonalHome />}
        <Outlet />
      </div>
    </div>
  )
}

export default PersonalPage
