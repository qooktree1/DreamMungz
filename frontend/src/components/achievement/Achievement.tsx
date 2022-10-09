import { http } from "../../api/axios"
import AchievementList, { AchievementListType } from "./AchievementList"
import { useState, useEffect } from "react"
import "./Achievement.css"
import { useParams } from "react-router"

const chunkNumber = 14

const Achievement = () => {
  const [achievement, setAchievement] = useState([])
  const [chunkArray, setChunkArray] = useState([[]])
  const { address } = useParams()
  // console.log(address)
  useEffect(() => {
    const getAchievement = async () => {
      const { data } = await http.get(`achievement/${address}`)
      //   chunk(data.items, chunkNumber)
      setAchievement(data.items)
    }
    getAchievement()
  }, [])

  useEffect(() => {
    if (achievement.length > 0) {
      let tempArray = []
      let chunk = chunkNumber
      for (let i = 0, j = achievement.length; i < j; i += chunk) {
        tempArray.push(achievement.slice(i, i + chunk))
      }
      setChunkArray(tempArray)
    }
  }, [achievement])

  return (
    <div>
      {chunkArray.map((item: AchievementListType[], idx: number) => {
        return <AchievementList item={item} key={idx} />
      })}
    </div>
  )
}

export default Achievement
