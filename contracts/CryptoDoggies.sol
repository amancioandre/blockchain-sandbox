// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract CryptoDoggies {
    struct Doggy {
        uint256 age;
        string name;
        bytes5 dna;
    }

    Doggy[] doggies;
    mapping(uint256 => address) private doggyIdToOwner;
    mapping(address => uint256) private numOfDoggies;

    event DoggieCreated(uint256 _id, string _name, uint256 _age, bytes5 _dna);

    function _createDoggy(
        uint256 _age,
        string memory _name,
        bytes5 _dna
    ) public {
        Doggy memory _doggy = Doggy({age: _age, name: _name, dna: _dna});

        doggies.push(_doggy);
        uint256 newDoggyId = doggies.length - 1;
        doggyIdToOwner[newDoggyId] = msg.sender;
        numOfDoggies[msg.sender] = numOfDoggies[msg.sender] + 1;

        emit DoggieCreated(newDoggyId, _name, _age, _dna);
    }
}
