// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract TokenHolder {
    using SafeERC20 for IERC20;
    
    address public token;
    
    constructor(address _token) {
        require(_token != address(0), "Invalid token address");
        token = _token;
    }

    function deposit(uint256 amount) external {
        require(amount > 0, "Amount must be greater than 0");
        IERC20(token).safeTransferFrom(msg.sender, address(this), amount);
    }
}