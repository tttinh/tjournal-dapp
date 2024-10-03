//SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "./journal/Author.sol";
import "./journal/Editor.sol";
import "./journal/Reviewer.sol";

/**
 * A smart contract that simulates the peer review process of a scientific journal.
 * @author TinhTT
 */
contract Journal is JAuthor, JEditor, JReviewer {
	/// @dev Make a comment on a submission.
	function comment(
		uint256 submissionId,
		string memory content
	) external validUser validSubmissionId(submissionId) {
		Submission storage s = submissions[submissionId - 1];
		Comment storage c = s.comments.push();
		c.content = content;
		c.createdAt = block.timestamp;
		c.createdBy = users[msg.sender];
	}
}
