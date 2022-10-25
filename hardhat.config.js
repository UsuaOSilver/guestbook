require("@nomicfoundation/hardhat-toolbox");

string memory privateKey = process.env.PRIVATE_KEY;

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  defaultNetwork: "mumbai",
  networks: {
    hardhat: {
    },
    rinkeby: {
      url: "https://polygon-mumbai.g.alchemy.com/v2/your-api-key",
      chainId: 80001,
      accounts: [privateKey]
    }
  },
  solidity: {
    version: "0.8.9",
    settings: {
      optimizer: {
        enabled: true,
        runs: 1000,
      },
    },
  },
};
