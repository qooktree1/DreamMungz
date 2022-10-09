import Tab, { TabProp } from "./Tab"

interface TabListProp {
  list: TabProp[]
}

const TabList = ({ list }: TabListProp) => {
  return (
    <div className="flex items-end ">
      {list?.map((item, idx) => (
        <Tab title={item.title} path={item.path} key={idx} />
      ))}
    </div>
  )
}

export default TabList
