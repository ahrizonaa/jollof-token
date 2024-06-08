require('@nomicfoundation/hardhat-toolbox');
require('dotenv').config();

module.exports = {
	solidity: '0.8.20',
	networks: {
		fantom: {
			url: 'https://rpc.ankr.com/fantom/',
			chainId: 250,
			accounts: [process.env.PRIVATE_KEY]
		}
	},
	etherscan: {
		apiKey: process.env.FTMSCAN_API_KEY // Get from ftmscan
	}
};
