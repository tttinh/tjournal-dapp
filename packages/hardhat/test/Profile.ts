import { expect } from "chai";
import { ethers } from "hardhat";
import { loadFixture } from "@nomicfoundation/hardhat-network-helpers";
// import { Profile } from "../typechain-types";

// We use `loadFixture` to share common setups (or fixtures) between tests.
// Using this simplifies your tests and makes them run faster, by taking
// advantage of Hardhat Network's snapshot functionality.
// const { loadFixture } = require("@nomicfoundation/hardhat-toolbox/network-helpers");

describe("Profile", function () {
  // We define a fixture to reuse the same setup in every test. We use
  // loadFixture to run this setup once, snapshot that state, and reset Hardhat
  // Network to that snapshot in every test.
  async function deployFixture() {
    // Get the Signers here.
    const [addr0, addr1, addr2] = await ethers.getSigners();

    // To deploy our contract, we just have to call ethers.deployContract and await
    // its waitForDeployment() method, which happens once its transaction has been
    // mined.
    const profile = await ethers.deployContract("Profile");

    await profile.waitForDeployment();

    // Fixtures can return anything you consider useful for your tests
    return { profile, addr0, addr1, addr2 };
  }

  describe("Basic Usages", function () {
    it("Should be true when a name is available", async function () {
      const { profile } = await loadFixture(deployFixture);

      expect(await profile.isAvailable("someone")).to.equal(true);
    });

    it("Should be false when a name is not available", async function () {
      const { profile, addr0 } = await loadFixture(deployFixture);

      await profile.connect(addr0).setName("someone");

      expect(await profile.isAvailable("someone")).to.equal(false);
    });

    it("Should assign a new name", async function () {
      const { profile, addr0 } = await loadFixture(deployFixture);

      expect(await profile.getName(addr0)).to.equal("");

      await profile.connect(addr0).setName("someone");

      expect(await profile.getName(addr0)).to.equal("someone");
    });

    it("Should fail if the given name is not available", async function () {
      const { profile, addr0, addr1 } = await loadFixture(deployFixture);

      await profile.connect(addr0).setName("someone");

      await expect(profile.connect(addr1).setName("someone")).to.be.revertedWith("Name should be available");
    });
  });
});
