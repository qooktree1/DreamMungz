import React, { useState, useEffect } from "react"
import { useNavigate } from "react-router-dom"
import { http } from "../api/axios"
import GenderTag from "../components/game/GenderTag"
import StatList from "../components/nftInfo/StatList"
import { pushGameStart } from "../utils/web3"
import SpinnerModal from "../components/modal/SpinnerModal"
import Spinner from "../components/spinner/Spinner"
import { useRecoilState } from "recoil"
import tradeAtom from "../recoil/trade/atom"
import Gender from "../components/nftInfo/Gender"
import { getBalance } from "../utils/web3"
import Swal from "sweetalert2"

const publicAddress = localStorage.getItem("publicAddress")

let startSetting = {
  address: publicAddress,
  father: "",
  mating: false,
  mother: "",
}

// 게임 시작 API
function useMovePage(price: number) {
  const navigate = useNavigate()
  const [trade, setTrade] = useRecoilState(tradeAtom)

  async function MovePage() {
    const showBalance = await getBalance()
    // console.log(startSetting)

    // 돈이 부족할 경우
    if (showBalance < price) {
      Swal.fire({
        text: "지갑에 MUNG이 부족합니다!",
        icon: "warning",
        confirmButtonText: "확인",
      })
    } else if (
      startSetting.mating &&
      (!startSetting.father || !startSetting.mother)
    ) {
      Swal.fire({
        text: "두 마리의 강아지를 선택해주세요!",
        icon: "warning",
        confirmButtonText: "확인",
      })
    } else {
      await setTrade((prev) => {
        const variable = { ...prev }
        variable.modalOpen6 = true
        return { ...variable }
      })

      // 결제 로직
      try {
        await pushGameStart(publicAddress, price)
      } catch {
        await setTrade((prev) => {
          const variable = { ...prev }
          variable.modalOpen6 = false
          return { ...variable }
        })
        return
      }

      await setTrade((prev) => {
        const variable = { ...prev }
        variable.modalOpen6 = false
        return { ...variable }
      })
      // price 만큼 결제합니다. 결제 성공시 아래 navigate 실행~
      await http.post(`game/start`, startSetting).then((res) => {
        // console.log("넘기자", startSetting)
        navigate("/game")
      })
    }
  }
  return MovePage
}

// 시작 화면 설명
function StartTutorial() {
  return (
    <div
      className="relative w-full h-full bg-cover border-pink-500 shadow-md rounded-3xl"
      style={{ backgroundImage: "url(/images/mode.png)" }}
    >
      <div className="w-full h-full ridiBatang ">
        <div className="absolute left-[100px] top-[80px] flex flex-col items-center">
          <img src="/dreammungz.svg" className="w-[300px] pb-3" alt="logo" />
          <p className="pb-5">모드를 선택하고 당신만의 강아지를 키워보세요.</p>
          <p className="pb-1">처음 시작하는 유저에게는 아기 강아지 모드를,</p>
          <p>다회차 플레이 유저에게는 웨딩 모드를 권장합니다.</p>
        </div>
      </div>
    </div>
  )
}

// 베이비 모드 설명
function BabyMode() {
  const MovePage = useMovePage(100)
  function StartGame() {
    MovePage()
  }

  return (
    <div
      className="relative flex items-center justify-center w-full h-full bg-white bg-center shadow-md bg-cove rounded-3xl"
      // style={{ backgroundImage: "url(/images/background3.png)" }}
    >
      <div className="flex flex-col items-center justify-center w-full ridiBatang">
        <div className="flex pb-7">
          <div className="flex flex-col items-end justify-center">
            <span className="bg-lgBrown-200 mapleStory rounded-2xl h-[35px] flex items-center px-4 mb-2">
              출발하자!
            </span>
            <span className="bg-lgBrown-200 mapleStory rounded-2xl h-[35px] flex items-center px-4">
              나 빨리 가고 싶어!
            </span>
          </div>
          <img src="/images/mung.png" alt="" className="h-[150px]" />
        </div>
        <p className="pb-1">강아지 육성을 새롭게 시작합니다.</p>
        <p>모든 스탯이 0부터 시작합니다.</p>
        <button
          className="p-5 px-10 mt-5 text-xl bg-pink-500 rounded-3xl mapleStory"
          onClick={() => {
            startSetting.mating = false
            StartGame()
          }}
        >
          100 MUNG으로 시작하기
        </button>
      </div>
    </div>
  )
}

