const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");

module.exports = buildModule("PassTokenModule", (m) => {
  // Define constructor arguments
  const initialOwner = m.getAccount(0); // First account in Hardhat network
  const baseTokenURI = "https://YourBASEURIaddress.com/";
  const contractMetadataURI = "https://YourCONTRACTURIaddress.com/";

  // Deploy the PassToken contract
  const passToken = m.contract("PassToken", [initialOwner, baseTokenURI, contractMetadataURI]);

  return { passToken };
});
