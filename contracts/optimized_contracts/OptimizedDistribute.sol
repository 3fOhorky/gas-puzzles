// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.15;

contract OptimizedDistribute {
    address immutable private contributor0;
    address immutable private contributor1;
    address immutable private contributor2;
    address immutable private contributor3;
    uint256 immutable private createTime;
    uint immutable private amountToDistribute; 

    constructor(address[4] memory _contributors) payable {
        amountToDistribute = msg.value / 4;
        contributor0 = _contributors[0];
        contributor1 = _contributors[1];
        contributor2 = _contributors[2];
        contributor3 = _contributors[3];
        createTime = block.timestamp;
    }

    function distribute() external {
        require(
            block.timestamp > createTime + 1 weeks,
            "cannot distribute yet"
        );

        payable(contributor0).send(amountToDistribute);
        payable(contributor1).send(amountToDistribute);
        payable(contributor2).send(amountToDistribute);
        payable(contributor3).send(amountToDistribute);
    }
}
