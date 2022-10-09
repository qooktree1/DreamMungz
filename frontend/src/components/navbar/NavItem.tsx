import { NavLink } from "react-router-dom"

export interface NavItemProp {
  title: string
  path: string
}

const NavItem = ({ title, path }: NavItemProp) => {
  return (
    <li className="my-2 border-brown-200 text-brown">
      <NavLink to={path}>
        {({ isActive }) => (
          <div
            className={
              isActive
                ? `bg-pink-300 rounded-3xl p-1 mb-2 border-2 border-pink-500`
                : "bg-beige-500 rounded-full shadow-sm p-1 mb-2 border-2 border-lgBrown-400"
            }
          >
            {title}
          </div>
        )}
        {/* {title} */}
      </NavLink>
    </li>
  )
}

export default NavItem
// className={({ isActive }) => (isActive ? "bg-blue-500" : undefined)}
