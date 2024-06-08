const hre = require('hardhat');
const fs = require('fs');

let { version } = require('./version.json');
version += 1;

async function main() {
	let tokenName = `JollofToken${version}`;
	let tokenSymbol = `JTK${version}`;
	const tokenContract = await hre.ethers.getContractFactory('JollofTokenERC20');
	const token = await tokenContract.deploy(tokenName, tokenSymbol);

	await token.waitForDeployment();

	console.log(token);

	fs.writeFileSync('./scripts/version.json', JSON.stringify({ version }, 4), {
		flag: 'w'
	});
}

main().catch((error) => {
	console.error(error);
	process.exitCode = 1;
});
