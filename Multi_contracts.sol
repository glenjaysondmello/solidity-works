// SPDX-License-Identifier: MIT

// Multiple smart contracts
pragma solidity >=0.8.4;

import "OtherSecond.sol";

contract MainContract {
    address public second;
    function setAddress(address _second) 
    public {
        second = _second;
    }

    function calling() 
    public 
    returns (string memory){
        OtherSmartContract b = new OtherSmartContract();
        return b.doSomething();
    }

    function calling2()
    public 
    returns (string memory){
        OtherSecond c = new OtherSecond();
        return c.doAgainSomething();
    }
}

contract OtherSmartContract {
    function doSomething()
    external
    pure
    returns (string memory) {
        return "Hello this is other smart contract";
    }
}
