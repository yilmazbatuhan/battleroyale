//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
import "./x.sol";

contract x_pvp is X {
    //saldıran yüzde 70 ihtimalle kazanır
    // will be updated
    uint256 randNonce = 0;
    uint256 attackVictoryProbability = 70;

    //resets the cooldown time
    function _triggerCooldown(character storage _char) internal {
        _char.cooldown = uint32(block.timestamp + _char.cooldown);
    }

    //random number generator
    //will  be updated to vrf
    function randMod(uint256 _modulus) internal returns (uint256) {
        randNonce++;
        return
            uint256(
                keccak256(
                    abi.encodePacked(block.timestamp, msg.sender, randNonce)
                )
            ) % _modulus;
    }

    //bir char ile sadece owner işlem yapabilir
    modifier onlyOwnerr(uint256 _attacker) {
        owners[_attacker] = msg.sender;
        _;
    }

    //attack metod
    //will be updated
    function attack(uint256 _attacker, uint256 _defender)
        external
        onlyOwnerr(_attacker)
    {
        character storage attacker = characters[_attacker];
        character storage defender = characters[_defender];
        uint256 rand = randMod(100);
        if (rand <= attackVictoryProbability) {
            attacker.winCount++;
            defender.lossCount++;
        } else {
            attacker.lossCount++;
            defender.winCount++;
        }
    }
}
