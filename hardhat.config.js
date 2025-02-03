require("@nomicfoundation/hardhat-ignition");
require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();

// Create a .env file in the root directory of your project.
// Add these values to the .env file:
// ALCHEMY_API_KEY=your-alchemy-api-key
// PRIVATE_KEY=your-wallet-private-key
// Deploy to Sepolia test network to test, you can also see it on OpenSea testnet
// To deploy on Sepolia, run npx hardhat ignition deploy ignition/modules/PassToken.js --network sepolia
// To deploy on Mainnet, run npx hardhat ignition deploy ignition/modules/PassToken.js --network ethereum
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
