module.exports = {
  networks: {
    development: {
      host: "localhost",
      port: 7545,
      network_id: "*", // Match any network id
      gas: 6000000
    },
    test: {
      host: "https://rinkeby.infura.io/v3/f9e15d6dd29b4cf5aac4eb4b742ad25b",
      port: "80",
      network_id: "*",
      gas: 600000,
      funding: ""
    }
  },
  compilers: {
    solc: {
      version: "0.8.10",
      settings: {
        optimizer: {
          enabled: false, // Default: false
          runs: 200      // Default: 200
        },
      }
    }
  }
};
