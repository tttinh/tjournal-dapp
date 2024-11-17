//SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import { ERC721URIStorage, ERC721 } from "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

/**
 * A smart contract that allows users to mint their documents.
 * @author TinhTT
 */
contract JDocument is ERC721URIStorage {
	uint256 private _nextTokenId;

	constructor() ERC721("JournalDocument", "JDOC") {}

	function _mintDocument(
		address author,
		string memory docURI
	) internal returns (uint256) {
		uint256 tokenId = _nextTokenId++;
		_mint(author, tokenId);
		_setTokenURI(tokenId, docURI);

		return tokenId;
	}
}
