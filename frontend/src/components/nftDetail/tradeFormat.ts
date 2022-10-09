import {
  MFTContract,
  MFTSaleFactoryContractAddress,
  MFTSaleFactoryContract,
  MUNGContract,
  web3,
} from "../../utils/Web3Config"
import { http } from "../../api/axios"
import Swal from "sweetalert2"

// NFT 판매 등록 -------------------------------------------------------------------------
export const sellFormat = async (
  publicAddress: string,
  negoAble: boolean,
  tokenId: number,
  buyNowPrice: number
) => {
  // 판매 Smart Contract
  try {
    // 권한 부여
    await MFTContract.methods
      .setApprovalForAll(MFTSaleFactoryContractAddress, true)
      .send({ from: publicAddress })

    await MFTSaleFactoryContract.methods
      .createSale(tokenId, publicAddress, buyNowPrice, negoAble)
      .send({ from: publicAddress })
      .then((res: any) => {
        // console.log("판매등록", res)
      })

    const contractId = await MFTSaleFactoryContract.methods
      .getCurrentSaleOfMFT(tokenId)
      .call()
    await http
      .post(`trade/nftRegister`, {
        address: publicAddress,
        contractId: contractId,
        negoAble: negoAble,
        price: buyNowPrice,
        tokenId: tokenId,
      })
      .then((res) => console.log(res))
      .catch((err) => console.error(err))

    Swal.fire({
      text: "판매 등록이 완료 되었습니다.",
      icon: "success",
      showConfirmButton: false,
    })

    setTimeout(() => {
      window.location.reload()
    }, 2000)
  } catch (err) {
    console.error("판매 등록 에러", err)
    window.location.reload()
  }
}

// NFT 판매 중단 -------------------------------------------------------------------------
export const sellAbortFormat = async (
  tokenId: number,
  publicAddress: string
) => {
  try {
    const saleContractId = await MFTSaleFactoryContract.methods
      .getCurrentSaleOfMFT(tokenId)
      .call()

    await MFTSaleFactoryContract.methods
      .cancelSale(saleContractId)
      .send({ from: publicAddress })

    await http
      .put("trade/nftStop", {
        address: publicAddress,
        contractId: saleContractId,
        tokenId: tokenId,
      })
      .then((res) => console.log(res))
      .catch((err) => console.error(err))

    Swal.fire({
      text: "판매 중단 완료하였습니다.",
      icon: "success",
      showConfirmButton: false,
    })

    setTimeout(() => {
      window.location.reload()
    }, 2000)
  } catch (err) {
    console.log(err)
    window.location.reload()
  }
}

// NFT 즉시 구매 -------------------------------------------------------------------------
export const buyNowFormat = async (
  balance: number,
  cost: number,
  tokenId: number,
  publicAddress: string
) => {
  try {
    // contractId 받기
    const saleContractId = await MFTSaleFactoryContract.methods
      .getCurrentSaleOfMFT(tokenId)
      .call()

    // 주소
    const saleContractAddress = await MFTSaleFactoryContract.methods
      .getSale(saleContractId)
      .call()

    const aWeiValue = 10 ** 18

    // 0.003 Mwei == 3000 wei
    const bWeiValue = cost

    const totalWeiValue = web3.utils
      .toBN(aWeiValue)
      .mul(web3.utils.toBN(bWeiValue))

    await MUNGContract.methods
      .approve(saleContractAddress, totalWeiValue)
      .send({ from: publicAddress })

    // 즉시 구매 SMART CONTRACT
    await MFTSaleFactoryContract.methods
      .buyNow(saleContractId, publicAddress)
      .send({ from: publicAddress })

    await http
      .post("trade/nftPurchase", {
        address: publicAddress,
        contractId: parseInt(saleContractId),
        tokenId: tokenId,
      })
      .then((res) => console.log("즉시구매", res))
      .catch((err) => console.error(err))

    Swal.fire({
      text: "구매를 완료하였습니다.",
      icon: "success",
      showConfirmButton: false,
    })

    setTimeout(() => {
      window.location.reload()
    }, 2000)
  } catch (err) {
    window.location.reload()
  }
}

