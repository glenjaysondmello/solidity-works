// SPDX-License-Identifier: MIT

// Creating a Vault
pragma solidity >=0.8.4;

contract Vault {
    address public owner;

    struct locker {
        uint256 value;
        uint256 time_locked;
    }
    uint counter = 0;
    mapping(uint => locker) public Vaults;

    event deposited(uint256 value, uint256 time_locked);
    event withdrawed(uint256 value, uint256 time_locked);


    modifier onlyOwner {
        require(msg.sender == owner, "Can't touch this!");
        _;
    }

    constructor() {
        owner = msg.sender;
    }
    
    function deposit(uint256 _time) 
    public 
    payable 
    onlyOwner{
        counter += 1;
        Vaults[counter].time_locked = _time;
        Vaults[counter].value = msg.value;
        emit deposited(msg.value, _time);
    }

    function withdraw(uint _lockerNumber)
    public 
    onlyOwner{
        require(block.timestamp >= Vaults[_lockerNumber].time_locked, "Come Later");
        payable(owner).transfer(Vaults[_lockerNumber].value);
        emit withdrawed(Vaults[_lockerNumber].value, Vaults[_lockerNumber].time_locked);
    }
}











