pragma solidity ^0.8.0;

contract Bullish {
    mapping(address => uint) public balances;
    mapping(address => mapping(address => uint)) public allowance;
    uint public totalsupply = 1000000000000000;
    string public name = "BullishToken";
    string public symbol = "Bullish";
    uint public decimals = 18;
    
    
    event Transfer(address indexed from, address indexed to, uint value);
    event Approval(address indexed owner, address indexed spender, uint value);
    
    constructor() {
        balances[msg.sender] = totalsupply;
    }
    
    function balanceOf(address owner) public view returns(uint){
        return balances[owner];
    }
    
    function transfer(address to, uint value) public returns(bool){
        require(balanceOf(msg.sender) >= value, 'Your Bullish Value is too low');
        balances[to] += value;
        balances[msg.sender] -= value;
        emit Transfer(msg.sender, to, value);
        return true;
    }
    
    function transferFrom(address from, address to, uint value) public returns(bool){
        require(balanceOf(from) >= value, 'Balance too Low');
        require(allowance[from][msg.sender] >= value, 'Allowance too low');
        balances[to] += value;
        balances[from] -= value;
        return true;
    }
    
    function approve(address spender, uint value) public returns(bool){
        allowance[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        return true;
    }
}
