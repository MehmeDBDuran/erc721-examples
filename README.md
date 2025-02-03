# 🏆 PassToken - ERC721 NFT Smart Contract  

PassToken is a **blockchain-based smart contract** that allows the creation and management of **NFTs (Non-Fungible Tokens)**.  

NFTs are **unique digital assets** that can represent things like **art, collectibles, memberships, or digital passes** on the Ethereum blockchain. This contract is designed to allow **only the contract owner** to create (mint) new NFTs.

---

## 📜 Features  

✔️ **ERC-721 Standard** – A widely used Ethereum NFT standard  
✔️ **Only Owner Can Mint** – The contract owner has full control over NFT creation  
✔️ **Batch Minting** – The owner can mint multiple NFTs at once  
✔️ **Metadata Customization** – The owner can set a **Base URL** to store NFT metadata  
✔️ **OpenSea Compatibility** – The NFTs are designed to work with OpenSea (a popular NFT marketplace)  

---

## 🚀 Installation & Setup  

### 1️⃣ Clone the Repository  
To use this contract, you first need to **download the project files** onto your computer.  
Open a terminal (Command Prompt, PowerShell, or Terminal) and run:

```
git clone https://github.com/MehmeDBDuran/erc721-examples.git
cd PassToken
```

### 2️⃣ Install Dependencies  
Before running any scripts, you need to install some required tools.  
Make sure you have **Node.js** installed, then run:  

```
npm install
```

### 3️⃣ Setup Environment Variables  
Since this project interacts with the **Ethereum blockchain**, we need to configure some **API keys and wallet details**.  

Create a new **.env file** inside the project folder and add the following:

```
ALCHEMY_API_KEY=your-alchemy-api-key
PRIVATE_KEY=your-wallet-private-key
```

Replace:
- `your-alchemy-api-key` → Get this from [Alchemy](https://www.alchemy.com/) (a blockchain API provider).
- `your-wallet-private-key` → Use your **Ethereum wallet's private key** (DO NOT SHARE THIS KEY WITH ANYONE).

---

## 💧 Getting Free Testnet ETH (Faucet)

Before deploying and testing the contract on the **Sepolia testnet**, you need **test ETH** to cover transaction fees. Since test ETH has no real-world value, you can get it for free from a **faucet**.

### 🔹 Get Sepolia Testnet ETH  
1. Go to the [Sepolia Faucet](https://sepoliafaucet.com/)  
2. Connect your **MetaMask wallet**  
3. Enter your **Ethereum wallet address**  
4. Click **Request ETH**  
5. Wait a few minutes, then check your balance on [Etherscan Sepolia](https://sepolia.etherscan.io/)

💡 **Tip:** If one faucet is out of ETH, try another one:  
- [Alchemy Sepolia Faucet](https://www.alchemy.com/faucets/ethereum-sepolia)  
- [QuickNode Sepolia Faucet](https://faucet.quicknode.com/)  

---

## 🛠 Hardhat Configuration  

This project uses **Hardhat**, a tool for testing and deploying smart contracts.  

The contract supports **three networks**:
- **Hardhat** (Local testing)
- **Sepolia** (Ethereum test network)
- **Ethereum Mainnet** (Live blockchain)

Here’s the configuration file (`hardhat.config.js`):

```js
module.exports = {
  solidity: "0.8.22",
  networks: {
    hardhat: {},

    sepolia: {
      url: `https://eth-sepolia.g.alchemy.com/v2/${process.env.ALCHEMY_API_KEY}`,
      accounts: [process.env.PRIVATE_KEY]
    },

    ethereum: {
      url: `https://eth-mainnet.alchemyapi.io/v2/${process.env.ALCHEMY_API_KEY}`,
      accounts: [process.env.PRIVATE_KEY]
    }
  }
};
```

---

## 🔨 Deploying the Smart Contract  

### 🏗 Deploy to Sepolia (Testnet)  
Before deploying on the real Ethereum network, **you should test on Sepolia**.  
To deploy on Sepolia, run:  

```
npx hardhat ignition deploy ignition/modules/PassToken.js --network sepolia
```

This will:
- Deploy the contract on the Sepolia test network.
- Allow you to test your NFTs before launching on the real Ethereum network.

### 🌍 Deploy to Ethereum Mainnet  
Once testing is complete, you can deploy to **Ethereum Mainnet** by running:

```
npx hardhat ignition deploy ignition/modules/PassToken.js --network ethereum
```

This will **make your NFT contract live on the blockchain**.

---

## 📜 Contract Overview  

### 🔹 What does this smart contract do?  
The `PassToken.sol` contract allows the **owner** to:

- **Create (mint) NFTs** and assign them to users
- **Mint multiple NFTs at once**
- **Update metadata settings** (like base URLs)
- **Ensure compatibility with OpenSea** (NFT marketplace)

### 🔹 Functions inside the contract  

- **Minting NFTs**
  - `safeMint(address to)` → Creates a new NFT and assigns it to a user
  - `batchMint(address to, uint256 amount)` → Mints multiple NFTs at once  

- **Managing the contract**
  - `setBaseURI(string memory baseURI)` → Updates the Base URI for NFT metadata  

- **Getting NFT details**
  - `tokenURI(uint256 tokenId)` → Returns the metadata link for a specific NFT  

- **OpenSea Support**
  - `contractURI()` → Returns the contract metadata URI for OpenSea  
  - `setContractURI(string memory _contractURI)` → Updates the contract metadata URI  

---

## 🎯 How to Use  

### Mint an NFT (Owner Only)  
To create a new NFT and assign it to someone, the owner calls:

```solidity
safeMint(receiver_address);
```

Example:
```solidity
safeMint(0x1234567890abcdef1234567890abcdef12345678);
```
This mints an NFT and sends it to the address **0x123...78**.

---

### Batch Mint NFTs (Owner Only)  
To mint **multiple NFTs** at once, use:

```solidity
batchMint(receiver_address, amount);
```

Example:
```solidity
batchMint(0x1234567890abcdef1234567890abcdef12345678, 5);
```
This will mint **5 NFTs** and send them to **0x123...78**.

---

### Update NFT Metadata URL  
NFT metadata contains information about the NFT (image, description, attributes).  
The owner can update the **Base URI** using:

```solidity
setBaseURI("https://NewMetadataURL.com/");
```

---

### Get Token Metadata  
To get details about a specific NFT (like its image and name), call:

```solidity
tokenURI(tokenId);
```

Example:
```solidity
tokenURI(1);
```
This will return something like:
```
https://YourBASEURIaddress.com/1.json
```

---

## 📄 License  

This project is licensed under the **MIT License**, meaning it is open-source and free to use.

---

## 🤝 Contributing  

We welcome contributions! If you want to improve this project:
1. **Fork the repository**  
2. **Make your changes**  
3. **Submit a pull request (PR)**  

---

