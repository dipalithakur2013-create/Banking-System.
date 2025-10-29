contract DecentralizedBank {

    // Mapping to store each user's balance
    mapping(address => uint) public balances;

    // Events for transparency — every deposit and withdrawal is recorded
    event Deposit(address indexed user, uint amount);
    event Withdraw(address indexed user, uint amount);

    // Deposit function (users send Ether to bank)
    function deposit() public payable {
        require(msg.value > 0, "Amount must be greater than 0");
        balances[msg.sender] += msg.value;
        emit Deposit(msg.sender, msg.value);  // record event
    }

    // Withdraw function (users can withdraw their balance)
    function withdraw(uint _amount) public {
        require(balances[msg.sender] >= _amount, "Insufficient balance");
        balances[msg.sender] -= _amount;
        payable(msg.sender).transfer(_amount);
        emit Withdraw(msg.sender, _amount);  // record event
    }

    // View your balance
    function checkBalance() public view returns (uint) {
        return balances[msg.sender];
    }
}