function ShowDog({ dog }: { dog: DogType }) {
  return (
    <div>
      <img src={dog.url} alt="dog" />
    </div>
  )
}

type DogType = {
  url: string
  gender: string
  status: StatType[]
  id: string
  tier: string
}
type StatType = {
  name: string
  value: number
}

// 웨딩 모드 설명
function WeddingMode() {
  const [price, setPrice] = useState<any>(0)
  const [nft, setNft] = useState([
    {
      id: "",
      url: "",
      gender: "",
      status: [
        {
          name: "",
          value: 2,
        },
        {
          name: "",
          value: 2,
        },
      ],
      tier: "",
    },
  ])

  useEffect(() => {
    let nftList
    async function nftGet() {
      nftList = await http.get(
        `nft/address/${localStorage.getItem("publicAddress")}`
      )
      setNft(nftList.data.items)
    }
    nftGet()
  }, [])

  const MovePage = useMovePage(price)
  function StartGame() {
    MovePage()
  }

  const [dogF, setDogF] = useState<DogType>({
    url: "",
    gender: "",
    status: [],
    id: "",
    tier: "",
  })
  const [dogM, setDogM] = useState<DogType>({
    url: "",
    gender: "",
    status: [],
    id: "",
    tier: "",
  })

  const [babyStatus, setBabyStatus] = useState<StatType[]>([])

  useEffect(() => {
    // 아기 강아지 스테이터스 로직
    const babyStatus = [
      { name: "STOUTNESS", value: 0 },
      { name: "CLEVER", value: 0 },
      { name: "QUICK", value: 0 },
      { name: "INTUITION", value: 0 },
      { name: "CHARISMA", value: 0 },
      { name: "POPULARITY", value: 0 },
      { name: "SENSIBILITY", value: 0 },
      { name: "FOOTWORK", value: 0 },
      { name: "VOICE", value: 0 },
      { name: "WEALTH", value: 0 },
    ]
    dogF.status.forEach(({ name, value }) => {
      babyStatus.find((e) => e.name === name)!.value += value
    })
    dogM.status.forEach(({ name, value }) => {
      babyStatus.find((e) => e.name === name)!.value += value
    })

    const newStatus: StatType[] = []

    babyStatus.map((stat) => {
      if (stat.value) {
        newStatus.push(stat)
      }
    })

    setBabyStatus(newStatus)

    // 가격 계산 로직
    const priceLogic: object = {
      NORMAL: 100,
      RARE: 200,
      EPIC: 300,
      UNIQUE: 400,
      LEGENDARY: 500,
    }

    if (dogF.tier && dogM.tier) {
      setPrice(
        priceLogic[dogF.tier as keyof object] +
          priceLogic[dogM.tier as keyof object]
      )
    } else if (dogF.tier) {
      setPrice(priceLogic[dogF.tier as keyof object])
    } else if (dogM.tier) {
      setPrice(priceLogic[dogM.tier as keyof object])
    }
  }, [dogF, dogM])

  return (
    <div className="relative flex justify-between w-full h-full p-6 bg-white bg-cover shadow-md rounded-3xl">
      <div className="w-[85%] h-full rounded-2xl">
        <div className="h-[10%] flex justify-center mapleStory text-xl">
          <span className="px-4 bg-pink-300 rounded-2xl h-[30px] border-2 border-pink-400">
            보유한 NFT 목록
          </span>
        </div>
        <div className="h-[90%] overflow-scroll bg-gradient-to-b from-pink-100 to-pink-300 scrollbar-hide rounded-2xl flex p-3 shadow-md border-pink-500 mapleStory">
          <div className="flex flex-wrap w-full h-full">
            {nft.map((selectNft, index) => (
              <div className="w-[33.3%] h-[38%] p-1" key={index}>
                <div
                  className="flex w-full h-full p-1 mb-3 bg-white border-pink-400 shadow-sm cursor-pointer rounded-xl hover:shadow-md"
                  key={index}
                  onClick={() => {
                    if (selectNft.gender == "M") {
                      setDogM(selectNft)
                    } else {
                      setDogF(selectNft)
                    }
                  }}
                >
                  <div className="relative w-[65%]">
                    <img src={selectNft.url} alt="dog" className="rounded-lg" />
                    <div className="absolute bottom-3 right-3">
                      <Gender gender={selectNft.gender} />
                    </div>
                  </div>
                  <div className="flex flex-col items-center w-[35%]">
                    <StatList statList={selectNft.status} />
                  </div>
                </div>
              </div>
            ))}
          </div>
        </div>
      </div>
      <div className="flex flex-col justify-center w-[40%] h-full pl-5">
        <div className="h-[10%] flex justify-center mapleStory text-xl">
          <span className="px-4 bg-beige-300 rounded-2xl h-[30px] border-2 border-beige-400">
            유전 정보
          </span>
        </div>
        <div className="flex flex-col w-full h-[90%] items-center justify-center">
          <div className="h-full">
            <div className="flex h-[55%]">
              <div className="flex flex-col justify-center w-1/2 p-2">
                <div className="flex justify-center mb-2 text-sm rounded-full mapleStory">
                  엄마멍
                </div>
                <div>
                  {dogF.url ? (
                    <ShowDog dog={dogF} />
                  ) : (
                    <div>
                      <div className="w-[125.45px] h-[125.45px] bg-gray-200"></div>
                    </div>
                  )}
                </div>
              </div>
              <div className="flex flex-col justify-center w-1/2 p-2">
                <div className="flex justify-center mb-2 text-sm rounded-full mapleStory">
                  압바멍
                </div>
                <div>
                  {dogM.url ? (
                    <ShowDog dog={dogM} />
                  ) : (
                    <div>
                      <div className="w-[125.45px] h-[125.45px] bg-gray-200"></div>
                    </div>
                  )}
                </div>
              </div>
            </div>
            <div className="h-[45%] pt-5">
              <div className="flex justify-center mapleStory">시작 정보</div>
              <div className="flex flex-wrap items-center justify-center pt-2 mapleStory">
                <StatList statList={babyStatus} />
              </div>
            </div>
          </div>
        </div>
        <button
          className="p-5 px-2 mt-5 text-xl bg-pink-500 rounded-3xl mapleStory"
          onClick={() => {
            startSetting.father = dogM.id
            startSetting.mother = dogF.id
            startSetting.mating = true
            StartGame()
          }}
        >
          {price} MUNG으로 시작하기
        </button>
      </div>
    </div>
  )
}

