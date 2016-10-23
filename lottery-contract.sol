pragma solidity ^0.4.2;

contract LotteryTicket {
    function transfer(address receiver, uint amount){
        
    }
}

contract Lottery {
    // Address to send fees to
    address feeAddress;
    
    // Defines needed variables
    uint public ticketPrice;
    uint public roundDuration; // saved in seconds
    uint public nextWinnerPickedTime;
    
    // Initialized the prizePool to 0 on contract creation
    uint public prizePool = 0;
    
    // Creates an array that holds the amounts of tickets each address has
    mapping (address => uint256) public totalTicketsOf;
    // Will generate a public even on the blockain to notify
    
    // Called upon creation of contract
    function Lottery (
        address addressToSendFeesTo,
        uint etherCostOfEachTicket, // in ethers
        uint lotteryRoundDurationInSeconds // in seconds
    ) {
        feeAddress = addressToSendFeesTo;
        ticketPrice = etherCostOfEachTicket * 1 ether;
        roundDuration = lotteryRoundDurationInSeconds * 1 seconds;
        nextWinnerPickedTime = now + roundDuration;
    }
    
    // This function without name is called anytime some sends funds to the contract
    function () {
        uint ticketsBought = msg.value*ticketPrice; // will round down = max tickets deposited amount can buy
        totalTicketsOf[msg.sender] = ticketsBought;
        prizePool += ticketsBought*ticketPrice;
        // Send back or keep extra ethers?
    }
    
    modifier afterPickWinnerTime() { 
        if (now >= nextWinnerPickedTime) _; 
    }
    
    function randomNumberBetween(uint min, uint max) returns(uint randomNumber) {
        // Blockhash can only be safely used for a random number if the total amount of value resting on the quality of that randomness is lower than what a miner earns by mining a single block
    }
    
    function pickRandomWinner() afterPickWinnerTime {
        
    }
    
    function payWinner(uint winnerAddress) {
        
    }
    
    function payFees(){
        
    }
    
}
