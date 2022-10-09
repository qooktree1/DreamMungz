import { useRecoilValue, useRecoilState } from "recoil"
import { useRef, useEffect } from "react"
import playingMusic, { playingNow } from "../../recoil/music/atom"

import { FontAwesomeIcon } from "@fortawesome/react-fontawesome"
import { faVolumeXmark, faVolumeUp } from "@fortawesome/free-solid-svg-icons"

export default function MusicPlayer() {
  const musicName = useRecoilValue(playingMusic)
  const audioRef = useRef<HTMLAudioElement>(null)
  const [isPlaying, setIsPlaying] = useRecoilState(playingNow)

  useEffect(() => {
    if (audioRef.current) {
      if (isPlaying) {
        audioRef.current.play()
      } else {
        audioRef.current.pause()
      }
    }
  }, [isPlaying])

  useEffect(() => {
    if (audioRef.current) {
      if (!isPlaying) {
        audioRef.current.pause()
      }
    }
  }, [musicName])

  return (
    <button
      className="absolute right-10 top-10 round-full bg-beige-200 h-[60px] w-[60px] rounded-full p-3"
      onClick={() => {
        setIsPlaying(!isPlaying)
      }}
    >
      <audio
        src={`./audios/${musicName}.mp3`}
        autoPlay
        id="audio"
        ref={audioRef}
        loop
        crossOrigin="anonymous"
      ></audio>
      {isPlaying ? (
        <FontAwesomeIcon
          icon={faVolumeUp}
          className="w-full h-full text-[#ff8d8d]"
        />
      ) : (
        <FontAwesomeIcon
          icon={faVolumeXmark}
          className="w-full h-full text-pink-500"
        />
      )}
    </button>
  )
}
