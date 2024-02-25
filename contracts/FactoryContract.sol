// SPDX-License-Identifier: WTFPL
pragma solidity 0.8.22;

// Importing ContractA and ContractB for deployment
import "./ContractA.sol";
import "./ContractB.sol";

/**
 * @title Factory
 * @dev A contract for deploying ContractA and ContractB instances.
 */
contract Factory {
    /**
     * @dev Deploys a new instance of ContractA.
     * @return The address of the newly deployed ContractA instance.
     */
    function createContractA() public returns (address) {
        return address(new ContractA());
    }

    /**
     * @dev Deploys a new instance of ContractB with the provided value for `b`.
     * @return The address of the newly deployed ContractB instance.
     */
    function createContractB() public returns (address) {
        return address(new ContractB(420));
    }

    /**
     * @dev Destroys the Factory contract and sends any remaining funds to address 0.
     */
    function die() public {
        selfdestruct(payable(address(0)));
    }
}
