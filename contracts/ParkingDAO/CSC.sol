// SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;

import "./SpatialUtils.sol";

/*
  CSC is an abstract class for anything that inherits a spatial coordinate, i.e.
  a geohash. It has the ability to register its location in any Crypto Spatial
  Registery (CSR).
*/

contract CSC is SpatialUtils {
    bytes8 public _geohash;
    bytes12 public _csc;

    function CSC(bytes8 geohash) public {
        _geohash = geohash;
        _csc = SpatialUtil.computeCSC(_geohash, address(this));
    }
}
