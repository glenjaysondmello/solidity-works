// SPDX-License-Identifier: MIT

// Creating a Bank
pragma solidity >=0.8.4; 

contract Bank {
    struct Account {
        address owner;
        uint256 balance;
        uint256 accountCreatedTime;
    }
    mapping(address => Account) public MyFund;

    event balanceAdded(address owner, uint256 balance, uint256 timestamp);
    event withdrawalDone(address owner, uint256 balance, uint256 timestamp);

    modifier minimum() {
        require(msg.value >= 1 ether, "Doesn't follow minimum criteria");
        _;
    }

    function accountCreated()
    public
    payable
    minimum {
        MyFund[msg.sender].owner = msg.sender;
        MyFund[msg.sender].balance = msg.value;
        MyFund[msg.sender].accountCreatedTime = block.timestamp;
        emit balanceAdded(msg.sender, msg.value, block.timestamp);
    }

    function deposit()
    public 
    payable 
    minimum {
        MyFund[msg.sender].balance += msg.value;
        emit balanceAdded(msg.sender, msg.value, block.timestamp);
    }

    function withdrawal()
    public 
    payable {
        payable(msg.sender).transfer(MyFund[msg.sender].balance);
        MyFund[msg.sender].balance = 0;
        emit withdrawalDone(msg.sender, MyFund[msg.sender].balance, block.timestamp);
    }
}












