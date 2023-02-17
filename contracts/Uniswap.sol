// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

// Uniswap Interfaces for Swapping rules
import "./interfaces/IUniswapV2Factory.sol";
import "./interfaces/IUniswapV2Pair.sol";
import "./interfaces/IUniswapV2Router.sol";

contract Uniswap {

        IUniswapV2Router02 uniswapV2Router;
        address uniswapV2Pair_erc20_1_WETH;
        address uniswapV2Pair_erc20_1_erc20_2;
        address uniswapV2Pair_erc20_1_erc20_3;
        address uniswapV2Pair_erc20_2_erc20_3;

        address erc20_1;
        address erc20_2;
        address erc20_3;

        constructor(address uniswapV2Router_, address erc20_1_, address erc20_2_, address erc20_3_) {
            IUniswapV2Router02 _uniswapV2Router = IUniswapV2Router02(
                uniswapV2Router_
        );

            erc20_1 = erc20_1_;
            erc20_2 = erc20_2_;
            erc20_3 = erc20_3_;

            // Creates a Uniswap Pairs
            uniswapV2Pair_erc20_1_WETH = IUniswapV2Factory(_uniswapV2Router.factory())
            .createPair(erc20_1, _uniswapV2Router.WETH());

            uniswapV2Pair_erc20_2_erc20_3 = IUniswapV2Factory(_uniswapV2Router.factory())
            .createPair(erc20_2, erc20_3);

            uniswapV2Router = _uniswapV2Router;
        }
}