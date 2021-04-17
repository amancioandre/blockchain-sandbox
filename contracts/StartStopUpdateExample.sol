// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.1;

contract StartStopUpdateExample {
    address owner;
    bool paused;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == owner, "You are not the owner.");
        _;
    }

    modifier isNotPaused {
        require(!paused, "Contract is currently paused.");
        _;
    }

    function pause() public onlyOwner {
        paused = !paused;
    }

    function sendMoney() public payable isNotPaused {}

    function withdrawAllMoney(address payable _to)
        public
        onlyOwner
        isNotPaused
    {
        _to.transfer(address(this).balance);
    }
}
