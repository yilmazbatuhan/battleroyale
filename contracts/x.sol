//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
pragma experimental ABIEncoderV2; // structları return edebilmek için ekledim
import "../node_modules/@openzeppelin/contracts/access/Ownable.sol";
import "../node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
 

contract X is Ownable{
    
    event newCharacter(uint charId,string name,uint16 attack,uint16 defence);
    struct character{
        string name;
        uint16 attack;
        uint16 defence;
        uint8 winCount;
        uint8 lossCount;
        uint256 cooldown;   
    }

    character[] public characters;

    mapping(uint=>address) owners;
    mapping(address=>uint16) characterCount;
// yeni karakter yaratma
     

    function createCharacter(string memory _name)public{
        characters.push(character(_name,1,1,0,0,1));
        uint id = characters.length -1 ;
        owners[id]=msg.sender;
        characterCount[msg.sender]++;
        emit newCharacter(id, _name, 1, 1);
    }
    function viewChar(uint _index)public view returns(character memory){
        
        return characters[_index];
    }

}


