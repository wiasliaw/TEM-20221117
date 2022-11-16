// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/MintableERC20.sol";

contract TestEvent is Test {
    MintableERC20 private _erc20;

    event Transfer(address indexed from, address indexed to, uint256 value);

    function setUp() public {
        _erc20 = new MintableERC20();
    }

    function testMint() external {
        vm.expectEmit(true, true, true, true);
        emit Transfer(address(0), address(this), 1000);
        _erc20.mint(1000);
    }
}