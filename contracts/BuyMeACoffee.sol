// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;


contract BuyMeACoffee {
  // Evennt to emit when a memoo is created
    event NewMemo(
      address indexed from,
       uint256 timeStamp,
       string name,
       string message
    );

    // Memo Struct
    struct Memo {
       address from;
       uint256 timeStamp;
       string name;
       string message;
 }

}
