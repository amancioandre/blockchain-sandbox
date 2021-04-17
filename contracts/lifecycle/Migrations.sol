// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

import "zeppelin-solidity/contracts/ownership/Ownable.sol";

/**
 * @title Migrations
 * @dev This is a truggle contract, needed for truffle integration.
 */
contract Migrations is Ownable {
    uint256 public lastCompletedMigration;

    function setCompleted(uint256 completed) public onlyOwner {
        lastCompletedMigration = completed;
    }

    function upgrade(address newAddress) public onlyOwner {
        Migrations upgraded = Migrations(newAddress);
        upgraded.setCompleted(lastCompletedMigration);
    }
}
