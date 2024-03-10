# Points Protocol Interfaces

This repository contains the interfaces for Stack's Points Protocol, which are used to extend the core points protocol on the Stack chain.

## Getting Started

To get started with the Stack Protocol Interfaces, follow these steps:

1. Set up your Solidity development environment (e.g. Forge, Hardhat).
2. Connect to the Stack network using the provided network information (see the "Network Information" section below).
3. Import the `IPoints` and `IPointsObserver` interfaces into your Solidity contract.
4. Implement the necessary functions from the interfaces in your contract.
5. Deploy your contract to the Stack chain.

## Network Information

| Name               | Value                                        |
|--------------------|----------------------------------------------|
| Network Name       | Stack                                        |
| Description        | The public mainnet for Stack.                |
| Chain ID           | 78225                                        |
| Currency Symbol    | ETH                                          |
| RPC Endpoint       | https://rpc.stack.so                         |
| Bridge             | https://bridge.stack.so                      |
| Block Explorer     | https://explorer.stack.so                    |
| Points Protocol    | `0x000000000c2B4A5816cbb76e9bb3f70D175940A3` |
| Points Interface   | [IPoints.sol](https://github.com/stack-so/protocol-interfaces/blob/main/IPoints.sol)                              |
| Observer Interface | [IPointsObserver.sol](https://github.com/stack-so/protocol-interfaces/blob/main/IPointsObserver.sol)                              |


## Example Usage

Here's an example of how to use the IPoints interface in your Solidity contract:

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "./IPoints.sol";

// Ensure this contract is added as an issuer to the Points Protocol
// Use `addIssuer()` in the Points contract.
contract OnchainIssuer {
    address private constant pointsAddress = 0x000000000c2B4A5816cbb76e9bb3f70D175940A3;
    private constant uint256 systemId = 1; // your point system ID
    IPoints private pointsContract = IPoints(pointsAddress);

    constructor() {}

    function addPointsToUser(address user, uint256 points) external {
        pointsContract.addPoints(systemId, user, points);
    }

    // ... (add more functions as needed)
}