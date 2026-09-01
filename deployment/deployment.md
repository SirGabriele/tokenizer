# Remix IDE

[**Remix IDE**][1] is a browser-based development environment designed for writing, compiling, deploying and interacting
with Ethereum smart contracts. It provides an accessible interface for developing Solidity applications without
requiring a local blockchain environment.

In this project, Remix is used to:

* **Write and edit Solidity code** — Develop the Nexus42 smart contract directly in the browser.
* **Compile the contract** — Compile the Solidity source code and verify that it is syntactically and semantically valid.
* **Deploy the contract** — Deploy the Nexus42 contract to the **Sepolia testnet** using a connected Web3 (**Metamask**) wallet.
* **Interact with the contract** — Call read-only functions such as `balanceOf()` and `totalSupply()`, as well as execute state-changing functions such as `transfer()`, `approve()` and `mint()`.

Remix therefore serves as the primary development and testing environment for the Nexus42 smart contract, from initial implementation through deployment and validation on Sepolia.

---

# Procedure

## Compilation

Once the contract is written, it must be compiled. The goal of compiling a Solidity contract is to transform the
human-readable Solidity source code into bytecode that the Ethereum Virtual Machine can execute. The compiler also
performs several important checks along the way such as syntax, type and semantic checking. It then generates the bytecode
and the **Application Binary Interface (ABI)** which tells tools such as Remix, Etherscan and wallets how to interact
with the contract.

A good practice is to explicitly write the compiling version of the contract. For example, the Nexus42 contract is compatible
with any version equal or higher to `0.8.z` where `z >= 30`.

```solidity
pragma solidity ^0.8.30;
```

This compiler version can be selected in the `Solidity compiler` tab.

![Compilation successful](../assets/deployment/solidity_compiler_compilation_successful.png)

---

## Deployment

We can now move to the `Deploy & run transactions` tab and select the environment on which we can to deploy the contract.
In this project's example, I am using Metamask's Chrome extension.

![Environment selection](../assets/deployment/deployment_selection_environment.png)

We then select the `Sepolia Testnet - Metamask` option, the account we want to use to finish the deployment and select
the correct contract.

![Browser extension selection](../assets/deployment/deployment_selection_browser_extension.png)

Click the `Deploy` button and confirm the operation.

![Deployment confirmation](../assets/deployment/deployment_confirmation.png)

We just deployed our first token! It can be seen in the wallet by adding a custom token, which only requires the
contract address.

![Deployment complete](../assets/deployment/deployment_complete.png)

On the left, we can see the `Deployed contracts` now contains one contract. We can interact with the contract from here.

[1]: https://remix.ethereum.org/#lang=en&optimize&runs=200&evmVersion&version=soljson-v0.8.34+commit.80d5c536.js
