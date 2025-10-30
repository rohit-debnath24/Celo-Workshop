// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VoteKing {
    // Two options to vote for (Option A and Option B)
    uint256 public votesOptionA;
    uint256 public votesOptionB;

    // Track if an address has voted already
    mapping(address => bool) public hasVoted;

    // Event when a vote is cast
    event VoteCast(address indexed voter, string option);

    constructor() {
        votesOptionA = 0;
        votesOptionB = 0;
    }

    // Vote for Option A (no input parameter)
    function voteA() public {
        require(!hasVoted[msg.sender], "Already voted");
        hasVoted[msg.sender] = true;
        votesOptionA += 1;
        emit VoteCast(msg.sender, "A");
    }

    // Vote for Option B (no input parameter)
    function voteB() public {
        require(!hasVoted[msg.sender], "Already voted");
        hasVoted[msg.sender] = true;
        votesOptionB += 1;
        emit VoteCast(msg.sender, "B");
    }

    // View function to get the winner option
    function getWinner() public view returns (string memory) {
        if (votesOptionA > votesOptionB) {
            return "Option A";
        } else if (votesOptionB > votesOptionA) {
            return "Option B";
        } else {
            return "Tie";
        }
    }
}
