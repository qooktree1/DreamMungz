import React, { useState, useEffect } from "react"
import { useNavigate, Navigate, useParams } from "react-router-dom"
import findKOR from "../../utils/findKOR"
import Tier from "../nftInfo/Tier"
import Gender from "../nftInfo/Gender"
import StatList from "../nftInfo/StatList"
import NftGenderExplain from "./NftGenderExpain"
import tooltipAtom from "../../recoil/tooltip/atom"
import { useRecoilState } from "recoil"
import NftAbilityExplain from "./NftAbilityExplain"
import NftJobExpain from "./NftJobExplain"
import NftGradeExpain from "./NftGradeExplain"
import Stat from "../nftInfo/Stat"
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome"
import { faCircleInfo } from "@fortawesome/free-solid-svg-icons"

export default function NftMainDetail(info: any) {
  const { id } = useParams()
  const navigate = useNavigate()
  const goPersonalList = async (address: string) => {
    navigate(`/personal/${address}/list`)
  }
  const [tool, setTool] = useRecoilState(tooltipAtom)

  return (
    <div className="p-4 mt-4 text-xl ">
      {/* <p className="mb-6 text-4xl">멍개 #{id}</p> */}

      <div className="mb-2 border-b-2 border-brown-200 ">
        <div className="flex mr-[100px]  relative">
          <p className=" text-md w-[100px] text-beige-100 mr-2 text-center bg-brown-300 rounded-t-lg border-brown min-h-[35px] pt-1">
            직업{" "}
            <FontAwesomeIcon
              icon={faCircleInfo}
              className="w-[15px] text-lgBrown-300 h-[15px]"
              onMouseEnter={() => {
                setTool((prev) => {
                  const variable = { ...prev }
                  variable.jobExplainShow = true
                  return { ...variable }
                })
              }}
              onMouseLeave={() => {
                setTool((prev) => {
                  const variable = { ...prev }
                  variable.jobExplainShow = false
                  return { ...variable }
                })
              }}
            />
          </p>
          {/* 직업 설명창 */}
          {tool.jobExplainShow ? <NftJobExpain /> : null}

          <p className="font-semibold text-brown">
            {findKOR(info.info.nft.job)}
          </p>
        </div>
      </div>

      <div className="mb-2 border-b-2 border-brown-200">
        <div className="relative flex">
          <p className=" w-[100px] text-beige-100 mr-2 text-center bg-brown-300 rounded-t-lg border-brown  min-h-[35px] pt-1">
            성별{" "}
            <FontAwesomeIcon
              icon={faCircleInfo}
              className="w-[15px] text-lgBrown-300 h-[15px]"
              onMouseEnter={() =>
                setTool((prev) => {
                  const variable = { ...prev }
                  variable.genderExplainShow = true
                  return { ...variable }
                })
              }
              onMouseLeave={() => {
                setTool((prev) => {
                  const variable = { ...prev }
                  variable.genderExplainShow = false
                  return { ...variable }
                })
              }}
            />
          </p>
          {/* 성별 설명창 */}
          {tool.genderExplainShow ? <NftGenderExplain /> : null}
          <Gender gender={info.info.nft.gender} />
        </div>
      </div>

      <div className="flex w-full mb-2 border-b-2 border-brown-200">
        <p className=" w-[100px] text-beige-100 mr-2 text-center bg-brown-300 rounded-t-lg border-brown min-h-[35px] pt-1">
          능력치{" "}
          <FontAwesomeIcon
            icon={faCircleInfo}
            className="w-[15px] text-lgBrown-300 h-[15px]"
            onMouseEnter={() =>
              setTool((prev) => {
                const variable = { ...prev }
                variable.abilityExplainShow = true
                return { ...variable }
              })
            }
            onMouseLeave={() => {
              setTool((prev) => {
                const variable = { ...prev }
                variable.abilityExplainShow = false
                return { ...variable }
              })
            }}
          />
        </p>
        {/* 능력치 설명창 */}
        {tool.abilityExplainShow ? <NftAbilityExplain /> : null}

        <div className="flex flex-wrap   mb-2 w-[340px]  ">
          {info.info.nft.status.map((res: any, index: number) => {
            return (
              <Stat
                key={index}
                name={res.name}
                value={res.value}
                border={true}
              />
            )
          })}
        </div>
      </div>

      <div className="flex mb-2 border-b-2 border-brown-200 ">
        <p className=" w-[100px] text-beige-100 mr-2 text-center bg-brown-300 rounded-t-lg border-brown min-h-[35px] pt-1">
          등급{" "}
          <FontAwesomeIcon
            icon={faCircleInfo}
            className="w-[15px] text-lgBrown-300 h-[15px]"
            onMouseEnter={() => {
              setTool((prev) => {
                const variable = { ...prev }
                variable.gradeExplainShow = true
                return { ...variable }
              })
            }}
            onMouseLeave={() => {
              setTool((prev) => {
                const variable = { ...prev }
                variable.gradeExplainShow = false
                return { ...variable }
              })
            }}
          />
        </p>
        {/* 등급 설명창 */}
        {tool.gradeExplainShow ? <NftGradeExpain /> : null}
        <Tier tier={info.info.nft.tier} />
      </div>
    </div>
  )
}