export default function GameStart() {
  const [showContent, setContent] = useState(<StartTutorial />)
  const [trade, setTrade] = useRecoilState(tradeAtom)

  return (
    <div className="w-full h-full">
      {/* 스피너 모달 시작 */}
      <SpinnerModal
        isOpen={trade.modalOpen6}
        modalClose={() => {
          setTrade((prev) => {
            const variable = { ...prev }
            variable.modalOpen6 = false
            return { ...variable }
          })
        }}
      >
        <div className="flex flex-col items-center">
          <Spinner />
          <p className="text-2xl font-semibold absolute mt-[75%]">
            강아지 입양중
          </p>
        </div>
      </SpinnerModal>
      {/* 스피너 모달 끝 */}

      <div className="flex w-full h-1/5">
        <div className="w-1/2 h-full pr-4">
          <button
            className="flex items-center justify-center w-full h-full text-3xl font-bold bg-center bg-cover border-4 shadow-md rounded-3xl border-brown-300 mapleStory click:mt-1 bg-beige-100"
            onClick={() => setContent(<BabyMode />)}
            style={{ backgroundImage: "url(/images/babymode.png)" }}
          >
            <div className="text-brown-500 rounded-2xl bg-white py-6 w-[92%]">
              아기 강아지 모드
            </div>
          </button>
        </div>
        <div className="w-1/2 h-full pl-4">
          <button
            className="flex items-center justify-center w-full h-full text-3xl font-bold bg-pink-100 bg-center bg-cover border-4 border-pink-500 shadow-md rounded-3xl mapleStory click:mt-1"
            onClick={() => setContent(<WeddingMode />)}
            style={{ backgroundImage: "url(/images/weddingmode.png)" }}
          >
            <div className="text-red-300 rounded-2xl py-6 w-[92%] bg-white">
              웨딩 모드
            </div>
          </button>
        </div>
      </div>
      <div className="pt-8 h-4/5">
        <div className="w-full h-full">{showContent}</div>
      </div>
    </div>
  )
}
