//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract MyContract {
    uint256 public myNumber;
    mapping(address => uint256) public valueMapping;

    //Constructor function
    constructor() {
        myNumber = 42;
        // Example this will initialize a default value for the contract creator
        valueMapping[msg.sender] = 100;
    }
}
