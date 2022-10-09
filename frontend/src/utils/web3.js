import { MUNGContract, MUNGContractAddress, web3 } from "./Web3Config"

export const getBalance = async () => {
  const walletAddress = localStorage.getItem("publicAddress")
  const balance = await MUNGContract.methods.balanceOf(walletAddress).call()
  return parseInt(balance * 10 ** -18)
}

export const pushGameStart = async (publicAddress, cost) => {
  const aWeiValue = 10 ** 18
  const bWeiValue = cost
  const totalWeiValue = web3.utils
    .toBN(aWeiValue)
    .mul(web3.utils.toBN(bWeiValue))

    await MUNGContract.methods
      .approve(publicAddress, totalWeiValue)
      .send({ from: publicAddress })
    await MUNGContract.methods
      .transferFrom(publicAddress, MUNGContractAddress, totalWeiValue)
      .send({ from: publicAddress })
}
