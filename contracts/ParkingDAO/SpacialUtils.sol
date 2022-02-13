pragma solidity ^0.8.11;

/* 
    Common functions needed for FOAM contracts 
*/

contract SpacialUtils {
    function computeCSC(bytes8 geoHash, address addr)
        public
        pure
        returns (bytes12)
    {
        return bytes12(keccak256(abi.encodePacked(geoHash, addr)));
    }
}
