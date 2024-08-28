import { HardhatRuntimeEnvironment } from "hardhat/types";
import { DeployFunction } from "hardhat-deploy/types";

const deployProfile: DeployFunction = async function (hre: HardhatRuntimeEnvironment) {
  const { deployer } = await hre.getNamedAccounts();
  const { deploy } = hre.deployments;

  await deploy("Profile", {
    from: deployer,
    args: [],
    log: true,
    autoMine: true,
  });
};

export default deployProfile;

deployProfile.tags = ["Profile"];
