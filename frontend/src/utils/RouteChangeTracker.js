import { useRecoilState } from "recoil"
import { useEffect, useState } from "react"
import { useLocation } from "react-router-dom"
import ReactGA from "react-ga"
import playingMusic from "../recoil/music/atom"

const RouterChangeTracker = () => {
  const [, setMusicName] = useRecoilState(playingMusic)
  const location = useLocation()
  const [initialized, setInitialized] = useState(false)

  useEffect(() => {
    if (!window.location.href.includes("localhost")) {
      ReactGA.initialize(process.env.REACT_APP_GOOGLE_ANALYTICS_TRACKING_ID)
    }
    setInitialized(true)
  }, [])

  useEffect(() => {
    if (initialized) {
      if (!["/game", "/ending", "/start"].includes(location.pathname)) {
        setMusicName("Default")
      }
      ReactGA.pageview(location.pathname + location.search)
    }
  }, [initialized, location])
}

export default RouterChangeTracker
