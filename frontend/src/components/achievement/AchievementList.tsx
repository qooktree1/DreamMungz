import AchievementListItem, {
  AchievementListItemType,
} from "./AchievementListItem"

export interface AchievementListType {
  achievementListItems: AchievementListItemType[]
}

const AchievementList = ({ item }: { item: any }) => {
  return (
    <div className="accordian mapleStory">
      <ul>
        {item.map((item: AchievementListItemType, idx: number) => {
          return <AchievementListItem item={item} key={idx} />
        })}
      </ul>
    </div>
  )
}

export default AchievementList
