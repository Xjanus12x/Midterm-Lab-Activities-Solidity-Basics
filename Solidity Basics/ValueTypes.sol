// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;
contract ValueTypes {
    bool public b = true;
    uint  public u = 123;

    int public i  = -123;

    int public minInt = type(int).min;
    address public  addr = 0xFFa0bD90289BdbF23573065DdCE2CE5E3D71D863;
}