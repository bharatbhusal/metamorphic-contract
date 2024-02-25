// SPDX-License-Identifier: WTFPL
pragma solidity 0.8.22;
import "./ContractA.sol";
import "./ContractB.sol";

contract Factory {
    function helloA() public returns (address) {
        return address(new ContractA());
    }

    function helloB() public returns (address) {
        return address(new ContractB(1337));
    }

    function die() public {
        selfdestruct(payable(address(0)));
    }
}
