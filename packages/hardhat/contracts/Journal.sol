//SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

// Type declarations
enum SubmissionStage {
	Initial,
	// Inviting,
	Reviewing,
	Reviewed,
	Revised,
	Rejected,
	Accepted
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
	Submission[] submissions;
	mapping(address => uint256[]) author2Submissions;
	mapping(address => uint256[]) editor2Submissions;
	mapping(address => uint256[]) reviewer2Submissions;

	// Events
	// ...

	// Errors
	error InvalidOperationAtThisSubmissionStage();

	// Modifiers
	modifier validSubmissionId(uint256 submissionId) {
		require(
			submissionId > 0 && submissionId <= submissions.length,
			"Invalid submission id"
		);
		_;
	}

	modifier onlyEditor(uint256 submissionId) {
		require(
			submissionId > 0 && submissionId <= submissions.length,
			"Invalid submission id"
		);

		Submission storage s = submissions[submissionId - 1];
		require(msg.sender == s.editor, "Only editors can do this");
		_;
	}

	modifier onlyReviewer(uint256 submissionId) {
		require(
			submissionId > 0 && submissionId <= submissions.length,
			"Invalid submission id"
		);

		Submission storage s = submissions[submissionId - 1];
		bool isReviewer = false;
		for (uint i = 0; i < s.reviewers.length; i++) {
			if (msg.sender == s.reviewers[i]) {
				isReviewer = true;
				break;
			}
		}
		require(isReviewer, "Only reviewers can do this");
		_;
	}

	modifier onlyActor(uint256 submissionId) {
		require(
			submissionId > 0 && submissionId <= submissions.length,
			"Invalid submission id"
		);

		Submission storage s = submissions[submissionId - 1];
		bool isEditor = msg.sender == s.editor;
		bool isAuthor = msg.sender == s.author;
		bool isReviewer = false;
		for (uint i = 0; i < s.reviewers.length; i++) {
			if (msg.sender == s.reviewers[i]) {
				isReviewer = true;
				break;
			}
		}
		require(isAuthor || isEditor || isReviewer, "Invalid actors");
		_;
	}

	modifier nextStage(uint256 submissionId, SubmissionStage next) {
		_;
		Submission storage s = submissions[submissionId - 1];
		s.stage = next;
	}

	modifier atStage(uint256 submissionId, SubmissionStage stage) {
		Submission storage s = submissions[submissionId - 1];
		if (s.stage != stage) revert InvalidOperationAtThisSubmissionStage();
		_;
	}

	constructor() {
		editor = msg.sender;
	}

	// External functions
	function submitPaper(
		uint256 paperId,
		string calldata title,
		string calldata description
	) external {
		Submission storage s = submissions.push();
		s.stage = SubmissionStage.Initial;
		s.id = submissions.length;
		s.title = title;
		s.description = description;
		s.author = msg.sender;
		s.editor = editor;
		s.revisions.push(paperId);

		author2Submissions[s.author].push(s.id);
		editor2Submissions[s.editor].push(s.id);
	}

	function proposeReviewers(
		uint256 submissionId,
		address[] calldata reviewers
	)
		external
		onlyEditor(submissionId)
		atStage(submissionId, SubmissionStage.Initial)
		nextStage(submissionId, SubmissionStage.Reviewing)
	{
		Submission storage s = submissions[submissionId - 1];
		require(s.reviewers.length == 0, "Already assigned reviewers");
		s.reviewers = reviewers;
	}

	function submitReview(
		uint256 submissionId,
		ReviewDecision decision
	)
		external
		onlyReviewer(submissionId)
		atStage(submissionId, SubmissionStage.Reviewing)
		nextStage(submissionId, SubmissionStage.Reviewed)
	{
		Submission storage s = submissions[submissionId - 1];
		require(!s.madeDecisions[msg.sender], "Already submitted reviews.");
		s.madeDecisions[msg.sender] = true;
		s.decisions.push(decision);
	}

	function accept(
		uint256 submissionId
	)
		external
		onlyEditor(submissionId)
		atStage(submissionId, SubmissionStage.Reviewed)
		nextStage(submissionId, SubmissionStage.Accepted)
	{}

	function revise(
		uint256 submissionId
	)
		external
		onlyEditor(submissionId)
		atStage(submissionId, SubmissionStage.Reviewed)
		nextStage(submissionId, SubmissionStage.Revised)
	{}

	function rejectAfterSubmitted(
		uint256 submissionId
	)
		external
		onlyEditor(submissionId)
		atStage(submissionId, SubmissionStage.Initial)
		nextStage(submissionId, SubmissionStage.Rejected)
	{}

	function rejectAfterReviewed(
		uint256 submissionId
	)
		external
		onlyEditor(submissionId)
		atStage(submissionId, SubmissionStage.Reviewed)
		nextStage(submissionId, SubmissionStage.Rejected)
	{}

	function comment(
		uint256 submissionId,
		string memory content
	) external onlyActor(submissionId) {
		Submission storage s = submissions[submissionId - 1];
		Comment storage c = s.comments.push();
		c.content = content;
		c.createdAt = block.timestamp;
		c.createdBy = msg.sender;
	}

	// External functions that are view
	function getPaper(
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
				editor: s.editor,
				revisions: s.revisions,
				comments: s.comments,
				decisions: s.decisions
			});
	}

	// External functions that are pure
	// ...

	// Public functions
	// ...

	// Internal functions
	// ...

	// Private functions
}
