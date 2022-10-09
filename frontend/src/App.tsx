import { BrowserRouter, Routes, Route, Navigate } from "react-router-dom"
import RouterChangeTracker from "./utils/RouteChangeTracker.js"

import MusicPlayer from "./components/music/MusicPlayer"

import Navbar from "./components/navbar/Navbar"
import MainPage from "./pages/MainPage"
import NftDetail from "./pages/NftDetail"
import GameStart from "./pages/GameStart"
import GamePlaying from "./pages/GamePlaying"
import GameEnding from "./pages/GameEnding"

import Login from "./pages/Login"
import Tutorial from "./pages/Tutorial"
import TutorialDetail from "./pages/TutorialDetail"

import NftListPage from "./pages/NftListPage"
import MyAchievement from "./pages/MyAchievement"
import PersonalPage from "./pages/PersonalPage"
import NftListByUser from "./pages/NftListByUser"
import DealHistoryByUser from "./pages/DealHistoryByUser"
import OfferHistoryByUser from "./pages/OfferHistoryByUser"
import Museum from "./pages/MuseumPage"
import Content from "./components/content/Content"

function App() {
  RouterChangeTracker()

  return (
    <div
      style={{
        backgroundImage: `url(/images/background4.png)`,
      }}
      className="relative flex items-center justify-center w-screen h-screen bg-center bg-cover scroll-auto scrollbar-hide"
    >
      <MusicPlayer />

      <div className="flex items-center justify-center bg-white shadow-2xl rounded-2xl w-[1290px] h-[710px] relative">
        <div className="flex rounded-xl w-[1280px] h-[700px]">
          <div className="w-[230px]  rounded-l-xl bg-gradient-to-t from-lgBrown-500 to-lgBrown-300">
            <Navbar />
          </div>
          <div className="w-[1050px] p-8 bg-gradient-to-t from-beige-300 to-beige-100 rounded-r-xl">
            <Routes>
              <Route path="/" element={<Navigate replace to="/mainPage" />} />
              <Route path="/mainpage" element={<MainPage />} />
              <Route path="/login" element={<Login />} />
              <Route path="/personal" element={<Login />} />
              <Route path="/tutorial" element={<Tutorial />} />
              <Route
                path="/tutorial-detail/:number"
                element={<TutorialDetail />}
              />
              <Route path="/start" element={<GameStart />} />
              <Route path="/game" element={<GamePlaying />} />
              <Route path="/ending" element={<GameEnding />} />
              <Route path="/nft">
                <Route path="list" element={<NftListPage />} />
                <Route path="detail/:id" element={<NftDetail />} />
              </Route>
              <Route path="/personal/:address" element={<PersonalPage />}>
                <Route path="list" element={<NftListByUser />} />
                <Route path="history" element={<DealHistoryByUser />} />
                <Route path="offer" element={<OfferHistoryByUser />} />
                <Route path="achievement" element={<MyAchievement />} />
                <Route path="museum" element={<Museum />} />
              </Route>

              <Route path="/content" element={<Content />} />
            </Routes>
          </div>
        </div>
      </div>
    </div>
  )
}

export default App
