//SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "./JAuthor.sol";

/**
 * A smart contract that simulates the peer review process of a scientific journal.
 * @author TinhTT
 */
contract Journal is JAuthor {
	// /// @dev Make a comment on a submission.
	// function comment(
	// 	uint256 submissionId,
	// 	string memory content
	// ) external validUser validSubmissionId(submissionId) {
	// 	Submission storage s = submissions[submissionId - 1];
	// 	Comment storage c = s.comments.push();
	// 	c.content = content;
	// 	c.createdAt = block.timestamp;
	// 	c.createdBy = users[msg.sender];
	// }

	/// @dev Prevent the contract from accidentally receiving ETH.
	receive() external payable {
		revert("Contract does not accept ETH");
	}

	/// @dev Prevent errors when calling wrong function names.
	fallback() external {}
}
