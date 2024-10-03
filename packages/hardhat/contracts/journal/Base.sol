//SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "./Types.sol";

/// @title Base contract for Journal. Holds base variables and methods.
/// @author Tinh Tran
contract JBase {
	// Errors
	error InvalidOperationAtThisSubmissionStage();

	/// @dev An array containing all Submissions in existence. The ID
	/// of each submission is actually an index into this array.
	/// Note that ID 0 is invalid.
	Submission[] submissions;

	constructor() {}

	/// @dev Change the current stage to the new one after an operation.
	modifier nextStage(uint256 submissionId, SubmissionStage next) {
		_;
		Submission storage s = submissions[submissionId - 1];
		s.stage = next;
	}

	/// @dev Make sure the submission is in the correct stage before an operation.
	modifier atStage(uint256 submissionId, SubmissionStage stage) {
		Submission storage s = submissions[submissionId - 1];
		if (s.stage != stage) revert InvalidOperationAtThisSubmissionStage();
		_;
	}

	/// @dev Make sure the submission id is valid.
	modifier validSubmissionId(uint256 submissionId) {
		require(
			submissionId > 0 && submissionId <= submissions.length,
			"Invalid submission id"
		);
		_;
	}

	/// @dev Make a comment on a submission.
	function comment(uint256 submissionId, string memory content) external {
		Submission storage s = submissions[submissionId - 1];
		Comment storage c = s.comments.push();
		c.content = content;
		c.createdAt = block.timestamp;
		c.createdBy = msg.sender;
	}

	/// @dev Retrieve a submission detail based on its id.
	function getSubmission(
		uint256 submissionId
	)
		external
		view
		validSubmissionId(submissionId)
		returns (SubmissionResponse memory)
	{
		Submission storage s = submissions[submissionId - 1];
		return
			SubmissionResponse({
				stage: s.stage,
				id: s.id,
				title: s.title,
				description: s.description,
				author: s.author,
				revisions: s.revisions,
				comments: s.comments
			});
	}
}