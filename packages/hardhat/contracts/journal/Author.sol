//SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "./Base.sol";

/// @title A facet of Journal that manages APIs for authors.
/// @author Tinh Tran
contract JAuthor is JBase {
	/// @dev A mapping from author addresses to their submissions.
	mapping(address => uint256[]) author2Submissions;

	/// @dev An author submits a new paper.
	function submitPaper(
		uint256 paperId,
		string calldata title,
		string calldata description
	) external {
		Submission storage s = submissions.push();
		s.stage = SubmissionStage.SUBMITTED;
		s.id = submissions.length;
		s.title = title;
		s.description = description;
		s.author = msg.sender;
		s.revisions.push(paperId);

		author2Submissions[s.author].push(s.id);
	}
}
