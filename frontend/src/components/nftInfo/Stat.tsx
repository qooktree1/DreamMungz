import KOR from "../../utils/findKOR"
const color: { [index: string]: string } = {
  WEALTH: "bg-rose-300",
  VOICE: "bg-orange-300",
  STOUTNESS: "bg-amber-300",
  SENSIBILITY: "bg-yellow-300",
  QUICK: "bg-lime-300",
  POPULARITY: "bg-emerald-300",
  INTUITION: "bg-cyan-400",
  FOOTWORK: "bg-sky-300",
  CLEVER: "bg-indigo-300",
  CHARISMA: "bg-fuchsia-300",
  JUSTICE: "bg-stone-300",
  CUTE: "bg-teal-300",
}

export interface StatType {
  name: string
  value: number
  border?: boolean
}

const Stat = ({ name, value, border = false }: StatType) => {
  return (
    <div
      className={`text-black text-xs p-0.5 rounded-md m-0.5 w-20 text-center font-semibold ${
        color[name]
      } shadow-sm ${border && "border border-white"}`}
    >
      {KOR(name)} {value}
    </div>
  )
}

export default Stat
