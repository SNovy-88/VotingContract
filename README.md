# VotingContract - User Guide
Contract address on Sepolia Blockchain:
XXXXXX

## Key Features
* Vote on a predefined question with multiple options
* 1 vote per user only
* Fee: a small fee of at least 0.002 Sepolia ETH is needed to vote
* View:
  - Question and Options
  - Results

## How to use
* getVotingDetails()
  - will print the question and the available options
* vote("Option")
  - include the option you want to vote for as a string
  - option needs to match the options available
  - include at least 0.002 Sepolia ETH
* getResults()
  - will print the options and the number of votes as lists

## Rules
* You can only vote once per address
* Only valid options from the list of options are accepted
* transactions without 0.002 Sepolia ETH will be rejected
* HAVE FUN!!

## Commands
* Open hardhat console
  ```
  npx hardhat console --network sepolia
  ```
* Update files
  - add your own .env and hardhat.config.js files 
* Connect to contract
  ```
  const abi = require('./VotingSystem.json').abi; //update to your location of the file
  const contractAddress = "XXXXX";
  const signer = await ethers.provider.getSigner()
  contract = new ethers.Contract(contractAddress, abi, ethers.provider);
  ```
  
