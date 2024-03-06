// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract GradeContract {
    address owner;
    enum GradeStatus { Pass, Fail }

    struct Student {
        string name;
        uint256 preliminaryGrade;
        uint256 midtermGrade;
        uint256 finalGrade;
        GradeStatus status;
    }
     constructor() {
        owner = msg.sender;
    }
    mapping(address => Student) public students;

    event GradeComputed(string indexed studentName, GradeStatus status);
    modifier validGrade(uint256 grade) {
        require(grade >= 0 && grade <= 100, "Invalid grade");
        _;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }


    function setName(string calldata _name) external onlyOwner {
        students[msg.sender].name = _name;
    }

    function setPreliminaryGrade(uint256 _grade) external onlyOwner validGrade(_grade) {
        students[msg.sender].preliminaryGrade = _grade;
    }

    function setMidtermGrade(uint256 _grade) external onlyOwner validGrade(_grade) {
        students[msg.sender].midtermGrade = _grade;
    }

    function setFinalGrade(uint256 _grade) external onlyOwner validGrade(_grade) {
        students[msg.sender].finalGrade = _grade;
    }

    function calculateGrade(address _studentAddress) external onlyOwner {
        Student storage student = students[_studentAddress];
        uint256 averageGrade = (student.preliminaryGrade + student.midtermGrade + student.finalGrade) / 3;
        if (averageGrade >= 50) {
            student.status = GradeStatus.Pass;
        } else {
            student.status = GradeStatus.Fail;
        }
        emit GradeComputed(student.name, student.status);
    }
}

