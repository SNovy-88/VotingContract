pragma solidity ^0.8.27;

contract VotingSystem {
    
    string public question;
    string[] public options; //the answer options to the question
    mapping(string => uint) public votes; //the votes for each option
    mapping(address => bool) public hasVoted; //to check if an address has voted

    constructor(string memory _question, string[] memory _options) {
        require(_options.length >= 4, "There must be at least 4 options");
        question = _question;
        options = _options;

        //initialise each option with 0 votes
        for (uint i = 0; i < _options.length; i++) {
            votes[_options[i]] = 0;
        }
    }

    //get current voting results
    function getResults() public view returns (string[] memory, uint[] memory) {
        uint[] memory _votes = new uint[](options.length);
        for (uint i = 0; i < options.length; i++) {
            _votes[i] = votes[options[i]];
        }
        return (options, _votes);
    }

    //put in your own vote for a fee of 0.001 sepolia
    function vote(string memory _option) payable external {
        require(!hasVoted[msg.sender], "You have already voted");
        require(msg.value > 0.001 ether);
        require(isValidOption(_option), "Invalid option");

        votes[_option]++; //increases vote count for selected option
        hasVoted[msg.sender] = true; //adds voters address to hasVoted mapping
    }
    
    //check if the option that was voted for is a valid option
    function isValidOption(string memory _option) internal view returns (bool) {
        for (uint i = 0; i < options.length; i++) {
            if (keccak256(abi.encodePacked(options[i])) == keccak256(abi.encodePacked(_option))) {
                return true;
            }
        }
        return false;
    }

    function getVotingDetails() public view returns (string memory, string[] memory) {
        return (question, options);
    }
}