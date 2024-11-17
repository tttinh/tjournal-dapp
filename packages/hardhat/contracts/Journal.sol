//SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import { Ownable } from "@openzeppelin/contracts/access/Ownable.sol";
import "./JEditor.sol";

/**
 * A smart contract that simulates the peer review process of a scientific journal.
 * @author TinhTT
 */
contract Journal is Ownable, JEditor {
	/// @dev Set the editor-in-chief.
	function setEIC(address eic) external onlyOwner {
		chiefEditor = eic;
	}

	/// @dev Prevent the contract from accidentally receiving ETH.
	receive() external payable {
		revert("Contract does not accept ETH");
	}

	/// @dev Prevent errors when calling wrong function names.
	fallback() external {}
}
