//SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

// Type declarations
enum SubmissionStage {
	Initial,
	Inviting,
	Reviewing,
	Reviewed,
	Rejected,
	Accepted,
	Revised
}

enum ReviewDecision {
	RejectPaper,
	AcceptPaper,
	RevisePaper
}

struct Comment {
	uint256 createdAt;
	address createdBy;
	string content;
}

struct Submission {
	SubmissionStage stage;
	uint256 id;
	string title;
	string description;
	address author;
	address editor;
	address[] reviewers;
	uint256[] revisions;
	Comment[] comments;
	ReviewDecision[] decisions;
	mapping(address => bool) madeDecisions;
}

struct SubmissionResponse {
	SubmissionStage stage;
	uint256 id;
	string title;
	string description;
	address author;
	address editor;
	uint256[] revisions;
	Comment[] comments;
	ReviewDecision[] decisions;
}

/**
 * A smart contract that simulates the peer review process of a scientific journal.
 * @author TinhTT
 */
contract Journal {
	// State variables
	address public editor;
	Submission[] public submissions;
	mapping(address => uint256[]) author2Submissions;
	mapping(address => uint256[]) editor2Submissions;
	mapping(address => uint256[]) reviewer2Submissions;

	// Events
	// ...

	// Errors
	// ...

	constructor() {
		editor = msg.sender;
	}

	// External functions
	// ...

	// External functions that are view
	// ...

	// External functions that are pure
	// ...

	// Public functions
	// ...
	function submitPaper(
		uint256 mid,
		string calldata title,
		string calldata description
	) public {
		Submission storage s = submissions.push();
		s.stage = SubmissionStage.Initial;
		s.id = submissions.length;
		s.title = title;
		s.description = description;
		s.author = msg.sender;
		s.editor = editor;
		s.revisions.push(mid);

		author2Submissions[s.author].push(s.id);
		editor2Submissions[s.editor].push(s.id);
	}

	function getPaper(
		uint256 id
	) public view returns (SubmissionResponse memory) {
		Submission storage s = submissions[id - 1];
		return
			SubmissionResponse({
				stage: s.stage,
				id: s.id,
				title: s.title,
				description: s.description,
				author: s.author,
				editor: s.editor,
				revisions: s.revisions,
				comments: s.comments,
				decisions: s.decisions
			});
	}

	function comment(uint256 id, string memory content) public {
		Submission storage s = submissions[id - 1];
		Comment storage c = s.comments.push();
		c.content = content;
		c.createdAt = block.timestamp;
		c.createdBy = msg.sender;
	}

	// Internal functions
	// ...

	// Private functions
	// ...
}
