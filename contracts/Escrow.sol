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

    constructor(address _nftAddress, address payable _seller, address _inspector, address _lender) {
     lender = _lender;
     seller = _seller;
     inspector = _inspector;
     nftAddress = _nftAddress;
    }


}
