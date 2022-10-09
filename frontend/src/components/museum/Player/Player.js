import * as THREE from "three"
import React, { useEffect, useRef } from "react"
import { useSphere } from "@react-three/cannon"
import { useThree, useFrame } from "@react-three/fiber"
import PointerLockControls from "../PointerLockControls/PointerLockControls"
import usePlayerControls from "../usePlayerControls/usePlayerControls"

const direction = new THREE.Vector3()
const frontVector = new THREE.Vector3()
const sideVector = new THREE.Vector3()
const rotation = new THREE.Vector3()
// const speed = new THREE.Vector3()

const Player = (props) => {
  const { camera } = useThree()
  // console.log(camera)
  const { forward, backward, left, right, jump, speed } = usePlayerControls()
  const [ref, api] = useSphere(() => ({
    mass: 1,
    type: "Dynamic",
    position: [10, 20, 33],
    rotation: [0, Math.PI / 2, 0],
    args: [5],
    ...props,
  }))
  // console.log(forward, backward, left, right)
  const velocity = useRef([0, 0, 0])

  useEffect(() => api.velocity.subscribe((v) => (velocity.current = v)), [])

  useFrame(() => {
    // camera.position.copy(ref.current.position)
    ref.current.getWorldPosition(camera.position)
    frontVector.set(0, 0, Number(backward) - Number(forward))
    sideVector.set(Number(left) - Number(right), 0, 0)

    direction
      .subVectors(frontVector, sideVector)
      .normalize()
      .multiplyScalar(speed)
      .applyEuler(camera.rotation)

    // speed.fromArray(velocity.current)
    api.velocity.set(direction.x, velocity.current[1], direction.z)
    if (jump && Math.abs(velocity.current[1].toFixed(2)) < 100) {
      api.velocity.set(velocity.current[0], 10, velocity.current[2])
    }
  })

  return (
    <>
      <PointerLockControls />
      <mesh ref={ref}></mesh>
    </>
  )
}

export default Player
