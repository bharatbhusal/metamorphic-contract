// SPDX-License-Identifier: WTFPL
pragma solidity 0.8.22;

/**
 * @title ContractA
 * @dev A simple contract with a function to self-destruct.
 */
contract ContractA {
    /**
     * @dev Function to self-destruct the contract and send any remaining funds to address 0.
     */
    function die() public {
        selfdestruct(payable(address(0)));
    }
}
