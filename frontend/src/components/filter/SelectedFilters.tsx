import Filter from "./Filter"
import { NavigateOptions, useNavigate } from "react-router-dom"
import findKOR from "../../utils/findKOR"
import { getKey } from "../../utils/gameWord"
import { useEffect } from "react"

const buttonStyle = "p-1  bg-beige-500  rounded-md  "
const SelectedFilters = ({
  filter,
  resetFilter,
  setFilter,
  setSelectedList,
  seletedList,
}: {
  filter: Filter
  resetFilter: () => void
  setFilter: (newQuery: Filter, options?: NavigateOptions | undefined) => void
  setSelectedList: React.Dispatch<React.SetStateAction<string[]>>
  seletedList: string[]
}) => {
  useEffect(() => {
    const selected: string[] = Object.values(filter)
      .filter(
        (val) =>
          typeof val !== "boolean" && val !== null && typeof val !== "number"
      )
      .flat()

    setSelectedList(selected)
  }, [filter])

  const onClickHandler = (option: string) => {
    const key = getKey[option]

    if (key === "status") {
      let status = filter.status
      let statusIndex = status.findIndex((stat) => stat === option)
      status.splice(statusIndex, 1)
      // console.log(statusIndex, status)
      setFilter({ ...filter, status: status })
    } else {
      setFilter({ ...filter, [key]: null })
    }
  }

  return (
    <div className="flex flex-wrap w-full pr-0.5 overflow-x-scroll scrollbar-hide">
      {seletedList.map((value) => {
        return (
          <div className={`${buttonStyle}   text-[13px] m-0.5`} key={value}>
            {findKOR(value)}
            <span
              className="text-sm font-medium p-0.5 cursor-pointer hover:text-red-500 bg-beige-300  ml-0.5 rounded-lg   text-brown-400"
              onClick={() => {
                onClickHandler(value)
              }}
            >
              X
            </span>
          </div>
        )
      })}
      {seletedList.length !== 0 && (
        <button
          className={`${buttonStyle}   text-[13px] m-0.5     rounded-md  text-red-500  `}
          onClick={() => {
            resetFilter()
          }}
        >
          초기화
        </button>
      )}
    </div>
  )
}

export default SelectedFilters
