import * as THREE from "three"
import { Suspense, useRef, useState } from "react"
import { Canvas, useFrame } from "@react-three/fiber"
import Lights from "./Lights/Lights"
import { Physics } from "@react-three/cannon"
import Ground from "./Ground/Ground"
import Building from "./Building/Building"
import Art from "./Art/Art"
import Player from "./Player/Player"
import { Stars } from "@react-three/drei"

type MuseumProp = {
  list: any
}

const Museum = ({ list }: MuseumProp) => {
  return (
    <div className="w-full h-full bg-black">
      <Canvas
        shadows
        camera={{ fov: 60 }}
        onCreated={({ gl }) => {
          gl.shadowMap.enabled = true
          gl.shadowMap.type = THREE.PCFSoftShadowMap
        }}
      >
        <Stars />

        <fog attach="fog" args={["#272730", 30, 250]} />

        <Lights night={true} performance={true} />

        <Physics gravity={[0, -30, 0]}>
          {/* <Suspense fallback={null}> */}
          <Ground />
          <Building />
          <Art list={list} />
          {/* </Suspense> */}
          <Player />
        </Physics>
      </Canvas>
    </div>
  )
}

export default Museum
