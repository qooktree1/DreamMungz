// import { TokenExpireCheck } from "../utils/tokenExpireCheck"
import axios from "axios"
import { TokenExpireCheck } from "../utils/tokenExpireCheck"
function Instance() {
  const instance = axios.create({
    // 배포 주소: "https://j7a605.p.ssafy.io/api/"
    // local: "http://localhost:8081/"

    baseURL: "https://j7a605.p.ssafy.io/api/",
    headers: {
      "Content-type": "application/json",
    },
  })

  // 요청 인터셉터 추가 - 헤더에 토큰 등록
  instance.interceptors.request.use(
    (config: any) => {
      // token 만료 시 login Page 로
      if (localStorage.getItem("token") && TokenExpireCheck()) {
        // 로그아웃
        localStorage.clear()
        window.location.replace("/login")
      } else {
        config.headers["token"] = localStorage.getItem("token")
        return config
      }
    },
    (err) => {
      return Promise.reject(err)
    }
  )

  return instance
}
export const http = Instance()
/**
 * 사용방법 :
 * 사용하고자 하는 파일에서 임포트 : ex) import { http } from "../api/index"
 * 원하는 요청 수행 : ex) http.get("url") , http.post("url",data)
 */
