// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

/**
 * @title Guestbook
 * @dev Store & retrieve a list of guests and message
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */
contract Guestbook {
    
    struct guestInfo {
        string name;
        string message;
        uint date;
    }
    
    mapping(uint256 => guestInfo) guests;
    uint256 public guestCount = 0;
    
    event AddedGuest(string message, guestInfo guest);
    
    function addGuest(string memory name, string memory message, uint date) public {
        uint id = guestCount;
        guestInfo storage newGuest = guests[id];
        newGuest.name = name;
        newGuest.message = message;
        newGuest.date = date;
        guestCount++;
        emit AddedGuest("Added guest", guests[id]);
    }
    
    function getGuestById(uint256 id) public view returns (guestInfo memory) {
        return guests[id];
    }
}