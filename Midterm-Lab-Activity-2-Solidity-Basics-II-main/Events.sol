// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Events{
    //Declare an event
    event Log(address indexed sender, string message);
    event AnotherLog();

    function test() public{
        emit Log(msg.sender, "Hello Solidity");
    }
}

contract MyContract is Events{
    uint256 public someValueHere;
}