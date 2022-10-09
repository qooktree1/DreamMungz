const stats: { [index: string]: string } = {
  M: "남",
  F: "여",
}

const color: { [index: string]: string } = {
  M: "bg-blue-200",
  F: "bg-pink-200",
}

export interface GenderType {
  name: string
}

const GenderTag = ({ name }: GenderType) => {
  return (
    <div
      className={`text-black text-xs p-0.5 rounded-md m-0.5 w-6 text-center font-semibold shadow-xl border-white ${color[name]}`}
    >
      {stats[name]}
    </div>
  )
}

export default GenderTag
