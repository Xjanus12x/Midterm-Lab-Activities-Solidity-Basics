// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

// Declare the Todo struct
struct Todo {
    string text;
    bool completed;
}

contract Todos {
    // Use the Todo struct
    Todo[] public todos;
}
