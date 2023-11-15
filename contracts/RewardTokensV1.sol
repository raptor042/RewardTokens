// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "./interfaces/IUniswapV2Factory.sol";

contract RewardTokensV1 is ERC20 {
    address public owner;

    IERC20 private Token;

    IUniswapV2Factory private Factory;

    address public UniswapV2Pair;
    
    address public RewardToken;

    uint256 public BuyTax;

    uint256 public SellTax;

    address public MarketingWallet;

    address public DevWallet;

    uint256 public MaxTxAmount;

    uint256 public MaxWalletAmount;

    constructor(
        string memory _name,
        string memory _symbol,
        uint256 _supply,
        uint256 buy_tax,
        uint256 sell_tax,
        address marketing_wallet,
        address dev_wallet,
        uint256 max_tx_amount,
        uint256 max_wallet_amount,
        address reward_token,
        address _owner
    ) ERC20(_name, _symbol) {
		_mint(address(this), _supply);

        owner = _owner;

        Token = IERC20(reward_token);

        Factory = IUniswapV2Factory(0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f);

        UniswapV2Pair = Factory.createPair(address(this), 0xB4FBF271143F4FBf7B91A5ded31805e42b2208d6);

        setBuyTax(buy_tax);

        setSellTax(sell_tax);

        setMarketingWallet(marketing_wallet);

        setDevWallet(dev_wallet);

        setMaxTxAmount(max_tx_amount);

        setMaxWalletAmount(max_wallet_amount);
	}

    function setBuyTax(uint256 buy_tax) public {
        BuyTax = buy_tax;
    }

    function setSellTax(uint256 sell_tax) public {
        SellTax = sell_tax;
    }

    function setMarketingWallet(address marketing_wallet) public {
        MarketingWallet = marketing_wallet;
    }

    function setDevWallet(address dev_wallet) public {
        DevWallet = dev_wallet;
    }

    function setMaxTxAmount(uint256 max_tx_amount) public {
        MaxTxAmount = max_tx_amount;
    }

    function setMaxWalletAmount(uint256 max_wallet_amount) public {
        MaxWalletAmount = max_wallet_amount;
    }
}