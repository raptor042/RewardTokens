// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./RewardTokensV1.sol";

contract RewardTokensFactoryV1 {
    address[] public tokens;

    mapping (string => address) public _tokens;

    event CreateRewardToken(address indexed token, string tokenID);

    constructor() {}

    function createRewardToken(
        string memory _name,
        string memory _symbol,
        uint256 _supply,
        uint256 buy_tax,
        uint256 sell_tax,
        address marketing_wallet,
        address dev_wallet,
        uint256 max_tx_amount,
        uint256 max_wallet_amount,
        address reward_token
    ) public {
        RewardTokensV1 token = new RewardTokensV1(
            _name,
            _symbol,
            _supply,
            buy_tax,
            sell_tax,
            marketing_wallet,
            dev_wallet,
            max_tx_amount,
            max_wallet_amount,
            reward_token,
            msg.sender
        );

        string memory tokenID = string(abi.encodePacked(_name, "#", block.timestamp));

        tokens.push(address(token));

        _tokens[tokenID] = address(token);

        emit CreateRewardToken(address(token), tokenID);
    }
}