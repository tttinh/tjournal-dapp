//SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "./JSubmission.sol";

/// @title A facet of Journal that manages APIs for authors.
/// @author Tinh Tran
contract JAuthor is JSubmission {
	modifier onlyAuthor(uint256 submissionId) {
		require(
			submissionId > 0 && submissionId <= submissions.length,
			"Invalid submission id"
		);

		Submission storage s = submissions[submissionId - 1];
		require(msg.sender == s.author, "Only the author can do this");
		_;
	}

	/// @dev An author submits a new document.
	function addSubmission(
		string calldata uri,
		string calldata title,
		string calldata description
	) public validUser {
		uint256 docId = _mintDocument(msg.sender, uri);

		Submission storage s = submissions.push();
		s.stage = SubmissionStage.SUBMITTED;
		s.id = submissions.length;
		s.title = title;
		s.description = description;
		s.author = msg.sender;
		s.revisions.push(docId);

		author2Submissions[s.author].push(s.id);
	}

	/// @dev An author submits a new revision.
	function addRevision(
		uint256 submissionId,
		string calldata uri
	) public onlyAuthor(submissionId) {
		Submission storage s = submissions[submissionId - 1];
		uint256 docId = _mintDocument(msg.sender, uri);
		s.revisions.push(docId);
	}
}
