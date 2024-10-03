//SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "./Base.sol";

/// @title A facet of Journal that manages APIs for editors.
/// @author Tinh Tran
contract JEditor is JBase {
	/// @dev The address of the editor-in-chief (EIC)
	address chiefEditor;

	/// @dev An array of area editors addresses.
	address[] areaEditors;

	/// @dev An array of associate editors addresses.
	address[] associateEditors;

	constructor() {
		chiefEditor = msg.sender;
	}

	/// @dev Access modifier for EIC-only functionality
	modifier onlyEIC() {
		require(msg.sender == chiefEditor, "Only the EIC can do this");
		_;
	}

	/// @dev Access modifier for area-editor-only functionality
	modifier onlyAreaEditor(uint256 submissionId) {
		require(
			submissionId > 0 && submissionId <= submissions.length,
			"Invalid submission id"
		);

		Submission storage s = submissions[submissionId - 1];
		require(msg.sender == s.areaEditor, "Only the area editor can do this");
		_;
	}

	/// @dev Access modifier for associate-editor-only functionality
	modifier onlyAssociateEditor(uint256 submissionId) {
		require(
			submissionId > 0 && submissionId <= submissions.length,
			"Invalid submission id"
		);

		Submission storage s = submissions[submissionId - 1];
		require(
			msg.sender == s.associateEditor,
			"Only the associate editor can do this"
		);
		_;
	}

	/// @dev The EIC approves for the newly created submission to move to the next stage.
	/// An area editor is assigned to handle the first assessment.
	function approveSubmission(
		uint256 submissionId
	)
		external
		onlyEIC
		atStage(submissionId, SubmissionStage.SUBMITTED)
		nextStage(submissionId, SubmissionStage.ASSIGNED)
	{
		Submission storage s = submissions[submissionId - 1];
		s.areaEditor = areaEditors[0];
	}

	/// @dev The EIC rejects the newly created submission.
	function rejectSubmission(
		uint256 submissionId
	)
		external
		onlyEIC
		atStage(submissionId, SubmissionStage.SUBMITTED)
		nextStage(submissionId, SubmissionStage.REJECTED)
	{}

	/// @dev The area editor decides that the paper is qualified for the next stage.
	/// An associate editor is assigned to handle the next phase.
	function qualifySubmission(
		uint256 submissionId
	)
		external
		onlyAreaEditor(submissionId)
		atStage(submissionId, SubmissionStage.ASSIGNED)
		nextStage(submissionId, SubmissionStage.FILTERED)
	{
		Submission storage s = submissions[submissionId - 1];
		s.associateEditor = associateEditors[0];
	}

	/// @dev The area editor decides that the paper is not qualified for the next stage.
	function rejectWhenFiltering(
		uint256 submissionId
	)
		external
		onlyAreaEditor(submissionId)
		atStage(submissionId, SubmissionStage.ASSIGNED)
		nextStage(submissionId, SubmissionStage.REJECTED)
	{}

	/// @dev The area editor decides that the paper is qualified for the next stage.
	/// An associate editor is assigned to handle the next phase.
	function proposeReviewers(
		uint256 submissionId,
		address[] calldata reviewers
	)
		external
		onlyAssociateEditor(submissionId)
		atStage(submissionId, SubmissionStage.FILTERED)
	{
		Submission storage s = submissions[submissionId - 1];
		require(s.reviewers.length == 0, "Already assigned reviewers");
		s.reviewers = reviewers;
	}

	/// @dev The associate editor accepts the submission based on reviewer's recommendations.
	function accept(
		uint256 submissionId
	)
		external
		onlyAssociateEditor(submissionId)
		atStage(submissionId, SubmissionStage.REVIEWED)
		nextStage(submissionId, SubmissionStage.ACCEPTED)
	{}

	/// @dev The associate editor rejects the submission based on reviewer's recommendations.
	function reject(
		uint256 submissionId
	)
		external
		onlyAssociateEditor(submissionId)
		atStage(submissionId, SubmissionStage.REVIEWED)
		nextStage(submissionId, SubmissionStage.REJECTED)
	{}

	/// @dev The associate editor decides a new revision is required based on reviewer's recommendations.
	function revise(
		uint256 submissionId
	)
		external
		onlyAssociateEditor(submissionId)
		atStage(submissionId, SubmissionStage.REVIEWED)
		nextStage(submissionId, SubmissionStage.REVISING)
	{}
}
