pragma solidity ^0.4.2;

contract Voting{

//Variables
//mapping is a dictionary
//mapping(key => value)
//Creando una variable 
mapping(bytes32 => uint8) public votesReceived; 
// Jorge => 4, Carol =>10

//['Carol','Jorge','Tensin','Heleno']

bytes32[] public candidateList;

//Constructor

constructor(bytes32[] candidateNames) public{
	
	candidateList = candidateNames;

}
//Métodos 

//para validar un candidato

function validCandidate (bytes32 candidate) view public returns (bool) {
	//No hacer for porque cada transacción cuesta ETH
	for(uint i=0;i<candidateList.length;i++){
		if(candidateList[i] == candidate){
			return true;
		}
	}

	return false;
}


//para votar por candidato

function voteforCandidate(bytes32 candidate) public {
	//Para validarel canditato
	require(validCandidate(candidate));
	votesReceived[candidate] += 1;
}

//para consultar el total de votos de un candidato
//view para que no se modifique, solo para que podamos ver
function totalVotesFor(bytes32 candidate) view public returns(uint8) {

	require (validCandidate(candidate));
	return votesReceived[candidate];
}

}