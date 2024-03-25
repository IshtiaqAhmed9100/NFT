// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract NFT is ERC721, Ownable {

    mapping(address => uint256) private _mintedCount;
    mapping(uint256 => bool) private _tokenExists;

    uint256 private _priceUSD = 100;
    uint256 private _startTime;
    uint256 private _mintDuration;

    address payable public _ownerWallet;

    constructor(address payable owner, uint256 startTime, uint256 mintDuration ) Ownable(owner) ERC721("MyNFT", "NFT"){
             _ownerWallet = owner;
            startTime = block.timestamp;
            mintDuration= startTime + 7200;   
    }

    function mint() external payable {
        require(_mintedCount[msg.sender] < 2, "only 2 nfts allowed");
        require( _startTime < _mintDuration);  //  234554332 < 7200
        require( msg.value >= 0.01 ether || msg.value >= _priceUSD * 10**18);

        uint256 tokenId = totalToken()+ 1;
        _mint(msg.sender, tokenId);
        _mintedCount[msg.sender] =  _mintedCount[msg.sender]+1;
        _tokenExists[tokenId] = true;
    }

    function withdrawFunds() external onlyOwner {
        uint256 contractBalance = address(this).balance;
        require(contractBalance > 0);
        _ownerWallet.transfer(contractBalance);
    }

    // function startMinting() external onlyOwner {
    //     require(_startTime == 0, "Minting already started");
    //     _startTime = block.timestamp;
    // }

    function totalToken() public view returns (uint256) {
        uint256 total = 0;
        for (uint256 i = 1; _tokenExists[i]; i++) {
            total++;
        }
        return total;
    }
}
