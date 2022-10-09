import { useEffect, useState } from "react"
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome"
import {
  faAnglesLeft,
  faAnglesRight,
  faAngleLeft,
  faAngleRight,
  faEllipsis,
} from "@fortawesome/free-solid-svg-icons"

const limit = 10

const buttonColor = "bg-beige-400 border border-lgBrown-400"
const activeColor = "bg-pink-500 font-semibold  border border-lgBrown-400"

const buttonStyle =
  "w-5 h-5 m-1  rounded-lg  text-center  text-sm text-brown cursor-pointer "

interface PaginationProp {
  totalPage: number
  page: number
  setPage: React.Dispatch<React.SetStateAction<number>>
}

const Pagination = ({
  page: currentPage,
  setPage: setCurrentPage,
  totalPage,
}: PaginationProp) => {
  const [offset, setOffset] = useState(0)

  useEffect(() => {
    const tmpOffset = Math.floor(currentPage / limit)

    if (tmpOffset !== offset) setOffset(tmpOffset)
  }, [currentPage])

  const clickPage = (num: number) => {
    if (num + 1 > totalPage || num + 1 <= 0) return
    setCurrentPage(num)
  }

  return (
    <>
      {/* <div>페이지 인덱스:{currentPage}</div>
      <div>페이지 오프셋:{offset}</div> */}
      {/* 오프셋{offset}/시작 페이지 넘버 {offset * limit} / 마지막 페이지 넘버{" "} */}
      {/* {offset * limit + limit - 1} */}
      <div className="flex justify-center w-full ">
        <div
          className={`${buttonStyle} ${buttonColor}`}
          onClick={() => clickPage(0)}
        >
          <FontAwesomeIcon icon={faAnglesLeft} />
        </div>
        <div
          className={`${buttonStyle} ${buttonColor}`}
          onClick={() => clickPage(currentPage - 1)}
        >
          <FontAwesomeIcon icon={faAngleLeft} />
        </div>
        {offset != 0 && (
          <>
            <div
              className={`  ${`${buttonStyle} `}  ${buttonColor} `}
              onClick={() => clickPage(0)}
              key={"first"}
            >
              1
            </div>
            <div
              className={`w-5 h-5 m-1  rounded-lg  text-center  text-sm text-brown pt-0.5 `}
            >
              <FontAwesomeIcon icon={faEllipsis} />
            </div>
          </>
        )}
        {Array(limit)
          .fill(0)
          .map((_, i) => {
            const page = offset * limit + (i + 1)
            if (page > totalPage) return null
            return (
              <div
                className={`  ${`${buttonStyle} `}  ${
                  page === currentPage + 1 ? activeColor : buttonColor
                } `}
                onClick={() => clickPage(page - 1)}
                key={i}
              >
                {page}
              </div>
            )
          })}
        {offset * limit + limit - 1 < totalPage && (
          <>
            <div
              className={`w-5 h-5 m-1  rounded-lg  text-center  text-sm text-brown pt-0.5 `}
            >
              <FontAwesomeIcon icon={faEllipsis} />
            </div>
            <div
              className={`  ${`${buttonStyle} `}  ${buttonColor} `}
              onClick={() => clickPage(totalPage - 1)}
              key={"last"}
            >
              {totalPage}
            </div>
          </>
        )}
        <div
          className={`${buttonStyle} ${buttonColor}`}
          onClick={() => clickPage(currentPage + 1)}
        >
          <FontAwesomeIcon icon={faAngleRight} />
        </div>
        <div
          className={`${buttonStyle} ${buttonColor}`}
          onClick={() => clickPage(totalPage - 1)}
        >
          <FontAwesomeIcon icon={faAnglesRight} />
        </div>
      </div>
    </>
  )
}

export default Pagination
