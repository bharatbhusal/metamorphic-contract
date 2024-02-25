// SPDX-License-Identifier: WTFPL
pragma solidity 0.8.22;

import {Test} from "forge-std/Test.sol";
import "../contracts/ContractA.sol";
import "../contracts/ContractB.sol";
import "../contracts/FactoryContract.sol";

contract MetamorphicContract is Test {
    ContractA private a;
    ContractB private b;
    Factory private factory;

    function setUp() public {
        factory = new Factory{salt: keccak256(abi.encode("69"))}();
        a = ContractA(factory.helloA());

        a.die();
        factory.die();
    }

    function testMorphingContract() public {
        assertEq(address(a).code.length, 0);
        assertEq(address(factory).code.length, 0);

        factory = new Factory{salt: keccak256(abi.encode("69"))}();

        b = ContractB(factory.helloB());
        assertEq(address(a), address(b));
    }
}
