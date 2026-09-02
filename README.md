# Tokenizer

## Description

**Tokenizer** is a Web3 project from school 42 focused on creating and deploying a custom digital token on a public
blockchain.

The goal of the project is to discover blockchain technology and gain practical experience with smart contracts, token
standards, deployment, and public blockchain explorers.

For this project, I created my own token following the **ERC-20** standard and deployed it on the **Ethereum Sepolia
test network**.

---

## Goals

The main objectives of this project are to :

- Understand the fundamentals of blockchain and Web3.
- Create a custom ERC-20 token.
- Write and deploy a smart contract.
- Interact with the deployed token on a public test network.

## Tools & Technologies

- **Solidity** — Primary language used to develop smart contracts for Ethereum.
- **Remix IDE** — Development, compilation, deployment and interaction environment for the smart contract.
- **Ethereum Sepolia** — Public Ethereum test network used for deployment and interact with the deployed contract.
- **Google Cloud** — Used to obtain Sepolia ETH for testing and deployment.
- **Etherscan** — Used to inspect and interact with the deployed contract.
- **MetaMask** — Software cryptocurrency wallet used to interact with the Ethereum blockchain.

---

## Project Structure

```text
.
├── code/                   # contract's source code
    └── Nexus42.sol
├── deployment/             # deployment procedure
    └── deployment.md
├── documentation/          # miscellaneous information
    ├── etherscan.md
    ├── Nexus42.md
    └── token_standard.md
└── README.md               # description of the project
```

---

## Documentation

For more detailed information, please see :

- [Smart Contract](code/Nexus42.sol)
- [How to deploy ?](deployment/deployment.md)
- [What is the Nexus42 token ?](documentation/Nexus42.md)

---

## Token Information

|                    |                                            |
|:-------------------|--------------------------------------------|
| `Name`             | Nexus42                                    |
| `Ticker`           | N42                                        |
| `Network`          | Ethereum Sepolia                           |
| `Standard`         | ERC-20                                     |
| `Contract address` | 0xF9689e7699f41b48A3f83E726C9790c0e5D60597 |
| `Decimals`         | 18                                         |
| `Max supply`       | $1764 \times 10^{18}$                      |
| `Initial supply`   | $42 \times 10^{18}$                        |
