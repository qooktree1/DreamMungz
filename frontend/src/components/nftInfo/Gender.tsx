import { FontAwesomeIcon } from "@fortawesome/react-fontawesome"
import { faVenus, faMars } from "@fortawesome/free-solid-svg-icons"

const Gender = ({
  gender,
  large = false,
}: {
  gender: string
  large?: boolean
}) => {
  return (
    <div
      className={` rounded-lg ${
        large ? "w-[30px] h-[35px]" : "w-[20px]  h-[25px]"
      } text-center border-2  m-0.5 text-sm  bg-white  ${
        gender === "M" ? "border-blue-500" : "border-red-500"
      }`}
    >
      {gender === "M" ? (
        <FontAwesomeIcon
          icon={faMars}
          className={`text-blue-500  ${large && " w-[20px] h-[20px] pt-1 "} `}
        />
      ) : (
        <FontAwesomeIcon
          icon={faVenus}
          className={`text-red-500 ${large && " w-[20px] h-[20px] pt-1 "}`}
        />
      )}
    </div>
  )
}

const LargeGender = ({
  gender,
  large = false,
}: {
  gender: string
  large?: boolean
}) => {
  return (
    <div
      className={` rounded-md 
        w-[30px] h-[35px] text-center  ml-1 pt-0.5 border-2 outline outline-1 outline-white text-white
     ${
       gender === "M"
         ? "bg-blue-400 border-blue-500"
         : "bg-red-400 border-red-500"
     }`}
    >
      {gender === "M" ? (
        <FontAwesomeIcon icon={faMars} className={` w-[20px] h-[20px] pt-1 `} />
      ) : (
        <FontAwesomeIcon icon={faVenus} className={`w-[20px] h-[20px] pt-1`} />
      )}
    </div>
  )
}
export { LargeGender }
export default Gender
