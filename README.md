# VoteKing 🏆

## Project Description  
**VoteKing** is a straightforward and deployable Solidity smart contract designed for simple two-option voting. It allows users to cast a vote for one of two hard-coded options without needing to input any parameters. This makes it ideal for quick, permissionless voting scenarios or as a learning project for smart contract development.

## What it does  
The contract lets any Ethereum address vote exactly once — either for Option A or Option B. It tracks how many votes each option has received, prevents double-voting from the same address, and provides a function to determine which option is currently leading (or if there’s a tie).
##contract details 
<img width="1818" height="788" alt="Screenshot 2025-10-30 141902" src="https://github.com/user-attachments/assets/e63d81be-8624-4f4c-890a-62a7cbfb4245" />
Contract Address:0xD7ACd2a9FD159E69Bb102A1ca21C9a3e3A5F771B
Contract Details:https://celo.blockscout.com/address/0xD7ACd2a9FD159E69Bb102A1ca21C9a3e3A5F771B
## Features  
- ✅ Two fixed voting options: Option A & Option B  
- 🗳 Vote functions with **no input parameters** (`voteA()` and `voteB()`)  
- 🛡 Prevents multiple votes from the same address via a `hasVoted` mapping  
- 📊 Public vote counters (`votesOptionA` and `votesOptionB`) for transparency  
- 📣 Emits a `VoteCast` event each time a vote is cast, for off-chain monitoring  
- 🔍 A view function `getWinner()` returns the current leading option or “Tie”  
- 🎓 Beginner-friendly Solidity version `^0.8.0` — easy to read, deploy, and extend  

## Deployed Smart Contract Link  
[XXX](XXX)  
*(Replace `XXX` with the URL to your deployed contract, e.g., on Etherscan or Polygonscan)*

## Smart Contract Code  
```solidity
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

