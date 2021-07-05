// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

//  First iteration of the Crypto Giveaway Wheel!
//
//  Although we plan to support "all the things", this first version is only
//  meant for giving away ether on the ethereum network.

contract CryptoGiveawayWheelEthOnEth {
    address public owner = msg.sender;

    constructor() public {}

   /**
    *  Functions for Admins
    */

    modifier adminOnly() {
        require(
            msg.sender == owner,
            "This function is restricted to the contract's owner"
        );
        _;
    }

    function startEvent() public adminOnly {}

    function spinWheel() public adminOnly {}

    function endEvent() public adminOnly {}

    function updateSponsorAddress() public adminOnly {}

    function updateRegisteredRecipient() public adminOnly {}

    /**
     *  Functions for Contributor(s)
     */

    modifier contributorOnly() {
        require(
            msg.sender == owner,
            "This function is restricted to the contract's owner"
        );
        _;
    }

    modifier onlyContributorOrAdmin() {
        require(
            msg.sender == owner,
            "This function is restricted to the contract's owner"
        );
        _;
    }

    function contributeToPot() public contributorOnly {}

    function updateSponsorName() public onlyContributorOrAdmin {}

    function updateSponsorImage() public onlyContributorOrAdmin {}

    function updateSponsorLink() public onlyContributorOrAdmin {}

    /**
     *  Functions for Recipients
     */

    modifier onlyRecipient() {
        require(
            msg.sender == owner,
            "This function is restricted to the contract's owner"
        );
        _;
    }

    function registerForEvent() public onlyRecipient {}

    function claimWinnings() public onlyRecipient {}

}
