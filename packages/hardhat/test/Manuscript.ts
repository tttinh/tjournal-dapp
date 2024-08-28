import { expect } from "chai";
import { ethers } from "hardhat";
import { loadFixture } from "@nomicfoundation/hardhat-network-helpers";

describe("Manuscript", function () {
  // We define a fixture to reuse the same setup in every test. We use
  // loadFixture to run this setup once, snapshot that state, and reset Hardhat
  // Network to that snapshot in every test.
  async function deployFixture() {
    const [addr0, addr1, addr2] = await ethers.getSigners();

    const manuscript = await ethers.deployContract("Manuscript");

    await manuscript.waitForDeployment();

    // Fixtures can return anything you consider useful for your tests
    return { manuscript, addr0, addr1, addr2 };
  }

  describe("Basic Usages", function () {
    it("Should be 0 when getting total supply", async function () {
      const { manuscript } = await loadFixture(deployFixture);
      expect(await manuscript.totalSupply()).to.equal(0);
    });

    it("Should mint sucessfully", async function () {
      const { manuscript, addr0 } = await loadFixture(deployFixture);

      await expect(manuscript.connect(addr0).mint("xyz"))
        .to.emit(manuscript, "Transfer")
        .withArgs("0x0000000000000000000000000000000000000000", addr0.address, 1);

      expect(await manuscript.totalSupply()).to.equal(1);
      expect(await manuscript.ownerOf(1)).to.equal(addr0);
      expect(await manuscript.tokenURI(1)).to.equal("xyz");
    });
  });
});
