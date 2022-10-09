const SSFToken = artifacts.require("SSFToken");
const MFT = artifacts.require("MFT");
const MFTSaleFactory = artifacts.require("MFTSaleFactory");

module.exports = async function (deployer) {
  await deployer.deploy(SSFToken, "MUNG", "M");
  await deployer.deploy(MFT);
  await deployer.deploy(MFTSaleFactory, SSFToken.address, MFT.address);
};
