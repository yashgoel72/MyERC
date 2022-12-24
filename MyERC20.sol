pragma solidity ^0.8.0;

interface ERC20{
    function totalSupply() external view returns (uint);

    function balanceOf(address account) external view returns (uint);

    function transfer(address recipient, uint amount) external returns (bool);

    function allowance(address owner, address spender) external view returns (uint);

    function approve(address spender, uint amount) external returns (bool);

    function transferFrom(address sender, address recipient, uint amount) external returns (bool);

    event Transfer(address indexed from, address indexed to, uint value);  // indexed keyword relevant for logged events to search
    event Approval(address indexed owner, address indexed spender, uint value);
}

contract ownership{
    address contractOwner;
    address newOwner;
    event ownerChanged(address indexed oldOwner, address indexed newOwner);

    constructor() public{
        contractOwner = msg.sender;
    }

    function changeOwner(address _newowner) public{
        require(msg.sender == contractOwner , "Only Owner can execute this function");
        newOwner = _newowner;
    }

    function acceptOwnership() public{
        require(msg.sender == newOwner , "Only NewOwner can execute this");
        emit ownerChanged(contractOwner , newOwner);
        contractOwner = newOwner;
    }

}

contract LadduCoin is ERC20, ownership{

    string _name;
    string _symbol;
    uint _decimals;
    address minter;
    uint _totalSupply;

    mapping(address => uint) private balance;
    mapping(address => mapping( address => uint)) private allowed;

    constructor(address _minter ){
        _name = "Laddu Coin";
        _symbol =  "LDC";
        _decimals = 0;
        _totalSupply = 10000000;
        minter = _minter;
        balance[minter] = 10000000;

    }

    function coinName() public view returns(string memory){
        return _name;

    }
    function symbol() public view returns(string memory){
        return _symbol;
    }
    function decimals() public view returns(uint){
        return _decimals;
    }
    function totalSupply() public view returns(uint){
        return _totalSupply;
    }

    function balanceOf(address account) public view returns (uint){
        return balance[account];
    }

    function transfer(address recipient, uint amount) public returns (bool){
        require( balance[msg.sender] >= amount , "Insufficient Balance");
        balance[msg.sender] -= amount;
        balance[recipient] += amount;
        emit Transfer(msg.sender , recipient , amount);
        return true;
    }

    function allowance(address owner, address spender) public view returns (uint){
        return allowed[owner][spender];
    }

    function approve(address spender, uint amount) public returns (bool){
        require(balance[msg.sender] >= amount , "insufficient Balance");
        allowed[msg.sender][spender] = amount;
        emit Approval(msg.sender , spender , amount);
        return true;
    }

    function transferFrom(address sender, address recipient, uint amount) public returns (bool){
        uint allowedSpending = allowance(sender, msg.sender);
        require(allowedSpending >= amount , "Not allowed to spend");
        require(balance[sender] >= amount , "Insufficient balance in senders account");
        balance[sender] -= amount;
        balance[recipient] += amount;
        emit Transfer(sender , recipient , amount);
        allowed[sender][msg.sender] -= amount;
        return true;
    }
}
