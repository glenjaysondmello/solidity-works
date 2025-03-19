// SPDX-License-Identifier: MIT

// Error Handling
pragma solidity >=0.8.4;

contract Error_Hand {
    //Require
    function hello1() public pure {
        require(10<5, "I am bad at math");
    }

    //assert
    function hello2() public pure {
        assert(10==10);
    }

    //revert
    function hello3() public pure{
        if(10<5){
            revert();
        }
    }
}
