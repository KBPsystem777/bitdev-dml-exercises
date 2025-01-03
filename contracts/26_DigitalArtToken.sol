// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Import ERC721 from OpenZeppelin
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

// 🚩 TODO: Define the ERC721 contract
contract DigitalArtToken is ERC721URIStorage, Ownable {
    uint256 private _tokenIds;

    // 🚩 TODO: Initialize the contract with a name and symbol
    constructor()
        ERC721("DigitalArtToken", "DAT")
        Ownable(msg.sender)
        ERC721URIStorage()
    {}

    // 🚩 TODO: Function to mint a new token
    function mintArt(
        address recipient,
        string memory tokenURI
    ) public onlyOwner returns (uint256) {
        _tokenIds++;
        uint256 newItemId = _tokenIds;

        _mint(recipient, newItemId);
        _setTokenURI(newItemId, tokenURI);

        return newItemId;
    }
}