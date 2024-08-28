import { HardhatRuntimeEnvironment } from "hardhat/types";
import { DeployFunction } from "hardhat-deploy/types";

const deployManuscript: DeployFunction = async function (hre: HardhatRuntimeEnvironment) {
  const { deployer } = await hre.getNamedAccounts();
  const { deploy } = hre.deployments;

  await deploy("Manuscript", {
    from: deployer,
    args: [],
    log: true,
    autoMine: true,
  });
};

export default deployManuscript;

deployManuscript.tags = ["Manuscript"];
