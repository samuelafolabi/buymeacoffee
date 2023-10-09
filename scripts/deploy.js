const hre = require("hardhat");

async function main() {
  // We get the contract to deploy.
  const BuyMeACoffee = await hre.ethers.getContractFactory("BuyMeACoffee");
  const buyMeACoffee = await BuyMeACoffee.deploy();

  // Deploy the contract.
  const contractAddress = await buyMeACoffee.getAddress();
  console.log("BuyMeACoffee deployed to:", contractAddress);

  // local deployment :  0x5FbDB2315678afecb367f032d93F642f64180aa3
  // online deployment :  0x7C0fb26189D92Bf457d81dbC4A3072E88188C6C1
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
