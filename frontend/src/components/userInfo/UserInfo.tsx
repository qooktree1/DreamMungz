import { faPenToSquare } from "@fortawesome/free-solid-svg-icons"
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome"
import { useQuery } from "@tanstack/react-query"
import React, { useEffect, useState } from "react"
import { useParams } from "react-router"
import { useRecoilState } from "recoil"
import { getUserNickname } from "../../api/auth"
import { http } from "../../api/axios"
import memberAtom from "../../recoil/member/atom"
import { useNavigate } from "react-router-dom"
import Swal from "sweetalert2"

const UserInfo = () => {
  const navigate = useNavigate()
  const { address } = useParams()
  const [newNickname, setNewNickname] = useState<string | null>(null)
  const [member, setMember] = useRecoilState(memberAtom)
  const [editing, setEditing] = useState(false)
  const [changedNick, setChangedNick] = useState<string | null>(null)
  const [isOwner, setIsOwner] = useState<boolean | null>(null)
  const { data, error } = useQuery(["nickname", address, changedNick], () =>
    getUserNickname(address!)
  )
  if (error) {
    console.log(error)
  }

  useEffect(() => {
    if (address) {
      if (address === localStorage.getItem("publicAddress")) {
        setIsOwner(true)
      } else {
        setIsOwner(false)
      }
    }
  }, [address])

  const onNicknameChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    const value = event.target.value
    setNewNickname(value)
  }

  const onNicknameSubmit = async () => {
    if (newNickname === "") {
      Swal.fire({
        // title: "오류!",
        text: "닉네임은 최소 1자 이상이어야 합니다.",
        icon: "error",
        confirmButtonText: "확인",
      })
      // alert("닉네임은 최소 1자 이상이어야 합니다.")
    } else {
      if (!address) return
      try {
        const data = await http.put(`auth/info/nickname/change/${address}`, {
          address,
          nickname: newNickname,
        })
        if (data.status === 200) {
          // console.log("닉네임 변경 성공", newNickname)
          setMember((prev: any) => ({ ...prev, memberNickname: newNickname }))
          // setChangedNick(newNickname)
          navigate(0)
        }
      } catch (e: any) {
        const { data } = e.response
        Swal.fire({
          // title: "오류!",
          text: "토큰 인증시간이 만료되었습니다. 다시 로그인해주세요.",
          icon: "error",
          confirmButtonText: "확인",
        })
      }
    }
  }
  useEffect(() => {
    if (changedNick) {
      setEditing(false)
    }
  }, [changedNick])

  return (
    <>
      {!editing ? (
        <div className="flex">
          <h1 className="pb-2 text-3xl font-bold mapleStory text-lgBrown-700">
            {data?.nickname}
          </h1>
          {isOwner !== null && isOwner && (
            <button
              className="p-1 mx-2 rounded-lg"
              onClick={() => {
                setEditing(true)
              }}
            >
              <FontAwesomeIcon
                icon={faPenToSquare}
                className="text-lgBrown-700"
              />
            </button>
          )}
        </div>
      ) : (
        <div className="pb-2 ml-1 mr-2 space-x-2 mapleStory">
          <input
            type="text"
            defaultValue={data?.nickname}
            onChange={onNicknameChange}
            className="p-1 border-2 rounded-lg border-lgBrown-400 "
          />
          <button
            className="p-1 border-2 rounded-lg bg-sky-200 border-lgBrown-400"
            onClick={onNicknameSubmit}
          >
            수정 하기{" "}
          </button>
          <button
            className="p-1 mr-2 border-2 rounded-lg bg-rose-200 border-lgBrown-400"
            onClick={() => {
              setEditing(false)
            }}
          >
            수정 취소{" "}
          </button>
        </div>
      )}
    </>
  )
}

export default UserInfo
