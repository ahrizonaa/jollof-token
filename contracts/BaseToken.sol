// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract BaseToken is ERC20 {
    uint256 private TOTAL_SUPPLY = 10000000000 * 10 ** 18;
    constructor(string memory name, string memory symbol) ERC20(name, symbol) {
        _mint(msg.sender, TOTAL_SUPPLY);
    }
}
