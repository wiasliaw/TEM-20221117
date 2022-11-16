// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "openzeppelin-contracts/token/ERC20/utils/SafeERC20.sol";

contract SafePayment {
    address private _erc20;

    constructor(address erc20) {
        _erc20 = erc20;
    }

    function payment(
        address from,
        address to,
        uint256 value
    ) external {
        SafeERC20.safeTransferFrom(IERC20(_erc20), from, to, value);
    }
}
