// SPDX-License-Identifier: WTFPL
pragma solidity 0.8.22;

/**
 * @title ContractB
 * @dev A simple contract with a private uint256 variable `b`.
 */
contract ContractB {
    uint256 private b;

    /**
     * @dev Constructor function to initialize the value of `b`.
     * @param _b The initial value for the private variable `b`.
     */
    constructor(uint256 _b) {
        b = _b;
    }
}
