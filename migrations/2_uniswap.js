const Token1 = artifacts.require("Token1");
const Token2 = artifacts.require("Token2");
const Token3 = artifacts.require("Token3");
const Uniswap = artifacts.require("Uniswap");

module.exports = async function (deployer, _network, accounts) {

   let _pancakeSwapRouter = ""; 


    if (_network === "development") {
        // You have to configure it localy if you want to test in development
        _pancakeSwapRouter = "0x0000000000000000000000000000000000000000";
    } else if (_network === "testnet") {
        _pancakeSwapRouter = "0xD99D1c33F9fC3444f8101754aBC46c52416550D1";
    } else if (_network === "bsc") {
        _pancakeSwapRouter = "0x10ED43C718714eb63d5aA57B78B54704E256024E";
    }

    const _instanceToken1 = await Token1.deployed();
    const _instanceToken2 = await Token2.deployed();
    const _instanceToken3 = await Token3.deployed();

    await deployer.deploy(
        Uniswap,
        _pancakeSwapRouter,
        _instanceToken1.address,
        _instanceToken2.address,
        _instanceToken3.address, 
    );
}