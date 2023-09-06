/*
#3 Add Item to Inventory

Write a function that adds a new item to an inventory. 
Your task is to add a modifier that only allows the owner of the contract 
to add items to the inventory. You can assume that the owner's address 
is stored in a state variable called 'owner'.

Example 1:
    Input: _name = "shoes", _price = 100
    Output: [{"_name":"shoes","_price":100}]

Example 2:
    Input: _name = "book", _price = 10"
    Output: [{"_name":"book","_price":10}]

Constraints:
Only the owner of the contract should be able to add items.
*/
pragma solidity ^0.8.4;

contract Solution {
    struct Item {
        string name;
        uint256 price;
    }

    Item[] public inventory;
    address public owner;

    constructor() {
        owner = msg.sender; // address of owner
    }

    function addItemToInventory(
        string memory _name,
        uint256 _price
    ) public onlyOwner {
        inventory.push(Item(_name, _price));
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can add items");
        _;
    }

    function getInventory() public view returns (Item[] memory) {
        return inventory;
    }

    function clearInventory() private onlyOwner {
        delete inventory;
    }
}
