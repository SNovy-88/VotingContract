const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");

const VotingSystemModuleVS2 = buildModule("VotingSystemModuleVS2", (m) => {
    const votingsystem = m.contract("VotingSystem", [
        "Is pineapple the best pizza topping?", 
        ["YEEEES", "OMG NOOOOO", "Banana is better!!", "I don't have any strong feelings about pineapple."]
    ]); // [] this is the argument for the constructor

    return {votingsystem};

});

module.exports = VotingSystemModuleVS2;