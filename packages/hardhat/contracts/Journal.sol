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

}
