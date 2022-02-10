// SPDX-License-Identifier: MIT
pragma solidity ^0.8.11
/*
  The ParkingAuthority is the governing contract for ParkingDAO. It holds two important 
  pieces of data--the ParkingCSR, which is the crypto-spatial registry contract for all
  ParkingAnchors, and the user membership list, which keeps track of all of the registered
  users of the DAO. It has the sole authority to extend these two registries.
*/

contract IParkingAuthority is Ownable {

    function validateParkingAnchor(bytes8 geoHash, bytes32 anchorId) internal pure returns(bool);
    // Deploy a ParkingAnchor at the given geohash with the given anchorId. Transfer ownership of the
    // anchor to the sender of the transaction.
    function registerParkingAnchor(bytes8 geoHash, bytes32 anchorId) public;
    function validateUserApplication(address applicant) internal pure returns(bool);
    // Create a new user and transer ownership of the account to the message sender.
    function registerUser() public;
    // This function is called by a user when they want to add a zone to their listed of
    // licensed zones.
    function addZone(bytes4 zone) public shouldGiveAccess(zone) isUser;
}