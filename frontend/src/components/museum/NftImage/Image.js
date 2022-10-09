import React, { useMemo } from "react"
import { useLoader } from "@react-three/fiber"
import { GLTFLoader } from "three/examples/jsm/loaders/GLTFLoader"
import { draco, useGLTF } from "@react-three/drei"
import { useBox } from "@react-three/cannon"
import * as THREE from "three"
import { BoxGeometry, TextureLoader } from "three"

const Image = ({ url, position, size }) => {
  let imageMap = useLoader(TextureLoader, url)

  const [ref] = useBox(() => ({
    type: "static",
    position,
  }))

  return (
    <mesh ref={ref}>
      <boxGeometry attach="geometry" args={size} />
      <meshStandardMaterial map={imageMap} />
    </mesh>
  )
}

export default Image
