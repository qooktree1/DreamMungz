import StatList from "../nftInfo/StatList"

export default function NftAbilityExplain() {
  const statusList: any = [
    {
      name: "WEALTH",
      value: "",
    },
    {
      name: "VOICE",
      value: "",
    },
    {
      name: "STOUTNESS",
      value: "",
    },
    {
      name: "SENSIBILITY",
      value: "",
    },
    {
      name: "CLEVER",
      value: "",
    },
    {
      name: "QUICK",
      value: "",
    },
    {
      name: "INTUITION",
      value: "",
    },
    {
      name: "CHARISMA",
      value: "",
    },
    {
      name: "POPULARITY",
      value: "",
    },
    {
      name: "JUSTICE",
      value: "",
    },
    {
      name: "CUTE",
      value: "",
    },
    {
      name: "FOOTWORK",
      value: "",
    },
  ]
  return (
    <div className="bg-white absolute rounded-md z-[10] w-[600px] h-[150px] shadow-md bottom-[0px]">
      <div className="flex flex-col items-center justify-center w-full h-full text-base border-black">
        <p className="my-4 text-lg font-semibold text-center">스탯 목록</p>
        <div className="text-xs font-semibold text-black">
          <div className="flex">
            <p className="mr-1 bg-rose-300 rounded-md p-0.5 m-0.5 w-20 text-center">
              재력
            </p>
            <p className="mr-1 bg-orange-300  rounded-md p-0.5 m-0.5 w-20 text-center">
              목청
            </p>
            <p className="mr-1 bg-amber-300  rounded-md p-0.5 m-0.5 w-20 text-center">
              튼튼함
            </p>
            <p className="mr-1 bg-yellow-300  rounded-md p-0.5 m-0.5 w-20 text-center">
              감수성
            </p>
            <p className="mr-1 bg-lime-300  rounded-md p-0.5 m-0.5 w-20 text-center">
              재빠름
            </p>
            <p className="mr-1 bg-emerald-300  rounded-md p-0.5 m-0.5 w-20 text-center">
              인기
            </p>
          </div>
          <div className="flex">
            <p className="mr-1 bg-cyan-400  rounded-md p-0.5 m-0.5 w-20 text-center">
              직감
            </p>
            <p className="mr-1 bg-sky-300  rounded-md p-0.5 m-0.5 w-20 text-center">
              발재주
            </p>
            <p className="mr-1 bg-indigo-300  rounded-md p-0.5 m-0.5 w-20 text-center">
              영리함
            </p>
            <p className="mr-1 bg-fuchsia-300  rounded-md p-0.5 m-0.5 w-20 text-center">
              용기
            </p>
            <p className="mr-1 bg-stone-300  rounded-md p-0.5 m-0.5 w-20 text-center">
              정의로움
            </p>
            <p className="mr-1 bg-teal-300  rounded-md p-0.5 m-0.5 w-20 text-center">
              귀여움
            </p>
          </div>
        </div>
      </div>
    </div>
  )
}

// INTUITION: "bg-cyan-400",
// FOOTWORK: "bg-sky-300",
// CLEVER: "bg-indigo-300",
// CHARISMA: "bg-fuchsia-300",
// JUSTICE: "bg-stone-300",
// CUTE: "bg-teal-300",
