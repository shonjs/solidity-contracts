import { expect } from "chai";
import { ethers } from "hardhat";
import { Signer } from "ethers"; 

describe("NFT Tests",  () => {
  let accounts: Signer[];

  beforeEach(async () => {
    accounts = await ethers.getSigners();
  })
  
  it("Should be able to mint a new nft", async () => {
    const ownerAddress = await accounts[0].getAddress();
    const tokenURI = "https://www.testnft.com/details.json";

    // Deploy contract
    const NFT = await ethers.getContractFactory("NFT");
    const nft = await NFT.deploy("TestNFT", "TNFT");
    await nft.deployed();

    // Mint new NFT
    const mintTx = await nft.create(ownerAddress, tokenURI);
    // Wait for transaction
    await mintTx.wait();

    expect(await nft.ownerOf(1)).to.equal(ownerAddress);
    expect(await nft.tokenURI(1)).to.equal(tokenURI);
  });
});
