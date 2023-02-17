const Token1 = artifacts.require("Token1");
const Token2 = artifacts.require("Token2");
const Token3 = artifacts.require("Token3");

module.exports = async function (deployer, _network, accounts) {

    await deployer.deploy(
        Token1,
    );

    await deployer.deploy(
        Token2,
    );

    await deployer.deploy(
        Token3,
    );
}