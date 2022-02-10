// SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;

import "@openzeppelin/contracts/ownership/Ownable.sol";

contract IParkingAnchor is Ownable {
    // Accept payment from a user
    function acceptPayment() public payable isUser returns (bool);

    // transfer all ether accumulated in parking fees to the owner of this contract.
    function transferBalanceToOwner() public onlyOwner;
}
