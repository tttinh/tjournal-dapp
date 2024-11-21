//SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "./Types.sol";
import "./JDocument.sol";

/// @title A facet of Journal that manages APIs related to users profiles.
/// @author Tinh Tran
contract JProfile is JDocument {
	// Events
	event NameUpdated(address indexed setter, string newName);

	// Errors
	error AlreadyRegistered();

	// State variables
	mapping(address => Profile) users;
	mapping(string => bool) usedNames;

	/// @dev Make sure the user is valid.
	modifier validUser() {
		Profile storage user = users[msg.sender];
		require(bytes(user.name).length > 0, "Invalid user");
		_;
	}

	/// @dev Register to the journal
	function register(string memory name) public {
		require(bytes(name).length > 0, "Name should be non-empty");
		require(!usedNames[name], "Name should be available");

		if (bytes(users[msg.sender].name).length > 0)
			revert AlreadyRegistered();

		users[msg.sender] = Profile(msg.sender, name);
		console.log("A new user %s registers with name:%s", msg.sender, name);
	}

	/// @dev Everyone can update their name if available.
	function setName(string memory newName) public validUser {
		require(bytes(newName).length > 0, "Name should be non-empty");
		require(!usedNames[newName], "Name should be available");

		string memory oldName = users[msg.sender].name;
		users[msg.sender].name = newName;
		usedNames[newName] = true;
		usedNames[oldName] = false;

		emit NameUpdated(msg.sender, newName);
	}

	/// @dev Retrieve a user profile.
	function getProfile(address user) public view returns (Profile memory) {
		return users[user];
	}

	/// @dev Check if a name is available for use.
	function isAvailable(string memory name) public view returns (bool) {
		return !usedNames[name];
	}
}
