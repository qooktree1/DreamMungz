import { useEffect, useState } from "react"
import Stat, { StatType } from "./Stat"

type StatListProp = {
  statList: StatType[]
  border?: boolean
}

const StatList = ({ statList, border = false }: StatListProp) => {
  const [list, setList] = useState<StatType[] | null>(null)

  useEffect(() => {
    if (statList) {
      //
      const newList = [...statList]
      newList.sort((a, b) => {
        const nameA = a.name
        const nameB = b.name
        if (nameA < nameB) {
          return 1
        }
        if (nameA > nameB) {
          return -1
        }

        // names must be equal
        return 0
      })

      setList(newList)
    }
  }, [statList])

  return (
    <>
      {list &&
        list.map(({ name, value }, index) => (
          <Stat name={name} value={value} key={index} border={border} />
        ))}
    </>
  )
}

export default StatList
