//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

interface IERC721 {
    function transferFrom(
        address _from,
        address _to,
        uint256 _id
    ) external;
}

contract Escrow {
    address public lender;
    address public inspector;
    address public nftAddress;
    address payable public seller;

    modifier onlySeller() {
        require(msg.sender == seller, "Only seller can call this method");
        _;
    }

    mapping (uint256 => bool) public isListed;
    mapping (uint256 => uint256) public purchasePrice;
    mapping (uint256 => uint256) public escrowAmount;
    mapping (uint256 => address) public buyer;

    constructor(
        address _nftAddress, 
        address payable _seller, 
        address _inspector, 
        address _lender) {
     lender = _lender;
     seller = _seller;
     inspector = _inspector;
     nftAddress = _nftAddress;
    }

    // Removes NFT from users wallet and places it in escrow
    function list(
        uint256 _nftID, 
        uint256 _purchasePrice, 
        address _buyer, 
        uint256 _escrowAmount) public {
        IERC721(nftAddress).transferFrom(msg.sender, address(this), _nftID);

        isListed[_nftID] = true;
        purchasePrice[_nftID] = _purchasePrice;
        escrowAmount[_nftID] = _escrowAmount;
        buyer[_nftID] = _buyer;
    }


}
