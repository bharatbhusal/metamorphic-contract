# Metamorphic Contract Attack Demonstration

## Objective:

The objective of this Solidity code is to demonstrate a vulnerability known as the "Metamorphic Contract Attack." 


## What is a Metamorphic Contract?

A metamorphic contract refers to a smart contract that can change its code while maintaining the same contract address. This is typically achieved by deploying a new contract with updated code at the same address as the old contract. Metamorphic contracts can be exploited in attacks such as the Metamorphic Contract Attack, where malicious code is deployed in place of previously destroyed contract code.


## Code Overview:

### Contracts:

1. **ContractA**:
   - Contains a function `die()` that triggers `selfdestruct`, destroying the contract and sending any remaining funds to address `0`.

2. **ContractB**:
   - Contains a private variable `b` and a constructor that sets the value of `b`.

3. **Factory**:
   - Contains functions `createContractA()` and `createContractB()` that deploy instances of contracts ContractA and ContractB, respectively.
   - Also contains a `die()` function that destructs the contract.

4. **MetamorphicContract**:
   - This contract is a test contract that inherits from `Test`.
   - Defines a setup function `setUp()` that deploys a Factory contract and an instance of ContractA, then triggers the `die()` function of ContractA and Factory.
   - Defines a test function `testMorphingContract()` that verifies if the code of contracts ContractA and Factory were destroyed and then attempts to redeploy Factory and deploy another instance of ContractB. This test aims to demonstrate the vulnerability known as the Metamorphic Contract Attack.

### Vulnerability Exploitation:

The code exploits the vulnerability during the setup phase by destroying the code of ContractA and Factory using the `selfdestruct` function. It then attempts to redeploy Factory and deploy another instance of ContractB. If successful, this demonstrates how an attacker could replace previously destroyed contract code with malicious code, potentially leading to unexpected behavior or security vulnerabilities in the system.

### Testing:

The code includes a test function `testMorphingContract()` that verifies the behavior described above, demonstrating the vulnerability in action.
