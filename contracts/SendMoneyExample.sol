// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.1;

contract SendMoneyExample {
    uint256 public balanceReceived;
    uint256 public lockedUntil;

    function receiveMoney() public payable {
        balanceReceived += msg.value;
        lockedUntil = block.timestamp + 1 minutes;
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function withdrawMoney() public locked {
        address payable to = payable(msg.sender);
        to.transfer(getBalance());
    }

    function withdrawMoneyTo(address payable _to) public locked {
        _to.transfer(getBalance());
    }

    modifier locked {
        require(
            block.timestamp >= lockedUntil,
            "You should await at least one minute before withdraw."
        );
        _;
    }
}
