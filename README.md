# Crypto-Giveaway-Wheel-Smart-Contracts

These repo holds the Solidity solidity smart contract code for the CryptoGiveawayWheel project!

<br/>

## Usage

We recommed the node v14 in .nvmrc file:

```
nvm use
```

Install truffle:
```
npm i truffle -g
```

Install project dependencies:
```
npm i
```

Run unit tests:
```
npm test
```

Run on local blockchain:
```
truffle develop
```

Deploy:
```
truffle deploy
```


<br/>

## Core Functions

#### Admin Functionality - Only allowed to be called by the owner address (group organizer).

  - **Start Event** - Allows participants to register and sponsor to make contribution.

  - **Spin Wheel** - After this is called, participants can no longer register and sponsors can no longer contribute. A grand prize winner is randomly selected. Participants can then claim their winnings.

  - **End Event** - After this is called, participants can no longer claim winnings. Any unclaimed winnings are transferred to the dev wallet.

  - **Update Sponsor Address** - This is called with a new wallet address to be stored as the "sponsor address". Only the designated sponsor address can make contributions.

  - **Update Registered Recipient** - Allows the admins to create, edit, or remove unrecognized users from the list of recipients.


<br/>

#### Sponsor Functionality - Only allowed to be called by the designated sponsors.

  - **Start Event** - Allows participants to register and sponsor to make contribution.

  - **Spin Wheel** - After this is called, participants can no longer register and sponsors can no longer contribute. A grand prize winner is randomly selected. Participants can then claim their winnings.

  - **End Event** - After this is called, participants can no longer claim winnings. Any unclaimed winnings are transferred to the dev wallet.

<br/>

#### Participant Functionality - Called from the participant users who are entiering to win crypto.

  - **Register** - Once the user registers, he or she will win either the grand prize or participation prize after the wheel is spun.

  - **Claim Winnings** - After this is called, participants can no longer claim winnings. Any unclaimed winnings are transferred to the dev wallet.

<br/>
<br/>


For more info on this project, please see these other repos:
 - [The Crypto Giveaway Wheel Overview](https://github.com/TDD-Solidity/Crypto-Giveaway-Wheel).
 - [The Crypto Giveaway Wheel Whitepaper (Draft)](https://github.com/TDD-Solidity/Crypto-Giveaway-Wheel-White-Paper).
 - [The Crypto Giveaway Wheel Web Frontend](https://github.com/TDD-Solidity/Crypto-Giveaway-Wheel-Web-Frontend).
