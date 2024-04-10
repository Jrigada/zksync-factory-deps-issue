//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "./Greeter.sol";

contract UseGreeter {
    address private greeter;

    constructor(address _greeter, string memory greeting){
        greeter = _greeter;
        Greeter(_greeter).setGreeting(greeting); //BAD
    }

    function greet() public view returns (string memory) {
        return Greeter(greeter).greet();
    }

    function setGreeting(string memory _greeting) public {
        Greeter(greeter).setGreeting(_greeting);
    }
}