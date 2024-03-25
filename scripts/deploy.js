const { time } = require("console");
const { ethers } = require("hardhat");
const { run } = require("hardhat");
async function verify(address, constructorArguments) {
    console.log(`verify  ${address} with arguments ${constructorArguments.join(',')}`)
    await run("verify:verify", {
        address,
        constructorArguments
    })
}
async function main() {
  let owner =  '0x12eF0F1C99D8FD50fFd37cCd12B09Ef7f1213269';
  let startTime = 1711384652;
  let mintDuration = 1711391852;
   
//   const NFT = await ethers.deployContract( 'NFT' , [owner, startTime , mintDuration]);

//     console.log("Deploying NFT...");
//     await NFT.waitForDeployment()

//     console.log("NFT deployed to:", NFT.target);

//     await new Promise(resolve => setTimeout(resolve, 10000));
    verify('0xe122207A5a700311eD8F9b40C99B0927CfDCfb38', [owner, startTime , mintDuration])
}
main()