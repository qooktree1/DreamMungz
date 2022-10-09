import { faLink } from "@fortawesome/free-solid-svg-icons"
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome"
import { Link, NavLink, useMatch } from "react-router-dom"

export interface TabProp {
  title: string
  path: string
}
const Tab = ({ title, path }: TabProp) => {
  return (
    <NavLink to={path} className="" end>
      {({ isActive }) => (
        <div
          className={`h-[90%] p-2  rounded-t-lg w-[100px]  text-center mapleStory border-r-2 border-beige-600/40  text-brown  ${
            isActive ? "bg-pink" : "bg-beige-500"
          }`}
        >
          {title}
          {path === "museum" && <FontAwesomeIcon icon={faLink} />}
        </div>
      )}
    </NavLink>
  )
}

export default Tab
