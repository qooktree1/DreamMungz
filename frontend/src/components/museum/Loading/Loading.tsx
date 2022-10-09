import React, { useState, useEffect } from "react"
import * as THREE from "three"
import { useTransition, a } from "react-spring"

const Loading = () => {
  const [finished, set] = useState(false)
  const [width, setWidth] = useState(0)

  useEffect(() => {
    THREE.DefaultLoadingManager.onLoad = () => set(true)
    THREE.DefaultLoadingManager.onProgress = (url, itemsLoaded, itemsTotal) =>
      setWidth((itemsLoaded / itemsTotal) * 200)
  }, [])

  const props = useTransition(finished, {
    from: { opacity: 1, width: 0 },
    leave: { opacity: 0 },
    update: { width },
  })

  return props(
    (props, item) =>
      !item && (
        <a.div
          className="fixed top-0 left-0 z-50 flex flex-col items-center justify-center w-full h-full bg-black"
          style={{ opacity: props.opacity }}
        >
          <h1 className="text-4xl text-white ">Dream Mungz</h1>
          <div className="w-[200px] h-[3px]">
            <a.div
              className="bg-white h-[3px]"
              style={{ width: props.width }}
            />
          </div>
        </a.div>
      )
  )
}

export default Loading
