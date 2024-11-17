//SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "./JProfile.sol";

/// @title Base contract for Journal. Holds base variables and methods.
/// @author Tinh Tran
contract JSubmission is JProfile {
	// Errors
	error BadStage();
	error Forbidden();

	/// @dev An array containing all Submissions in existence. The ID
	/// of each submission is actually an index into this array.
	/// Note that ID 0 is invalid.
	Submission[] submissions;

	/// @dev A mapping from author addresses to their submission ids.
	mapping(address => uint256[]) author2Submissions;

	/// @dev Change the current stage to the new one after an operation.
	modifier nextStage(uint256 submissionId, SubmissionStage next) {
		_;
		Submission storage s = submissions[submissionId - 1];
		s.stage = next;
	}

	/// @dev Make sure the submission is in the correct stage before an operation.
	modifier atStage(uint256 submissionId, SubmissionStage stage) {
		Submission storage s = submissions[submissionId - 1];
		if (s.stage != stage) revert BadStage();
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

	/// @dev Retrieve a submission detail based on its id.
	function getSubmissionById(
		uint256 submissionId
	)
		public
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

	/// @dev Retrieve submissions by author.
	function getSubmissionByAuthor(
		address author
	) public view returns (uint256[] memory) {
		return author2Submissions[author];
	}
}
