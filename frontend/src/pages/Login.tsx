import { NavLink } from "react-router-dom"
import LoginButton from "../components/login/Login"
import SpinnerModal from "../components/modal/SpinnerModal"
import Spinner from "../components/spinner/Spinner"
import tradeAtom from "../recoil/trade/atom"
import { useRecoilState } from "recoil"

const Login = () => {
  const [trade, setTrade] = useRecoilState(tradeAtom)

  return (
    <div
      className="flex items-center justify-center w-full h-full bg-center bg-cover rounded-3xl"
      style={{ backgroundImage: "url(/images/login.jpg)" }}
    >
      {/* 스피너 모달 시작 */}
      <SpinnerModal
        isOpen={trade.modalOpen6}
        modalClose={() => {
          setTrade((prev) => {
            const variable = { ...prev }
            variable.modalOpen6 = false
            return { ...variable }
          })
        }}
      >
        <Spinner />
        <div className="text-2xl font-semibold absolute mt-[70%]">
          <p className="">로그인 중</p>
        </div>
      </SpinnerModal>
      {/* 스피너 모달 끝 */}

      <div className="mt-3">
        <button className="relative">
          <LoginButton />
          <img
            src="/images/mung.png"
            className="w-[100px] absolute bottom-[74px] right-20"
          ></img>
        </button>
        <NavLink to="/tutorial-detail/1">
          <div className="flex justify-center py-1 mt-2 text-sm bg-pink-100 border-2 border-white shadow-sm mapleStory rounded-xl hover:bg-pink-300">
            지갑이 없으신가요?{" "}
            <p className="pl-1 cursor-pointer"> 만드는 법 확인하기 </p>
          </div>
        </NavLink>
      </div>
    </div>
  )
}

export default Login
