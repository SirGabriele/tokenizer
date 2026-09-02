# Why use Ethereum blockchain ?

At the time of development, I was not able to access a working faucet for the BNB Smart Chain. This led me
to use the **Ethereum** blockchain instead, more precisely the **Sepolia** testnet.

On [Ethereum][1], ERC-20 is the standard commonly used for fungible tokens. By implementing standardized functions such as
`transfer`, `approve`, `transferFrom` and `balanceOf`, the contract can interact seamlessly with wallets, and other
decentralized applications without requiring custom integrations. This improves interoperability, usability and adoption
while also making the contract easier for other developers to understand and integrate.


These standardized functions can be inherited from OpenZeppelin's [ERC20][3] contract. However, for learning purposes,
I chose to implement manually the functions provided in the [IERC20][2] interface, which is inherited by the ERC20 contract.

**OpenZeppelin** is one of the most widely used libraries of security-oriented, reusable Solidity contracts and
interfaces for the Ethereum blockchain. It provides implementations for common standards such as ERC-20, ERC-721,
access control, ownership and more.

---

# Standard functions

- **`totalSupply()`** — Returns the total number of tokens currently in circulation.
- **`balanceOf(address account)`** — Returns the token balance of a specific account.
- **`transfer(address to, uint256 value)`** — Transfers a specified amount of tokens from the caller's account to another address.
- **`allowance(address tokenOwner, address spender)`** — Returns the amount of tokens that a spender is authorized to transfer on behalf of the token owner.
- **`approve(address spender, uint256 value)`** — Grants a spender permission to transfer a specified amount of tokens on behalf of the caller.
- **`transferFrom(address from, address to, uint256 value)`** — Transfers tokens from one address to another using the allowance previously granted to the caller.

---

# Additional features (modifiers)

- **`onlyOwner()`** — Ensures that the linked function can only be executed by the contract's owner.
- **`validAddress(address account)`** — Ensures that the provided address is valid and is not the zero address.
- **`validBalance(address account, uint256 amount)`** — Ensures that the specified account has a sufficient balance to cover the requested amount.
- **`validAllowance(address from, uint256 amount)`** — Ensures that the caller has a sufficient allowance to transfer the requested amount on behalf of the specified account.

[1]: https://ethereum.org/developers/docs/standards/tokens/erc-20/
[2]: https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v5.0/contracts/token/ERC20/IERC20.sol
[3]: https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v5.0/contracts/token/ERC20/ERC20.sol