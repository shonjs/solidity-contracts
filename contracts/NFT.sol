// SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract NFT is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor(string memory nftName, string memory nftSymbol)
        ERC721(nftName, nftSymbol)
    {}

    // Create a new NFT with the tokenURI details
    function create(address user, string memory tokenURI)
        public
        returns (uint256)
    {
        _tokenIds.increment();

        uint256 _newTokenId = _tokenIds.current();
        _mint(user, _newTokenId);
        _setTokenURI(_newTokenId, tokenURI);

        return _newTokenId;
    }
}
