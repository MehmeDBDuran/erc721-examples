// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
// @dev This contract is used to mint NFTs. It is based on the ERC721 standard.
// @dev The contract is Ownable, meaning that ONLY THE OWNER can mint (create) tokens.

// @dev Don't fotget to run `npm i --save` first.
pragma solidity ^0.8.22;

// Import libraries from OpenZeppelin Contracts v5.0.0
import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {Strings} from "@openzeppelin/contracts/utils/Strings.sol";

contract PassToken is ERC721, Ownable {
    uint256 private _nextTokenId;
    uint256 private _price = 0.06 ether; // This sets the initial price of the tokens to 0.06 ether
    string public baseTokenURI;
    string public contractMetadataURI;
    /*
    @dev The constructor is a function that runs only once, when the contract is deployed.
    It sets the initial owner of the contract.
    You need to pass the address of the initial owner while deploying the contract.
    */
    constructor(
        address initialOwner, // @dev This is the address of the initial owner
        string memory _initialBaseURI, // @dev This is the base URI for the token metadata
        string memory _contractURI // @dev This is the contract metadata URI
    )
        //@dev `PassToken` is the name of the token, and `PTK` is the symbol
        ERC721("PassToken", "PTK")
        Ownable(initialOwner)
    {
        baseTokenURI = _initialBaseURI;
        contractMetadataURI = _contractURI;
    }

    /*
        @dev _baseURI: Change this to your base URI. Base URI is the prefix for the token URI.
        For example, if your base URI is "https://YourBASEURIaddress.com", the token URI for token ID 5 will be:
        "https://YourBASEURIaddress.com/5"
        The ID 5 is appended to the base URI to form the token URI automatically.
    */

    /*
    @dev This function is used to mint a new token. It is only accessible by the owner.
    Owner is the account that deployed the contract.
    @param to The address of the account that will receive the token.
    */
    function safeMint(address to) public onlyOwner {
        uint256 tokenId = _nextTokenId++;
        _safeMint(to, tokenId);
    }

    /*
    @dev This function is used to batch mint tokens. It is only accessible by the owner.
    Owner is the account that deployed the contract.
    @param to The address of the account that will receive the tokens.
    @param amount The number of tokens to mint.
    */
    function batchMint(address to, uint256 amount) public onlyOwner {
        for (uint256 i = 0; i < amount; i++) {
            safeMint(to);
        }
    }

    /*** METADATA MANAGEMENT ***/
    /*
    @dev This function is used by OpenSea to get the base URI for the token metadata.
    */
    function _baseURI() internal view override returns (string memory) {
        return baseTokenURI;
    }

    /*
    @dev This function is used to set the base URI for the token metadata.
    @param baseURI The base URI for the token metadata. 
    */
    function setBaseURI(string memory baseURI) public onlyOwner {
        baseTokenURI = baseURI;
    }

    /*
    @dev This function is used to get the token URI.
    @param tokenId The ID of the token.
    */
    function tokenURI(
        uint256 tokenId
    ) public view override returns (string memory) {
        require(_ownerOf(tokenId) != address(0), "Token does not exist");
        return
            string(
                abi.encodePacked(
                    baseTokenURI,
                    Strings.toString(tokenId),
                    ".json"
                )
            );
    }

    /*** OPENSEA COMPATIBILITY (CONTRACT METADATA) ***/
    /*
    @dev This function is used by OpenSea to get the contract metadata URI.
    */
    function contractURI() public view returns (string memory) {
        return baseTokenURI;
    }

    /*
    @dev This function is used to set the contract metadata URI.
    @param _contractURI The contract metadata URI.
    */
    function setContractURI(string memory _contractURI) external onlyOwner {
        contractMetadataURI = _contractURI;
    }

    // The following functions are overrides required by Solidity.

    function _update(
        address to,
        uint256 tokenId,
        address auth
    ) internal override(ERC721) returns (address) {
        return super._update(to, tokenId, auth);
    }
}
