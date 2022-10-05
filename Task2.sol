// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Balance{
 
        mapping (address => uint) balances;

        function deposit (uint _amt) public {
            balances[msg.sender] = _amt;
        }

        function checkBalance() public view returns(uint) {
            return balances[msg.sender];            
        }

}
