//SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

// Useful for debugging. Remove when deploying to a live network.
import "hardhat/console.sol";

/**
 * A smart contract that allows users to update their profiles.
 * @author TinhTT
 */
contract Profile {
	mapping(address => string) public userProfiles;
	mapping(string => bool) public usedNames;

	// Events: a way to emit log statements from smart contract that can be listened to by external parties
	event NameChange(address indexed setter, string newName);

	function setName(string memory newName) public {
		console.log("Setting new name '%s' from %s", newName, msg.sender);

		require(bytes(newName).length > 0, "Name should be non-empty");
		require(!usedNames[newName], "Name should be available");

		string memory oldName = userProfiles[msg.sender];
		userProfiles[msg.sender] = newName;
		usedNames[newName] = true;
		usedNames[oldName] = false;

		console.log(
			"%s changed name from '%s' to '%s'",
			msg.sender,
			oldName,
			newName
		);

		emit NameChange(msg.sender, newName);
	}

	function getName(address user) public view returns (string memory) {
		return userProfiles[user];
	}

	function isAvailable(string memory name) public view returns (bool) {
		return !usedNames[name];
	}
}
