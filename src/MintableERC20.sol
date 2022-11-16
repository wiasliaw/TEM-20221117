// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "openzeppelin-contracts/token/ERC20/ERC20.sol";

contract MintableERC20 is ERC20 {
    constructor() ERC20("a", "b") {}

    function mint(uint256 amount) external {
        _mint(msg.sender, amount);
    } 
}
