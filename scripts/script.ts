import { run, ethers } from "hardhat";

async function main() {
  await run("compile");

  const NFT = await ethers.getContractFactory("NFT");
  
  const nft = await NFT.deploy();
  await nft.deployed();

}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
