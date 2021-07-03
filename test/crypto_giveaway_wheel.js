const CryptoGiveawayWheel = artifacts.require("CryptoGiveawayWheel");

/*
 * uncomment accounts to access the test accounts made available by the
 * Ethereum client
 * See docs: https://www.trufflesuite.com/docs/truffle/testing/writing-tests-in-javascript
 */
contract("CryptoGiveawayWheel", function (/* accounts */) {
  it("should assert true", async function () {
    await CryptoGiveawayWheel.deployed();
    return assert.isTrue(true);
  });
});
