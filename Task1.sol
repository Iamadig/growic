// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Register {
    
    address public owner;
    
    constructor(){
        owner = msg.sender;
    }
    
    modifier onlyOwner(){
        require (msg.sender==owner, "only owner can do this action");
        _;
    }

    struct StudentID {
        string name;
        uint8 age;
        bool isRegistered;
    }

    StudentID students;
    
    mapping (address => StudentID) student_data;

    function registerStudent(address _addr, string calldata _name, uint8 _age) public onlyOwner {
        require(!student_data[_addr].isRegistered, "student already registered");
        student_data[_addr].name =_name;
        student_data[_addr].age = _age;
        student_data[_addr].isRegistered = true;
    }

    function getDetails(address _addr) public view returns(string memory, uint8) {
        return (student_data[_addr].name, student_data[_addr].age);
    } 



}
