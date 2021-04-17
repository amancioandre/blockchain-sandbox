// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.11 <0.7.0;

contract ExceptionExample {
    mapping(address => uint256) public balanceReceived;

    function receiveMoney() public payable {
        assert(
            balanceReceived[msg.sender] + uint256(msg.value) >=
                balanceReceived[msg.sender]
        );
        balanceReceived[msg.sender] += msg.value;
    }

    function withdrawMoney(address payable _to, uint256 _amount) public {
        require(balanceReceived[msg.sender] >= _amount, "Insufficcient funds.");
        assert(
            balanceReceived[msg.sender] >= balanceReceived[msg.sender] - _amount
        );
        balanceReceived[msg.sender] -= _amount;
        _to.transfer(_amount);
    }
}
