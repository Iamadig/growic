// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

contract Balance{

    event FundsDeposited(address user, uint256 amount);
    event ProfileUpdated(address user);

    address owner;
    uint fee = 5;

    constructor(){
        owner = msg.sender;
    }
 
    modifier onlyOwner(){
        require(msg.sender == owner);
        _;
    }

    modifier onlyDepositer(){
        require(balances[msg.sender] != 0);
        _;
    }

    modifier checkAmt(uint _val) {
        require(_val > fee,"Amount too small. Increase it");
        _;
    }
        mapping (address => uint) balances;

        struct userID {
            string name;
            uint256 age; 
        }

        userID users;

        function deposit() public payable{
            balances[msg.sender] += msg.value;
            emit FundsDeposited(msg.sender, msg.value);
        }

        function checkBalance() public view returns(uint) {
            return balances[msg.sender];            
        }

        function setUserDetails(string calldata name, uint256 age) public{
            users.name = name;
            users.age = age;
            emit ProfileUpdated(msg.sender);
        }

        function getUserDetail() public view returns(string memory, uint) {
            return(users.name, users.age);
        }

        function withdraw(address _adr, uint _amt) public onlyOwner{
            balances[msg.sender] -= _amt;
            balances[_adr] += _amt;
        }

        function addFund (uint _amt) public onlyDepositer checkAmt(_amt) {
            balances[msg.sender] += _amt;
        }

         

}
