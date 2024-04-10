// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {TransparentProxyFactory} from 'solidity-utils/src/contracts/transparent-proxy/TransparentProxyFactory.sol';

contract FactoryExampleTwo {
  constructor(address proxyFactory) {

    //low level call that seems to work
    // (bool success, bytes memory data) = proxyFactory.call(
    //   abi.encodeWithSignature("createProxyAdmin(address)", address(60000 + 1234))
    // );
    
    TransparentProxyFactory(proxyFactory).createProxyAdmin(address(60000 + 1234));
  }
}
