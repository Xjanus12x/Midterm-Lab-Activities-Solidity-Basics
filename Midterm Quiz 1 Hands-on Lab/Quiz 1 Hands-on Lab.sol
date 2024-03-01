// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.3;

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */
contract MQuizContract {
    // variables
    address public owner;
    uint public age;
    uint public hoursWorked;
    uint public hourlyRate ;
    uint public totalSalary;


    modifier ownerOnly() {
        require(msg.sender == owner, "Not the contract owner");
        _;
    }

    modifier validateHourlyRate(uint256 rate) {
        require(rate > 0, "Hourly rate must be greater than zero.");
        _;
    }

    modifier validateHoursWorked(uint256 Hours) {
        require(Hours > 0,"Hours worked must be greater than zero");
        _;
    }
    
    constructor() {
        owner = msg.sender;
    }
 
     
    // Set hours worked function
    function setHoursWorked(uint256 _hoursWorked) external ownerOnly validateHoursWorked(_hoursWorked) {hoursWorked = _hoursWorked;}
    // Set age function
    function setAge(uint256 _age) external ownerOnly {age = _age;}
    // Set rate function
    function setRate(uint256 _hourlyRate) external ownerOnly validateHourlyRate(_hourlyRate) {hourlyRate = _hourlyRate;}
    // Calculate salary function
    function calculateTotalSalary() external {
        require(hourlyRate > 0 && hoursWorked > 0, "Hourly rate and hours worked must be greater than zero");
        totalSalary = hourlyRate * hoursWorked;
    }
    
}