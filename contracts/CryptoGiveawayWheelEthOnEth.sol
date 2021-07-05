// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

//  First iteration of the Crypto Giveaway Wheel!
//
//  Although we plan to support "all the things", this first version is only
//  meant for giving away ether on the ethereum network.

contract CryptoGiveawayWheelEthOnEth {
    
    address public owner = msg.sender;

    address devWalletAddress = "0x123123123123123123123123123123";

    address sponsorAddress;
    string sponsorName;
    string sponsorImage;
    string sponsorLink;

    bool registrationPhaseOpen = false;
    bool claimWinningsPhaseOpen = false;

    address[] participantAddresses;

    address[] addressesRegisteredForEvent;

    mapping(address => string) participantNames;

    mapping(address => bool) participantRegistered;

    mapping(address => uint256) participantWinnings;

    constructor() public {}

    /**
     *  Functions for Admins
     */

    modifier adminOnly() {
        require(msg.sender == owner, "This function is restricted to admin");
        _;
    }

    function startEvent() public adminOnly {
        registrationPhaseOpen = true;

        // warning: unbounded for loop is kind of an anti-pattern...

        for (uint256 i = 0; i < addressesRegisteredForEvent.length; i++) {
            delete participantWinnings[participantAddresses[i]];
            delete participantRegistered[participantAddresses[i]];
        }

        delete addressesRegisteredForEvent;

        delete sponsorAddress;
        delete sponsorName;
        delete sponsorImage;
        delete sponsorLink;
    }

    function spinWheel() public adminOnly {
        registrationPhaseOpen = false;

        // TODO - use chainlink (or something similar) to randomly select a winner.

        // TODO - use OpenZeppelin's "PaymentSplitter" to split eth...

        claimWinningsPhaseOpen = true;
    }

    function endEvent() public adminOnly {
        claimWinningsPhaseOpen = false;

        // TODO - send remaining crypto / NFTs in contract to dev wallet.
    }

    function updateSponsorAddress(address newSponsorAddress) public adminOnly {
        sponsorAddress = newSponsorAddress;
    }

    function updateRegisteredRecipient(
        address participantAddress,
        string memory participantName
    ) public adminOnly {
        participantNames[participantAddress] = participantName;
        participantAddresses.push(participantAddress);
    }

    /**
     *  Functions for Contributor(s)
     */

    modifier contributorOnly() {
        require(
            msg.sender == sponsorAddress,
            "This function is restricted to contributors"
        );
        _;
    }

    modifier onlyContributorOrAdmin() {
        require(
            msg.sender == owner || msg.sender == sponsorAddress,
            "This function is restricted to contributors or admin"
        );
        _;
    }

    function contributeToPot() public contributorOnly {
        // TODO send eth to dev wallet
    }

    function updateSponsorName(string memory newName) public onlyContributorOrAdmin {
        sponsorName = newName;
    }

    function updateSponsorImage(string memory newImage) public onlyContributorOrAdmin {
        sponsorImage = newImage;
    }

    function updateSponsorLink(string memory newLink) public onlyContributorOrAdmin {
        sponsorLink = newLink;
    }

    /**
     *  Functions for Recipients
     */

    modifier onlyRecipient() {
        require(
            msg.sender != owner && msg.sender != sponsorAddress,
            "This function is restricted to recipients"
        );
        _;
    }

    modifier isRegistered() {
        require(
            participantRegistered[msg.sender] == true,
            "This function is restricted to recipients"
        );
        _;
    }

    modifier isRecognizedRecipient() {
        require(
            participantNames[msg.sender],
            "This function is restricted to recognized participants"
        );
        _;
    }

    modifier registrationIsOpen() {
        require(
            registrationPhaseOpen === true,
            "This function can only be called when registration is open"
        );
        _;
    }

    modifier claimWinningsIsOpen() {
        require(
            registrationPhaseOpen === true,
            "This function can only be called when winnings claiming phase is open"
        );
        _;
    }

    function registerForEvent() public onlyRecipient registrationIsOpen isRegistered isRecognizedRecipient {
        participantRegistered[msg.sender] = true;
        addressesRegisteredForEvent.push(msg.sender);
    }

    function claimWinnings() public onlyRecipient claimWinningsIsOpen  {

        // TODO - pull payment

    }

}
