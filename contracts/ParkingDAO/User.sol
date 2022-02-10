// SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;

import "@openzeppelin/contracts/ownership/Ownable.sol";

import "./ParkingAnchor.sol";

interface IUser is Ownable {
    // Set the pending anchor to indicate interest in using a ParkingAnchor
    function setPendingAnchor(ParkingAnchor anchor) internal onlyOwner;

    // Pay a valid parking anchor for parking, assuming the user has access to their zone.
    function payForParking(ParkingAnchor anchor) public payable onlyOwner;

    // the pendingAnchor will call this function to complete the CheckIn and to set the
    // pendingAnchor to null.
    function setLastCheckIn() public isPendingAnchor;

    // The parking authority calls this function to add the set of licensedZones.
    function addZone(bytes4 zone) internal onlyOwner;

    // the owner of the User contract can propose to the ParkingAuthority to add
    // a zone to their set of licensedZones.
    function requestZone(bytes4 zone) public onlyOwner;
}
