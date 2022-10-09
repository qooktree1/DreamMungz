import findKOR from "../../utils/findKOR"

export const EndingList = ({
  name,
  option,
}: {
  name: string
  option: string
}) => {
  return (
    <div className="flex pb-3 w-[200px]">
      <span className="bg-pink-400 w-[100px] flex justify-center rounded-2xl">
        {name}
      </span>
      <span className="w-[100px] flex justify-center">{findKOR(option)}</span>
    </div>
  )
}

export default EndingList
