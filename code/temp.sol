// SPDX-License-Identifier: MIT

pragma solidity ^0.8.30;

interface IERC20 {
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address to, uint256 value) external returns (bool);
    function allowance(address tokenOwner, address spender) external view returns (uint256);
    function approve(address spender, uint256 value) external returns (bool);
    function transferFrom(address from, address to, uint256 value) external returns (bool);
}

error N42NotOwner();
error N42InvalidAddress(address account);
error N42InsufficientBalance(address sender, uint256 balance, uint256 needed);
error N42InsufficientAllowance(address spender, uint256 currentAllowance, uint256 needed);
error N42SupplyOverflow(uint256 totalSupply, uint256 mintRequest, uint256 maxSupply);

contract Nexus42 is IERC20 {
    /**
    * Public values.
    */
    string public constant name = "Nexus42";
    string public constant symbol = "N42";
    address public owner;

    /**
    * Private values.
    */
    uint8 private constant DECIMALS = 18;
    // 42 * 42 = 1764.
    uint256 private constant MAX_SUPPLY = 1764 * 10 ** DECIMALS;
    uint256 private constant ON_DEPLOY_SUPPLY = 42 * 10 ** DECIMALS;
    uint256 private _totalSupply;

    /**
    * Mappings.
    */
    mapping(address account => uint256) private _balances;
    mapping(address account => mapping(address spender => uint256)) private _allowances;

    constructor() {
        // The constructor is executed only once, during deployment.
        // The deployer becomes the owner of the contract.
        owner = msg.sender;

        // Gives the initial token supply to the creator of the contract.
        _mint(owner, ON_DEPLOY_SUPPLY);
    }

    /**
    * Modifier that asserts the linked function can only be executed if called by the contract's owner.
    */
    modifier onlyOwner() {
        if (msg.sender != owner) {
            revert N42NotOwner();
        }
        _;
    }

    /**
    * Modifier that asserts the validity of an address.
    */
    modifier validAddress(address account) {
        if (account == address(0)) {
            revert N42InvalidAddress(account);
        }
        _;
    }

    /**
    * Modifier that asserts the balance of an account is greater than a specific amount.
    */
    modifier validBalance(address account, uint256 amount) {
        uint256 accountBalance = _balances[account];

        if (accountBalance < amount) {
            revert N42InsufficientBalance(account, accountBalance, amount);
        }
        _;
    }

    /**
    * Modifier that asserts the allowance of an account towards another is superior to a specific amount.
    */
    modifier validAllowance(address from, uint256 amount) {
        uint256 currentAllowance = _allowances[from][msg.sender];

        if (currentAllowance < amount) {
            revert N42InsufficientAllowance(msg.sender, currentAllowance, amount);
        }
        _;
    }

    /**
    * Returns the number of decimals.
    */
    function decimals() external pure returns (uint8) {
        return DECIMALS;
    }

    /**
    * Returns the total supply.
    */
    function totalSupply() external view override returns (uint256) {
        return _totalSupply;
    }

    /*
    * Returns the balance of an address.
    */
    function balanceOf(address account) external view override returns (uint256 balance) {
        return _balances[account];
    }

    /**
    * Transfers `amount` tokens from `caller` to `to`.
    * Reverts if `to` is the zero address.
    * Reverts if `caller` has insufficient balance.
    */
    function transfer(address to, uint256 amount) external validAddress(to) validBalance(msg.sender, amount) override returns (bool success) {
        // Subtracts the amount from the sender's balance.
        _balances[msg.sender] -= amount;
        // Adds the amount to the receiver's balance.
        _balances[to] += amount;

        // Informs the blockchain that tokens have been transferred.
        emit Transfer(msg.sender, to, amount);

        return true;
    }

    /**
    * Grants `spender` permission to spend up to `amount` tokens on behalf of the caller.
    * Reverts if `spender` is the zero address.
    */
    function approve(address spender, uint256 amount) external validAddress(spender) override returns (bool success) {
        _allowances[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }

    /**
    * Transfers tokens from `from` to `to` using the caller's allowance.
    * Reverts if `from` is the zero address.
    * Reverts if `to` is the zero address.
    * Reverts if the caller's allowance is less than `amount`.
    * Reverts if `from` has insufficient balance.
    */
    function transferFrom(address from, address to, uint256 amount) external validAddress(from) validAddress(to) validBalance(from, amount) validAllowance(from, amount) override returns (bool success) {
        // Subtracts the amount from the "from"'s balance.
        _balances[from] -= amount;
        // If "from" user allowed msg.sender to spend their tokens, lowers the allowance.
        _allowances[from][msg.sender] -= amount;
        // Adds the amount to the receiver's balance.
        _balances[to] += amount;

        // Informs the blockchain that tokens have been transferred.
        emit Transfer(from, to, amount);

        return true;
    }

    /**
    * Returns the allowance `owner` approved to `spender`.
    */
    function allowance(address tokenOwner, address spender) external view override returns (uint256) {
        return _allowances[tokenOwner][spender];
    }

    /**
    * External access to mint function.
    * Reverts if the caller is not the owner.
    */
    function mint(uint256 amount) external onlyOwner {
        _mint(owner, amount);
    }


    /**
    * Mints a specific amount of tokens.
    */
    function _mint(address account, uint256 amount) internal {
        if (_totalSupply + amount > MAX_SUPPLY) {
            revert N42SupplyOverflow(_totalSupply, amount, MAX_SUPPLY);
        }

        _balances[account] += amount;

        _totalSupply += amount;

        // If from is address(0) when a Transfer event is emitted, it corresponds to a mint operation.
        emit Transfer(address(0), account, amount);
    }
}