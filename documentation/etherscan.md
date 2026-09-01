# Etherscan

**Etherscan** is a blockchain explorer that provides a transparent interface for inspecting and interacting with Ethereum smart contracts and transactions. It allows users to verify contract source code, inspect transactions and events, view token balances, and interact directly with deployed contracts through their verified interfaces.

## Use Cases

Etherscan can be used to:

- **Verify the smart contract** — Publish the Solidity source code and ABI to make the deployed contract publicly verifiable.
- **Inspect transactions** — Monitor deployments, token transfers, minting, and approvals on the Sepolia testnet.
- **Inspect contract state** — View values such as token balances, total supply, and allowances.
- **Interact with the contract** — Call read-only functions and submit transactions to state-changing functions through the contract's interface.
- **Track token activity** — Follow `Transfer` and `Approval` events emitted by the Nexus42 contract.
- **Validate deployment** — Confirm that the deployed bytecode corresponds to the verified Solidity source code.

The Etherscan page for our deployed contract can be found [here][1].

![Contract's page](../assets/etherscan/etherscan_contract_page.png)

The source code can be read under `Contract > Code`.

![Contrat's source code](../assets/etherscan/etherscan_contract_source_code.png)

The read and write function can be found respectively under `Read Contract` and `Write Contract`.

For example, we can call the `balanceOf()` function and provide the address of the account used to deploy the contract.
The contract is made so the deployer becomes the owner and obtain 42 tokens. Which we can verify.

![BalanceOf function example](../assets/etherscan/etherscan_balance_of_owner.png)


[1]: https://sepolia.etherscan.io/address/0xF9689e7699f41b48A3f83E726C9790c0e5D60597