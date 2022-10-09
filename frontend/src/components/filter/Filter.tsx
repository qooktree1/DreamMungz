import React, { ChangeEvent, useEffect, useState } from "react"
import { NavigateOptions } from "react-router-dom"

import FilterForm from "./FilterForm"

interface Filter {
  job: string | null
  hair: string | null
  tier: string | null
  color: string | null
  gender: string | null
  face: string | null
  sell: boolean
  status: string[]
  page: number
  address: string | null
}

interface FilterProp {
  filter: Filter
  showForm: boolean
  setFilter: (newQuery: Filter, options?: NavigateOptions | undefined) => void
  selectedList: string[]
}
const Filter = ({
  filter: origin,
  setFilter,
  showForm,
  selectedList,
}: FilterProp) => {
  const handleFormChange = (event: ChangeEvent<HTMLFormElement>) => {
    let form = event.currentTarget
    let formData = new FormData(form)

    let filter: Filter = {
      job: formData.get("job") as string,
      hair: formData.get("hair") as string,
      tier: formData.get("tier") as string,
      color: formData.get("color") as string,
      gender: formData.get("gender") as string,
      face: formData.get("face") as string,
      sell: origin.sell,
      status: formData.getAll("status") as string[],
      page: 0,
      address: null,
    }
    // console.log(JSON.stringify(filter))
    setFilter(filter, { replace: false })
  }

  return (
    <div className="">
      <div className="flex ">
        {/* <SelectedFilters filter={origin} resetFilter={resetFilter} /> */}
      </div>
      {showForm && (
        <FilterForm
          formHandler={handleFormChange}
          filter={origin}
          selectedList={selectedList}
          setFilter={setFilter}
        />
      )}
    </div>
  )
}

export default Filter
