import React from "react"
import Picture from "../Picture/Picture"
import Display from "../Display/Display"
import Image from "../NftImage/Image"

// const img = [
//   "https://ipfs.io/ipfs/QmUQ2aFFDnpp2iVon4f98Moq3R3GGyrfjko4ja5CQE32RT",
//   "https://ipfs.io/ipfs/QmamFg26kreM3dEAp8Wx64nWZPmH97PMQZ1x6xbitdzpfh",
//   "https://ipfs.io/ipfs/QmQus4sx15VDkNtDuApqdgdd8rgpCb6W4eWrr2goFTey1N",
//   "https://ipfs.io/ipfs/QmQ9uUWNiMSPMmeduk7wsGRa8bMQKVQErQfaV2Ufnem39p",
//   "https://ipfs.io/ipfs/QmZGHkH4zbL1JwnaVo9PWFgUUfYggisUeCLVGzwJ6jEbAf",
//   "https://ipfs.io/ipfs/QmV71JPF9bbjpCVNSeNJLQRz2TjPLdhVMXtBVYRgpePRjy",
// ]

const Art = ({ list: img }) => {
  return (
    <>
      {/* 정면 (창문 앞 벽 ) */}
      <Display position={[0, 5, -10]} size={[10, 18, 1]} />
      {/*창가 오른쪽 */}
      <Display position={[20, 5, 0]} size={[1, 18, 11]} />
      {/*출입위치 오른쪽 */}
      <Display position={[20, 5, 25]} size={[1, 18, 11]} />
      {/* 출입위치 왼쪽  */}

      <Display position={[-20, 5, 0]} size={[1, 18, 11]} />
      {/* 창가 왼쪽  */}
      <Display position={[-20, 5, 25]} size={[1, 18, 11]} />

      {/* nft 이미지 */}
      {/* 정면 벽  */}
      <Image position={[0, 8, -9]} size={[9, 5, 0.1]} url={"/dreammungz.png"} />
      {/* 오른쪽 창가 벽  */}
      <Image position={[19.3, 7, 0]} size={[0.1, 5, 5]} url={img[0].url} />
      {/* 오른쪽 젤 끝 벽면 */}
      <Image position={[34.7, 12, 12]} size={[0.1, 5, 5]} url={img[1].url} />
      {/* 오른쪽 출입쪽 벽 */}
      <Image position={[19.3, 7, 25]} size={[0.1, 5, 5]} url={img[2].url} />
      {/* 왼쪽 창가 벽 */}
      <Image position={[-19.3, 7, 0]} size={[0.1, 5, 5]} url={img[3].url} />
      {/* 왼쪽 출입쪽 벽 */}
      <Image position={[-19.4, 7, 25]} size={[0.1, 5, 5]} url={img[4].url} />
      {/* 왼쪽 젤 끝 벽 */}
      <Image position={[-34.6, 10, 12]} size={[0.1, 5, 5]} url={img[5].url} />

      {/* 액자 프레임들  */}

      <Picture
        url={"/assets/3D/Girl/scene.gltf"}
        scale={[4, 3, 4]}
        position={[-34.6, 10, 12]}
        rotation={[-Math.PI / 2, 0, 0]}
        metalness={0.7}
        roughness={0.8}
      />

      <Picture
        url={"/assets/3D/Portrait/scene.gltf"}
        scale={[4, 3, 4]}
        position={[19.3, 7, 0]}
        rotation={[0, -Math.PI, 0]}
        metalness={0.9}
        roughness={0.9}
      />
      {/* 오른쪽 끝벽 */}
      <Picture
        url={"/assets/3D/Hands/scene.gltf"}
        scale={[0.04, 0.1, 0.05]}
        position={[34.7, 15, 12]}
        rotation={[0, -Math.PI / 2, Math.PI]}
        metalness={0}
        roughness={0.9}
      />
      {/* 오른쪽 출입벽 */}
      <Picture
        url={"/assets/3D/Wedding/scene.gltf"}
        scale={[2, 2.2, 2.2]}
        position={[19.3, 7, 25]}
        rotation={[Math.PI / 2, Math.PI, 0]}
        metalness={0.0}
        roughness={0.3}
      />
      {/* wilson portrait */}
      <Picture
        url={"/assets/3D/Wilson/scene.gltf"}
        scale={[2, 2.2, 2.2]}
        position={[-19.3, 7, 0]}
        rotation={[-Math.PI / 2, 0, 0]}
        metalness={0}
        roughness={0.3}
      />
      {/* 왼쪾 출입쪽 벽 */}
      <Picture
        url={"/assets/3D/OldMan/scene.gltf"}
        scale={[4, 3, 4]}
        position={[-19.4, 7, 25]}
        rotation={[0, 0, 0]}
        metalness={0.9}
        roughness={0.9}
      />
      {/* 왼쪽 끝벽*/}
      <Picture
        url={"/assets/3D/Girl/scene.gltf"}
        scale={[4, 3, 4]}
        position={[-34.6, 10, 12]}
        rotation={[-Math.PI / 2, 0, 0]}
        metalness={0.7}
        roughness={0.8}
      />
    </>
  )
}

export default Art
