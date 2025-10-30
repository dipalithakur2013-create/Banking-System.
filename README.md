
# 💠 Transparent Decentralized On-Chain Banking System

### 🧾 Project Description  
This project is a **Transparent Decentralized On-Chain Banking System**, built to demonstrate how blockchain technology can be used to create a secure, open, and efficient banking model.  
It removes the need for centralized control, allowing users to deposit, withdraw, and track their funds directly on the blockchain — with **full transparency** and **no intermediaries**.

---

### ⚙️ What It Does  
- Allows users to **create accounts** on the blockchain.  
- Supports **secure deposits and withdrawals** through smart contracts.  
- Maintains an **immutable transaction record** for full transparency.  
- Ensures **no double-spending or fraud**, thanks to on-chain validation.  

---

### 🌟 Features  
✅ Fully decentralized banking logic using Solidity smart contracts  
✅ Transparent transactions — everything recorded on-chain  
✅ Secure fund management with cryptographic protection  
✅ Beginner-friendly smart contract structure  
✅ Scalable foundation for DeFi or Web3 banking apps  

---

### 🔗 Deployed Smart Contract  
**Contract Address:**  0xd8b934580fcE35a11B58C6D73aDeE468a2833fa8 
**Network:** (e.g., Ethereum / Polygon / Celo / Binance Smart Chain)  

You can view the deployed contract on your blockchain explorer using the address above.

---

### 💻 Smart Contract Code  
```solidity
//paste your code

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/*
    Title: Transparent Decentralized On-Chain Banking System
    Description:
    - Anyone can deposit Ether into their account.
    - They can withdraw their balance anytime.
    - All transactions are transparent on blockchain.
*/

contract DecentralizedBank {

    // Mapping to store each user's balance
    mapping(address => uint) public balances;

    // Events for transparency — every deposit and withdrawal is recorded
    event Deposit(address indexed user, uint amount);
    event Withdraw(address indexed user, uint amount);

    // Deposit function (users send Ether to bank)
    function deposit() public payable {
        require(msg.value > 0, "Amount must be greater than 0");
        balances[msg.sender] += msg.value;
        emit Deposit(msg.sender, msg.value);  // record event
    }

    // Withdraw function (users can withdraw their balance)
    function withdraw(uint _amount) public {
        require(balances[msg.sender] >= _amount, "Insufficient balance");
        balances[msg.sender] -= _amount;
        payable(msg.sender).transfer(_amount);
        emit Withdraw(msg.sender, _amount);  // record event
    }

    // View your balance
    function checkBalance() public view returns (uint) {
        return balances[msg.sender];
    }
}
