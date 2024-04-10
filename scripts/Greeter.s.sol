// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {Script} from 'forge-std/Script.sol';
import {Greeter} from '../src/contracts/Greeter.sol';
import {UseGreeter} from '../src/contracts/UseGreeter.sol';

contract GreeterScript is Script {
  function run() external {
    vm.startBroadcast();

    Greeter greet = new Greeter("ok boomer");
    UseGreeter use = new UseGreeter(address(greet), "hello"); //DOESN'T

    use.setGreeting("hello"); //WORKS
    vm.stopBroadcast();

    string memory res = greet.greet();
    assert(equals("hello", res));
  }

  function equals(string memory one, string memory two) public returns (bool)  {
    return (keccak256(abi.encodePacked(one)) ==
      keccak256(abi.encodePacked(two)));
  }
}