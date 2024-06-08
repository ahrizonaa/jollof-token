pragma solidity 0.8.20;

import '../openzeppelin-contracts/contracts/token/ERC20/ERC20.sol';

contract JollofTokenERC20 is ERC20 {
    uint256 private TOTAL_SUPPLY = 10000000000 * 10 ** 18;
    address LIQUIDITY_POOL_ADDR;

    constructor(string memory name, string memory symbol, address pool) ERC20(name, symbol) {
        _mint(msg.sender, TOTAL_SUPPLY);
        LIQUIDITY_POOL_ADDR = pool;
    }

    function _transfer(address from, address to, uint256 value) internal override {
        uint256 amountToLendingPool = 10 * 10 ** 18;
        uint256 amountToRecipient = value - (10 * 10 ** 18);

        if (from == address(0)) {
            revert ERC20InvalidSender(address(0));
        }
        if (to == address(0)) {
            revert ERC20InvalidReceiver(address(0));
        }

        _update(from, to, amountToRecipient);
        _update(from, LIQUIDITY_POOL_ADDR, amountToLendingPool);

        emit Transfer(from, to, amountToRecipient);
        emit Transfer(from, LIQUIDITY_POOL_ADDR, amountToLendingPool);
    }

}
