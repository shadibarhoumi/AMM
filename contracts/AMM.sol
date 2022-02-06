// SPDX-License-Identifier: MIT
pragma solidity 0.8.11;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/interfaces/IERC20.sol";

contract AMM is ERC20 {
    IERC20 public immutable token1;
    IERC20 public immutable token2;

    constructor(IERC20 _token1, IERC20 _token2) ERC20("SimpleSwap", "SS") {
       token1 = _token1; 
       token2 = _token2; 
    }

    function addLiquidity(uint256 token1Amount, uint256 token2Amount) external {
        _mint(msg.sender, token1Amount * totalSupply() / token1.balanceOf(address(this)));
        token1.transferFrom(msg.sender, address(this), token1Amount);
        token2.transferFrom(msg.sender, address(this), token2Amount);
    }
}