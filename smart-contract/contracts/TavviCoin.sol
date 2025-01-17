// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

import "@openzeppelin/contracts/access/Ownable.sol";

import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract TaaviCoin is ERC20, Ownable, ERC20Burnable{
    event tokensBurned(address indexed  owner, uint256 amount, string message);
    event tokensMinted(address indexed  owner, uint256 amount, string message);
    event additionalTokensMinted(address indexed  owner, uint256 amount, string message);


    constructor() ERC20("TaaviCoin", "Tusd"){
        _mint (msg.sender, 1000 * 10**decimals());
        emit tokensMinted(msg.sender, 1000 * 10**decimals(), "Initial supply of Taavi bucks minted");
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
        emit additionalTokensMinted(msg.sender, amount, "Some more Taavi bucks minted");
    }

    function burn (uint256 amount) public override onlyOwner {
        _burn(msg.sender, amount);
        emit tokensBurned(msg.sender, amount, "Taavi bucks burned");
    }

}