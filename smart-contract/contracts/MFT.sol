// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

/**
* 엔딩 결과를 바탕으로 NFT를 발행하는 컨트랙트
*
* @author 황승주
*/

contract MFT is ERC721Enumerable {
    using Counters for Counters.Counter;

    // NFT ID(1씩 자동 증가)
    Counters.Counter private _tokenIds;
    // NFT Metadata(IPFS)
    mapping(uint256 => string) private _tokenURIs;

    constructor() ERC721("Dreammungz", "MFT") {}

    /**
    * create
    * 신규 NFT 발급
    * @ param string tokenURI Metadata(IPFS) URI
    * @ return uint256 newTokenId 생성된 NFT 식별자
    */
    function create(
            string memory tokenURI
        ) public returns (uint256) {
        _tokenIds.increment();

        uint256 newTokenId = _tokenIds.current();
        _mint(msg.sender, newTokenId);
        _setTokenURI(newTokenId, tokenURI);

        return newTokenId;
    }

    /**
    * _burn
    * tokenId 및 해당하는 tokenURI 삭제
    * @ param uint256 tokenId NFT 식별자
    * @ return None
    */
    function _burn(uint256 tokenId) internal virtual override {
        super._burn(tokenId);

        if (bytes(_tokenURIs[tokenId]).length != 0) {
            delete _tokenURIs[tokenId];
        }
    }

        function _setTokenURI(
            uint256 tokenId, 
            string memory _tokenURI
        ) internal virtual {
        require(_exists(tokenId), "ERC721URIStorage: URI set of nonexistent token");
        _tokenURIs[tokenId] = _tokenURI;
    }

        function getTokenURI(uint256 tokenId) public view returns (string memory) {
        return _tokenURIs[tokenId];
    }
}