import { useRecoilValue } from "recoil"
import memberAtom from "../../recoil/member/atom"
import NavItem from "./NavItem"

const NavList = () => {
  const member = useRecoilValue(memberAtom)

  const navItemList = [
    // { title: "메인 페이지", path: "/mainpage" },
    { title: "튜토리얼", path: "/tutorial" },
    {
      title: "게임 컨텐츠",
      path: "/content",
    },

    { title: "강아지 구경", path: "/nft/list" },
    // { title: "커뮤니티", path: "/community" },
    // { title: "디자인(개발용)", path: "/styles" },
    // { title: "박물관", path: "/museum" },
    {
      title: "마이 페이지",
      path: "personal/" + member.walletAddress,
    },
  ]
  return (
    <ul className="px-3 py-1 rounded-2xl">
      {navItemList.map((item, key) => (
        <NavItem title={item.title} path={item.path} key={key} />
      ))}
    </ul>
  )
}

export default NavList
