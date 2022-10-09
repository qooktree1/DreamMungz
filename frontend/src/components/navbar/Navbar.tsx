import { Link, useNavigate, NavLink } from "react-router-dom"
import { useEffect, useState } from "react"
import NavList from "./NavList"
import memberAtom from "../../recoil/member/atom"
import { useRecoilState } from "recoil"
import { http } from "../../api/axios"
import { getBalance } from "../../utils/web3"
import "./Navbar.css"

const navItemStyle: string =
  "bg-beige-200 rounded-lg shadow-sm cursor-pointer p-1 mb-1 border-2 border-lgBrown-500 w-[174px] h-[36px] flex items-center justify-center"

const Navbar = () => {
  const navigate = useNavigate()
  const [member, setMember] = useRecoilState(memberAtom)
  const [balance, setBalance] = useState(0)
  const [showBalance, setShowBalance] = useState(false)

  // 지갑 정보 변경
  useEffect(() => {
    const a = setTimeout(() => {
      setShowBalance(false)
    }, 5000)
  }, [showBalance])

  // 게임 시작 페이지로 이동 로직
  async function gameStart() {
    try {
      await http.get(`game/info/${member.walletAddress}`).then((res) => {
        if (res.data.title) {
          navigate("/game")
        } else {
          navigate("/start")
        }
      })
    } catch (e) {
      navigate("/login")
    }
  }

  return (
    <div className="h-full pb-2">
      <div className="h-[15%]">
        <NavLink to="/">
          <img className="p-1 pt-2" src="/dreammungz.svg" alt="logo" />
        </NavLink>
      </div>
      <nav className="flex flex-col justify-between w-full h-[85%] p-4 space-y-4 text-center mapleStory">
        <ul className="pt-1 pb-2 mt-2 rounded-xl">
          <li>
            <button
              onClick={gameStart}
              className="flex justify-center w-full px-3 pb-3 pt-2 hover:scale-[110%]"
            >
              <img src="/images/start.png" alt="" className="" />
            </button>
          </li>

          <NavList />
        </ul>
        {member.memberNickname !== "Default" ? (
          <div className="px-3 dropdown">
            <div
              className={`${navItemStyle} dropdown-nav2`}
              onClick={() => {
                localStorage.clear()
                setMember({
                  walletAddress: "",
                  memberNickname: "Default",
                  contractId: 0,
                  walletBalance: 0,
                })
                navigate("/mainpage")
              }}
            >
              로그아웃{" "}
            </div>
            <div
              className={`${navItemStyle} dropdown-nav`}
              onClick={async () => {
                const receivedBalance = await getBalance()
                setShowBalance(true)
                setBalance(receivedBalance)
              }}
            >
              {showBalance ? (
                <p className="flex items-center justify-center ml-1">
                  {String(balance).replace(/\B(?=(\d{3})+(?!\d))/g, ",")}
                  <img
                    src="/images/token.png"
                    alt="token"
                    className="w-[23px] h-[23px] ml-1"
                  />
                </p>
              ) : (
                <p className="flex items-center justify-center">
                  지갑 열어보기
                </p>
              )}
            </div>
            <Link to={`/personal/${localStorage.getItem("publicAddress")}`}>
              <div className={navItemStyle}>{member.memberNickname} 님</div>
            </Link>
          </div>
        ) : (
          <div className="px-3">
            <div
              className={navItemStyle}
              onClick={() => {
                navigate("/login")
              }}
            >
              로그인
            </div>
          </div>
        )}
      </nav>
    </div>
  )
}

export default Navbar
