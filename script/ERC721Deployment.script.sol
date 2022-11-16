// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "openzeppelin-contracts/token/ERC721/ERC721.sol";

contract ERC721Deployment is Script {
    // default sig
    // load .env by default
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);
        ERC721 nft = new ERC721("Hello", "World");
        vm.stopBroadcast();
        console.logAddress(address(nft));
    }
}
