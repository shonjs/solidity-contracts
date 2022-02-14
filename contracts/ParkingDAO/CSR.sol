pragma solidity ^0.8.11;

import "./CSC.sol";

/*
    CSR registry is like a lookup table that maps 
    Crypto Spacial Coordinates (CSC) to its contract address
*/

contract CSR {
    function register(CSC csc) public;

    function regisrty(bytes12 csc) public returns (address);
}
