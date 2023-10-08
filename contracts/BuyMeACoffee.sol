// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract BuyMeACoffee {
    // Event to emit when a memoo is created
    event NewMemo(
        address indexed from,
        uint256 timestamp,
        string name,
        string message
    );

    // Memo Struct
    struct Memo {
        address from;
        uint256 timestamp;
        string name;
        string message;
    }
    //list of all memos recieved from friends
    Memo[] memos;

    // Address of the contract deployer
    address payable owner;

    // Deploy Logic
    constructor() {
        owner = payable(msg.sender);
    }

    /**
     * @dev buy a coffee for contract owner
     * @param _name name of the coffee buyer
     * @param _message a nice message form the cofee buyer
     */
    function buyCoffee(
        string memory _name,
        string memory _message
    ) public payable {
        require(msg.value > 0, "can't buy coffee with no money");
        // Add the memo to storage
        memos.push(Memo(msg.sender, block.timestamp, _name, _message));
        //Emit a log event when a new memo is created
        emit NewMemo(msg.sender, block.timestamp, _name, _message);
    }

    /**
     *@dev send the entire balance stored in this contract to the owner
     */

    function withdrawTips() public {
        require(owner.send(address(this).balance));
    }

    /**
     *@dev retrieves all the memos retreived  stored on the blockchain
     */
    function getMemos() public view returns (Memo[] memory) {
        return memos;
    }
}
