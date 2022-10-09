import React, { ChangeEvent, useEffect, useRef, useState } from "react"
import { NavigateOptions } from "react-router-dom"
import {
  job_list,
  hair_list,
  tier_list,
  color_list,
  face_list,
  gender_list,
  stat_list,
  getKey,
} from "../../utils/gameWord"
import Filter from "./Filter"

const listStyle = "w-1/2 p-1 text-sm "
const labelStyle =
  "p-0.5  border border-gray-700 rounded-md bg-beige-300 peer-checked:bg-blue-300 w-full inline-block cursor-pointer"
const titleStyle = "p-1 font-bold  m-0.5 border-b-2 border-beige-100"
type filterFormProp = {
  formHandler: (event: ChangeEvent<HTMLFormElement>) => void
  filter: Filter
  selectedList: string[]
  setFilter: (newQuery: Filter, options?: NavigateOptions | undefined) => void
}
const FilterForm = ({
  formHandler,
  filter,
  selectedList,
  setFilter,
}: filterFormProp) => {
  const onOptionClick = (value: string) => {
    const key = getKey[value]
    if (key === "status") {
      let status = filter.status
      let statusIndex = status.findIndex((stat) => stat === value)
      status.splice(statusIndex, 1)
      // console.log(statusIndex, status)
      setFilter({ ...filter, status: status })
    } else {
      setFilter({ ...filter, [key]: null })
    }
  }

  return (
    <div className="h-[700px] w-[230px] bg-gradient-to-t from-lgBrown-500 to-lgBrown-300  overflow-y-auto scrollbar-hide rounded-l-xl absolute left-[5px] z-10 top-[5px] p-1">
      <form
        onChange={formHandler}
        className="w-full text-center "
        id="filter-form"
      >
        <p className={titleStyle}>직업</p>
        <ul className="flex flex-wrap w-full">
          {job_list.map((item) => {
            return (
              <li key={item.eng} className={listStyle}>
                <input
                  type="radio"
                  name="job"
                  id={item.eng}
                  value={item.eng}
                  className="hidden peer"
                  checked={selectedList.includes(item.eng)}
                  onClick={() => {
                    onOptionClick(item.eng)
                  }}
                  readOnly
                />
                <label htmlFor={item.eng} className={labelStyle}>
                  {item.kor}
                </label>
              </li>
            )
          })}
        </ul>
        <p className={titleStyle}>모질</p>
        <ul className="flex">
          {hair_list.map((item) => {
            return (
              <li key={item.eng} className={listStyle}>
                <input
                  type="radio"
                  name="hair"
                  id={item.eng}
                  value={item.eng}
                  className="hidden peer"
                  checked={selectedList.includes(item.eng)}
                  onClick={() => {
                    onOptionClick(item.eng)
                  }}
                  readOnly
                />
                <label htmlFor={item.eng} className={labelStyle}>
                  {item.kor}
                </label>
              </li>
            )
          })}
        </ul>
        <p className={titleStyle}>티어</p>
        <ul className="flex flex-wrap">
          {tier_list.map((item) => {
            return (
              <li key={item.eng} className={listStyle}>
                <input
                  type="radio"
                  name="tier"
                  id={item.eng}
                  value={item.eng}
                  className="hidden peer"
                  checked={selectedList.includes(item.eng)}
                  onClick={() => {
                    onOptionClick(item.eng)
                  }}
                  readOnly
                />
                <label htmlFor={item.eng} className={labelStyle}>
                  {item.kor}
                </label>
              </li>
            )
          })}
        </ul>
        <p className={titleStyle}>성별</p>
        <ul className="flex flex-wrap">
          {gender_list.map((item) => {
            return (
              <li key={item.eng} className={listStyle}>
                <input
                  type="radio"
                  name="gender"
                  id={item.eng}
                  value={item.eng}
                  className="hidden peer"
                  checked={selectedList.includes(item.eng)}
                  onClick={() => {
                    onOptionClick(item.eng)
                  }}
                  readOnly
                />
                <label htmlFor={item.eng} className={labelStyle}>
                  {item.kor}
                </label>
              </li>
            )
          })}
        </ul>
        <p className={titleStyle}>색상</p>
        <ul className="flex flex-wrap">
          {color_list.map((item) => {
            return (
              <li key={item.eng} className={listStyle}>
                <input
                  type="radio"
                  name="color"
                  id={item.eng}
                  value={item.eng}
                  className="hidden peer"
                  checked={selectedList.includes(item.eng)}
                  onClick={() => {
                    onOptionClick(item.eng)
                  }}
                  readOnly
                />
                <label htmlFor={item.eng} className={labelStyle}>
                  {item.kor}
                </label>
              </li>
            )
          })}
        </ul>
        <p className={titleStyle}>얼굴</p>
        <ul className="flex flex-wrap">
          {face_list.map((item) => {
            return (
              <li key={item.eng} className={listStyle}>
                <input
                  type="radio"
                  name="face"
                  id={item.eng}
                  value={item.eng}
                  className="hidden peer"
                  checked={selectedList.includes(item.eng)}
                  onClick={() => {
                    onOptionClick(item.eng)
                  }}
                  readOnly
                />
                <label htmlFor={item.eng} className={labelStyle}>
                  {item.kor}
                </label>
              </li>
            )
          })}
        </ul>
        <p className={titleStyle}>능력 </p>
        <ul className="flex flex-wrap">
          {stat_list.map((item) => {
            return (
              <li key={item.eng} className={listStyle}>
                <input
                  type="checkbox"
                  name="status"
                  id={item.eng}
                  value={item.eng}
                  className="hidden peer"
                  checked={selectedList.includes(item.eng)}
                  readOnly
                />
                <label htmlFor={item.eng} className={labelStyle}>
                  {item.kor}
                </label>
              </li>
            )
          })}
        </ul>
      </form>
    </div>
  )
}

export default FilterForm
