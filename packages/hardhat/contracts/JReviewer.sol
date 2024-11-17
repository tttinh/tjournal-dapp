//SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "./JAuthor.sol";

/// @title A facet of Journal that manages APIs for reviewers.
/// @author Tinh Tran
contract JReviewer is JAuthor {
	/// @dev Access modifier for reviewer-only functionality
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

	/// @dev A Reviewer submits a recommendation.
	function submitReview(
		uint256 submissionId,
		Recommendation rec
	)
		public
		onlyReviewer(submissionId)
		atStage(submissionId, SubmissionStage.REVIEWING)
	{
		Submission storage s = submissions[submissionId - 1];
		require(!s.submittedReviews[msg.sender], "Already submitted reviews");
		s.submittedReviews[msg.sender] = true;
		s.reviews.push(rec);

		if (s.reviews.length == s.reviewers.length) {
			s.stage = SubmissionStage.REVIEWED;
		}
	}
}
