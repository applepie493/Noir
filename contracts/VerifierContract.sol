// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// NoirプロジェクトからコンパイルされるVerifier.solをインポート
import "./Verifier.sol";

contract NFTOwnershipVerifier {
    Verifier public verifier;
    
    // 検証結果の記録
    mapping(bytes32 => bool) public verifiedProofs;
    
    constructor(address _verifierAddress) {
        verifier = Verifier(_verifierAddress);
    }
    
    // 証明を検証しステータスを保存
    function verifyOwnership(
        bytes memory proof,
        bytes32[] memory publicInputs
    ) public returns (bool) {
        // 証明ハッシュを計算
        bytes32 proofHash = keccak256(abi.encodePacked(proof, publicInputs));
        
        // 重複検証を防ぐ
        require(!verifiedProofs[proofHash], "Proof already verified");
        
        // Noirが生成した検証関数を呼び出す
        bool isValid = verifier.verify(proof, publicInputs);
        
        if (isValid) {
            verifiedProofs[proofHash] = true;
        }
        
        return isValid;
    }
}