// NFT 네고 제안 수락 -------------------------------------------------------------------------
export const acceptNegoFormat = async (
  tokenId: number,
  negoId: number,
  publicAddress: string
) => {
  try {
    // contractId 받기
    const saleContractId = await MFTSaleFactoryContract.methods
      .getCurrentSaleOfMFT(tokenId)
      .call()

    // NFT 네고 제안 수락 SMARTCONTRACT
    await MFTSaleFactoryContract.methods
      .acceptNego(saleContractId, negoId)
      .send({ from: publicAddress })

    // NFT 네고 제안 수락 REST API
    await http
      .post("trade/offerAccept", {
        contractId: negoId,
        tokenId: tokenId,
      })
      .then((res) => console.log(res))
      .catch((err) => console.error(err))

    Swal.fire({
      text: "제안을 완료하였습니다.",
      icon: "success",
      showConfirmButton: false,
    })

    setTimeout(() => {
      window.location.reload()
    }, 2000)
  } catch (err) {
    console.error(err)
    window.location.reload()
  }
}

// NFT 네고 제안 취소 -------------------------------------------------------------------------
// Nego Contract Id를 Offer List에서 Item 클릭시 해당 Item의 NegoId를 사용할 수 있어야 함
export const cancelNegoFormat = async (
  clickedNegoId: number,
  publicAddress: string,
  tokenId: number
) => {
  try {
    // SMART CONTRACT
    await MFTSaleFactoryContract.methods
      .cancelNego(clickedNegoId)
      .send({ from: publicAddress })

    // RESTAPI
    await http.put("trade/offerCancel", {
      address: publicAddress,
      contractId: clickedNegoId,
      tokenId: tokenId,
    })

    await http.put(`trade/refund/${clickedNegoId}`)
    Swal.fire({
      text: "제안이 취소되었습니다.",
      icon: "success",
      showConfirmButton: false,
    })

    setTimeout(() => {
      window.location.reload()
    }, 2000)
  } catch (err) {
    console.error(err)
    window.location.reload()
  }
}

// NFT 네고 제안 -------------------------------------------------------------------------
export const proposalFormat = async (
  balance: number,
  proposal: number,
  tokenId: number,
  publicAddress: string
) => {
  if (balance < proposal) {
    // 금액이 부족할때
    alert("M이 부족합니다!")
  } else {
    try {
      // contractId 받기
      const saleContractId = await MFTSaleFactoryContract.methods
        .getCurrentSaleOfMFT(tokenId)
        .call()

      const saleContractAddress = await MFTSaleFactoryContract.methods
        .getSale(saleContractId)
        .call()

      const aWeiValue = 10 ** 18

      // 0.003 Mwei == 3000 wei
      const bWeiValue = proposal

      const totalWeiValue = web3.utils
        .toBN(aWeiValue)
        .mul(web3.utils.toBN(bWeiValue))

      await MUNGContract.methods
        .approve(saleContractAddress, totalWeiValue)
        .send({ from: publicAddress })

      const sellerAddress = await MFTContract.methods.ownerOf(tokenId).call()

      await MUNGContract.methods
        .approve(sellerAddress, totalWeiValue)
        .send({ from: publicAddress })

      // console.log("saleContractId", saleContractId)
      // console.log("saleContractAddress", saleContractAddress)
      // console.log("proposal", proposal)
      let createdNegoId

      // createNego
      await MFTSaleFactoryContract.methods
        .createNego(saleContractId, publicAddress, proposal, false, false)
        .send({ from: publicAddress })
        .then((res: any) => {
          createdNegoId = parseInt(res.events.NegoCreated.returnValues.negoId)
        })

      // // 네고 제안
      // console.log(
      //   publicAddress,
      //   saleContractId,
      //   proposal,
      //   tokenId,
      //   createdNegoId
      // )
      await http
        .post("trade/offerRegister", {
          address: publicAddress,
          tradeContractId: saleContractId,
          price: proposal,
          tokenId: tokenId,
          negoContractId: createdNegoId,
        })
        .then((res) => console.log(res))
        .catch((err) => console.error(err))

      Swal.fire({
        text: "제안하셨습니다.",
        icon: "success",
        showConfirmButton: false,
      })

      setTimeout(() => {
        window.location.reload()
      }, 2000)
    } catch (err) {
      console.error(err)
      window.location.reload()
    }
  }
}

// NFT 네고 환불
export const proposalRefundFormat = async (
  saleId: number,
  negoId: number,
  publicAddress: string
) => {
  await MFTSaleFactoryContract.methods
    .refundNego(saleId, negoId, publicAddress)
    .send({ from: publicAddress })

  const test = await http.put(`trade/refund/${negoId}`)
  // console.log(test)
}
