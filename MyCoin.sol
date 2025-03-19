// SPDX-License-Identifier: MIT
pragma solidity >=0.8.4;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract Token is ERC20 {
    constructor () ERC20("Blocktrain", "TRAIN") {
        _mint(msg.sender, 10000 * (10 ** uint256(decimals())));
    }
}
