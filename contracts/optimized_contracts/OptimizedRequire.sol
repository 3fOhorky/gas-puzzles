// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.15;

error CannotPurchase(); 

contract OptimizedRequire {
    uint256 lastPurchaseTime;

    function purchaseToken() external payable {
        if (msg.value != 0.1 ether ||
            block.timestamp < lastPurchaseTime + 1 minutes) {
            revert CannotPurchase();
        }
        lastPurchaseTime = block.timestamp;
        // mint the user a token
    }
}
