# VotingContract - User Guide
Contract address on Sepolia Blockchain:
0x9287De506a2c758358042cf04461B06D354aCe65

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
  - add your own .env and hardhat.config.js files to the root folder
* Connect to contract
  ```
  const abi = require('./VotingSystem.json').abi; //update to your location of the file
  const contractAddress = "0x9287De506a2c758358042cf04461B06D354aCe65";
  const signer = await ethers.provider.getSigner()
  contract = new ethers.Contract(contractAddress, abi, ethers.provider);
  ```
* Use the functions
  - get the question with options
    ```
    votingDetails = await contract.getVotingDetails();
    votingDetails
    ```
  - vote
    ```
    vote = await contract.vote("option", {value: ethers.parseEther("0.002") });
    vote
    ```
  - get results
    ```
    results = await contract.getResults();
    results
    ```

https://sepolia.etherscan.io/address/0x9287De506a2c758358042cf04461B06D354aCe65
