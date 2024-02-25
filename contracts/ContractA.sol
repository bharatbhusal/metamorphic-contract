// SPDX-License-Identifier: WTFPL
pragma solidity 0.8.22;

contract ContractA {
    function die() public {
        selfdestruct(payable(address(0)));
    }
}
