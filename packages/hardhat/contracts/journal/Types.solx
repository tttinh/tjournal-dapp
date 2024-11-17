// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

/// @dev Different stages of a submission.
enum SubmissionStage {
	SUBMITTED,
	ASSIGNED,
	FILTERED,
	REVIEWING,
	REVIEWED,
	REVISING,
	ACCEPTED,
	REJECTED
}

/// @dev Recommendation represents choices available for reviewers.
enum Recommendation {
	REJECTION,
	ACCEPTANCE,
	REVISION
}

/// @dev Different roles in our journal.
enum Role {
	EIC,
	AREA_EDITOR,
	ASSOCIATE_EDITOR,
	REVIEWER,
	AUTHOR
}

/// @dev A struct that holds user's information.
struct Profile {
	address id;
	string name;
	Role role;
}

/// @dev Comment represents a comment for a submission.
struct Comment {
	string content;
	uint256 createdAt;
	Profile createdBy;
}

/// @dev Submission is the core entity of the system. It represents a
/// paper submitted by an author that will go through the peer review process.
struct Submission {
	SubmissionStage stage;
	uint256 id;
	string title;
	string description;
	address author;
	address areaEditor;
	address associateEditor;
	address[] reviewers;
	uint256[] revisions;
	Comment[] comments;
	Recommendation[] reviews;
	mapping(address => bool) submittedReviews;
}

/// @dev SubmissionResponse is a data object used as API response.
struct SubmissionResponse {
	SubmissionStage stage;
	uint256 id;
	string title;
	string description;
	address author;
	uint256[] revisions;
	Comment[] comments;
}
