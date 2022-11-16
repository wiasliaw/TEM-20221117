// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/MintableERC20.sol";

contract TestRevert is Test {
    MintableERC20 private _erc20;

    function setUp() public {
        _erc20 = new MintableERC20();
    }

    function testShouldRevert() public {
        _erc20.mint(1000);
        address other = vm.addr(1);
        vm.startPrank(other);
        vm.expectRevert("ERC20: insufficient allowance");
        _erc20.transferFrom(address(this), other, 1000);
        vm.stopPrank();
    }
}
