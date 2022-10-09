import findKOR from "../../utils/findKOR"
import Tier from "../nftInfo/Tier"

export interface AchievementListItemType {
  name: string
  isUnlock: boolean
  highestTier: string
}

const AchievementListItem = ({ item }: { item: AchievementListItemType }) => {
  const { name, isUnlock, highestTier } = item

  return (
    <li className="mapleStory">
      {isUnlock ? (
        <div className="word-toggle">
          <a href="#">
            <div className="tier-cover">
              <div className={`tier gradient-border ${highestTier}`}>
                <div className="absolute top-2 left-2">
                  <Tier tier={highestTier} />
                </div>
                <img src={`/assets/achievement/${name}.png`} />
              </div>
            </div>
          </a>
          <div className="image_title">
            <a href="#">{findKOR(name)}</a>
          </div>
        </div>
      ) : (
        <div>
          <a href="#">
            <div className="tier-cover">
              <div className={`tier gradient-border LOCK`}>
                <img className="LOCK_IMG" src={`/LOCK.png`} />
              </div>
            </div>
          </a>
        </div>
      )}
    </li>
  )
}

export default AchievementListItem
