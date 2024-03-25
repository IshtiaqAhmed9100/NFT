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
   
//   const NFT = await ethers.deployContract( 'NFT' , [owner]);

//     console.log("Deploying NFT...");
//     await NFT.waitForDeployment()

//     console.log("NFT deployed to:", NFT.target);

//     await new Promise(resolve => setTimeout(resolve, 10000));
    verify('0x9Cbb46Bf09f5AbE5AaC8fe9Ad069441Eb10F588F', [owner])
}
main()