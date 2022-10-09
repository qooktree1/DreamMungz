package dreammungz.api.service;

import dreammungz.api.dto.auth.AuthResponse;
import dreammungz.api.dto.auth.NicknameRequest;
import dreammungz.api.dto.auth.NicknameResponse;
import dreammungz.db.entity.Achievement;
import dreammungz.db.entity.Member;
import dreammungz.db.repository.AchievementRepository;
import dreammungz.db.repository.JobRepository;
import dreammungz.db.repository.MemberRepository;
import dreammungz.enums.Check;
import dreammungz.enums.JobName;
import dreammungz.exception.CustomException;
import dreammungz.exception.CustomExceptionList;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.web3j.crypto.Keys;
import org.web3j.crypto.Sign;
import org.web3j.utils.Numeric;

import javax.transaction.Transactional;
import java.security.SignatureException;

/*
@author 황승주
@since 2022. 09. 11.
*/

@Service
@RequiredArgsConstructor
@Transactional
public class AuthService {
    final MemberRepository memberRepository;
    final JobRepository jobRepository;
    final AchievementRepository achievementRepository;

    public Boolean getMemberExists(String address) {
        return memberRepository.existsByAddress(address);
    }

    public AuthResponse getMemberNonce(String address) {
        AuthResponse authResponse = new AuthResponse();
        Member member = memberRepository.findByAddress(address)
                .orElseThrow(() -> new CustomException(CustomExceptionList.MEMBER_NOT_FOUND));

        authResponse.setAddress(member.getAddress());
        authResponse.setNonce(member.getNonce().toString());

        return authResponse;
    }

    public AuthResponse memberSignIn(String address) {
        Member member = Member.builder()
                .address(address)
                .build();

        memberRepository.save(member);

        AuthResponse authResponse = new AuthResponse();

        authResponse.setAddress(member.getAddress());
        authResponse.setNonce(member.getNonce().toString());
        return authResponse;
    }

    public boolean verifySignature(String address, String signature) throws SignatureException {
        Member member = memberRepository.findByAddress(address)
                .orElseThrow(() -> new CustomException(CustomExceptionList.MEMBER_NOT_FOUND));

        String nonce = member.getNonce().toString();

        String decryptedAddress = getAddressUsedToSignHashedPrefixedMessage(signature, nonce);
        decryptedAddress = "0x" + decryptedAddress;

        return address.equalsIgnoreCase(decryptedAddress);
    }

    private static String getAddressUsedToSignHashedPrefixedMessage(String signature, String nonce) throws SignatureException {
        String r = signature.substring(0, 66);
        String s = "0x" + signature.substring(66, 130);
        String v = "0x" + signature.substring(130, 132);

        String publicKey = Sign.signedPrefixedMessageToKey(
                        nonce.getBytes(),
                        new Sign.SignatureData(
                                Numeric.hexStringToByteArray(v)[0],
                                Numeric.hexStringToByteArray(r),
                                Numeric.hexStringToByteArray(s))
                )
                .toString(16);

        return Keys.getAddress(publicKey);
    }

    public void changeNonce(String address) {
        Member member = memberRepository.findByAddress(address)
                .orElseThrow(() -> new CustomException(CustomExceptionList.MEMBER_NOT_FOUND));

        member.createNonce();
    }

    public NicknameResponse getMemberNickname(String address) {
        NicknameResponse nicknameResponse = new NicknameResponse();
        Member member = memberRepository.findByAddress(address)
                .orElseThrow(() -> new CustomException(CustomExceptionList.MEMBER_NOT_FOUND));
        nicknameResponse.setNickname(member.getNickname());
        return nicknameResponse;
    }

    public void changeNickname(NicknameRequest nicknameRequest){
        //주소를 기반으로 멤버를 찾고
        Member member = memberRepository.findByAddress(nicknameRequest.getAddress()).get();
        //변경할 닉네임을 설정
        member.setNickname(nicknameRequest.getNickname());
        //DB에 반영
        memberRepository.save(member);
    }

    public void setAchievement(String address){
        //주소를 기반으로 멤버 찾기
        Member member = memberRepository.findByAddress(address)
                .orElseThrow(() -> new CustomException(CustomExceptionList.MEMBER_NOT_FOUND));
        JobName [] jobNames = JobName.values();
        for(int idx=0;idx<jobNames.length;idx++){ //모든 직업에 대해 업적 리스트 추가
            Achievement achievement = new Achievement(Check.N,member, jobRepository.findByName(jobNames[idx]).get());
            achievementRepository.save(achievement);
        }
    }
}
