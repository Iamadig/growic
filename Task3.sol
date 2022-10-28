// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

contract Balance{
 
        mapping (address => uint) balances;

        struct userID {
            string name;
            uint256 age; 
        }

        userID users;

        function deposit (uint _amt) public {
            balances[msg.sender] = _amt;
        }

        function checkBalance() public view returns(uint) {
            return balances[msg.sender];            
        }

        function setUserDetails(string calldata name, uint256 age) public{
            users.name = name;
            users.age = age;
        }

        function getUserDetail() public view returns(string memory, uint) {
            return(users.name, users.age);
        }



}
