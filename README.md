# MyERC
## MyERC20.sol contains the smart contract for the ERC20 token 
### Functions and Events implemented
1.function name() public view returns (string)

2.function symbol() public view returns (string)

3.function decimals() public view returns (uint8)

4.function totalSupply() public view returns (uint256)

5.function balanceOf(address _owner) public view returns (uint256 balance)

6.function transfer(address _to, uint256 _value) public returns (bool success)

7.function transferFrom(address _from, address _to, uint256 _value) public returns (bool success)

8.function approve(address _spender, uint256 _value) public returns (bool success)

9.function allowance(address _owner, address _spender) public view returns (uint256 remaining)


event Transfer(address indexed _from, address indexed _to, uint256 _value)

event Approval(address indexed _owner, address indexed _spender, uint256 _value)


## How to use in Remix IDE
1. Create a new smart contract in solidity and paste the MyERC20.sol code in it.
2. Install and Create Workspace in ganache and connect few accounts with your metamask.
3. Compile the contract on your Remix IDE
4. Select the account which you want to make the owner of the contract and then deploy the ownership.sol contract
5. Deploy the LadduCoin.sol (Used a funny name :)) ) and pass the minters address to the constructer(It can be the owners address)
6. Now invoke the functions and test the contract using different accounts.
7. To See the tokens in your metamask , import the tokens using smart contract address.

## Using FrontEnd
1. Pull the repository on your local machine
2. Install some Dependencies - npm install ethers, react as well
3. Run npm start in the terminal
4. After getting directed to the browser, click the "get token info" to get the infomation of the token
5. Connect the Account on your metamask and then click "get balance" button to fetch the balance of the tokens for that account
6. Use the "transfer" button below to transfer the coins from one account to another
7. Below you will be able to see the past transactions



