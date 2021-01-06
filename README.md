# SupplyChain_Dapp


This project aims to creat a DApp supply chain solution backed by the Ethereum platform. Designing  smart contracts in order to manage specific user permission controls as well as contracts that track and verify a product’s authenticity.

For this purpose, I used ganache from [trufflesuite](https://www.trufflesuite.com/ganache) easy to used and install. It gives the possibility to deploy a private ethereum network in order to compile, deploy and test smart-contract before production in a safe environement.

###### The developpement and the test were done on a  Ubuntu 20.04.1 LTS -v focal.

## Frontend dapp:
A minimal frontend is provide in order to test all the dapp functionality don't forget to inspect the browser in order to have acces to the console and the logs.



![frontend](https://i.imgur.com/WR0Zw3C.png)


## Architecture dapp:


![image architecture](https://i.imgur.com/KxBaUgC.jpg)


### UML:


![image UML](https://i.imgur.com/u5HagRw.jpg)


## Module used:
 - Truffle v5.1.54
 - node v11.15.0
 - npm v6.7.0
 - truffle-hdwallet-provider
 - web3 v6.7.0
 - browserify v6.7.0
 - ipfs-api v6.7.0
 
### IPFS: 

IPFS stand for InterPlanetary File System, it is a protocol and peer-to-peer network for storing and sharing data in a distributed file system. IPFS uses content-addressing to uniquely identify each file in a global namespace connecting all computing devices.
It was used into this project in order to allow the initial producer(factory) in the supply chain to upload an image of the product along with the UPC hash and store this image using Infura node.


### Browserify:

It was used in order to have the possibility to used require inside the dapp.

```
browserify app.js -o bundle.js
```
you can find more information [here_browserify](https://www.npmjs.com/package/browserify-fs)

## Getting Started

### Prerequisites

### Install Metamsk extension on chrome or in your favorite browser
Please follow the instructions provided by  [Metamask](https://metamask.io/download.html)
Then create a wallet, in order to interact with the dapp.

### Download the project 
Clone the  provide repo or download the zip
```
$ git clone https://github.com/gelhteag/SupplyChain_Dapp.git
```
### spin up the dapp
```
$ cd SupplyChain_Dapp
$ npm i
$ npm run dev
```
### Now the fun begins
When the server is running , you can open your browser and go to http://localhost:3000 or click on the link [dapp](http://localhost:3000)
I deployed the contracts on the testnet Rinkeby so it can already be used.

#### Contracts address  

##### FactoryRole: 0x7Eca3c6FFF526e6610E581485f85dFb03a73594E
##### DistributorRole: 0xF4666685F922E43DBfce8825391E8826fcEafc3f
##### RetailerRole: 0xdc6ECd8de8eD11D5D690d68B539DE0026453d234
##### ConsumerRole: 0x5B1F2073417557d2C025299Aa1e9514C7e34Fe32
##### SupplyChain: 0xaC05Ae227a705F0a34C07adE08057c40F76D5C47

**All the contracts can be found on**  [etherscan](https://rinkeby.etherscan.io/)

