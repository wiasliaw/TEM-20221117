// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/MintableERC20.sol";
import "../src/Payment.sol";

contract TestPayment is Test {
    MintableERC20 private _token;
    SafePayment private _payment;

    function setUp() public {
        _token = new MintableERC20();
        _payment = new SafePayment(address(_token));
    }

    function testFuzzPayment(
        address from,
        address to,
        uint256 amount
    ) public {
        vm.assume(from != address(0));
        vm.assume(to != address(0));
        vm.startPrank(from);
        _token.mint(amount);
        _token.approve(address(_payment), amount);
        vm.stopPrank();

        vm.startPrank(to);
        _payment.payment(from, to, amount);
        vm.stopPrank();
    }
}
