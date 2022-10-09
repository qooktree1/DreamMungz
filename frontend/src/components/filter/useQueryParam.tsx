import { useMemo, useCallback } from "react"
import type { NavigateOptions } from "react-router-dom"
import { Routes, Route, Link, useSearchParams } from "react-router-dom"
import * as JSURL from "jsurl"

export default function useQueryParam<T>(
  key: string
): [T | undefined, (newQuery: T, options?: NavigateOptions) => void] {
  let [searchParams, setSearchParams] = useSearchParams()
  let paramValue = searchParams.get(key)

  let value = useMemo(() => JSURL.parse(paramValue), [paramValue])
  let setValue = useCallback(
    (newValue: T, options?: NavigateOptions) => {
      let newSearchParams = new URLSearchParams(searchParams)
      newSearchParams.set(key, JSURL.stringify(newValue))
      setSearchParams(newSearchParams, { replace: false })
    },
    [key, searchParams, setSearchParams]
  )

  return [value, setValue]
}
