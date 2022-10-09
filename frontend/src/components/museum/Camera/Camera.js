import React, { useRef, useEffect, useLayoutEffect } from "react"
import { useFrame, useThree } from "@react-three/fiber"

const Camera = (props) => {
  const cameraRef = useRef()
  const set = useThree(({ set }) => set)

  useLayoutEffect(() => {
    set({ camera: cameraRef.current })
    // console.log(cameraRef)
  }, [])

  // console.log(cameraRef.current)
  useFrame(() => {
    cameraRef.current.updateMatrixWorld({ force: true })
  })

  return <perspectiveCamera ref={cameraRef} {...props} />
}

export default Camera
