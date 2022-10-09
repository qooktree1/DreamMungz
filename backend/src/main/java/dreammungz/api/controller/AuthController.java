package dreammungz.api.controller;

import dreammungz.api.dto.auth.*;
import dreammungz.api.service.AuthService;
import dreammungz.config.jwt.JwtService;
import dreammungz.exception.CustomException;
import dreammungz.exception.CustomExceptionList;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.security.SignatureException;

/*
@author 황승주
@since 2022. 09. 11.
*/

@RestController
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/auth")
public class AuthController {
    final AuthService authService;
    final JwtService jwtService;

    @ApiOperation(value = "nonce 조회", notes = "지갑 주소로 회원의 nonce를 조회한다.", response = AuthResponse.class)
    @GetMapping("/info/{address}")
    public ResponseEntity<AuthResponse> memberNonce(
            @ApiParam(value = "지갑 주소")
            @PathVariable(value = "address")
            String address) {
        AuthResponse authResponse = authService.getMemberNonce(address);
        return new ResponseEntity<>(authResponse, HttpStatus.OK);
    }

    @ApiOperation(value = "주소 중복 조회", notes = "지갑 주소로 회원 중복여부를 조회한다.", response = AuthResponse.class)
    @GetMapping("/duplicated/{address}")
    public ResponseEntity<Boolean> memberDuplicated(
            @ApiParam(value = "지갑 주소")
            @PathVariable(value = "address")
            String address) {
        return new ResponseEntity<>(authService.getMemberExists(address), HttpStatus.OK);
    }

    @ApiOperation(value = "회원 가입", notes = "지갑 주소로 가입하고 nonce를 조회한다.", response = AuthResponse.class)
    @PostMapping("/signin")
    public ResponseEntity<AuthResponse> memberSignIn(
            @ApiParam(value = "지갑 주소")
            @RequestBody SigninRequest signinRequest){
        if (authService.getMemberExists(signinRequest.getAddress())) {
            throw new CustomException(CustomExceptionList.ADDRESS_DUPLICATED);
        }
        AuthResponse authResponse = authService.memberSignIn(signinRequest.getAddress());
        authService.setAchievement(signinRequest.getAddress()); //회원가입시 업적리스트 추가
        return new ResponseEntity<>(authResponse, HttpStatus.OK);
    }

    @ApiOperation(value = "서명 인증", notes = "metamask에서 받은 서명으로 로그인 한다.", response = JwtResponse.class)
    @PostMapping("/signature")
    public ResponseEntity<JwtResponse> signatureAuthentication(
            @RequestBody SignatureRequest signatureRequest) throws SignatureException {
        String address = signatureRequest.getAddress();
        String signature = signatureRequest.getSignature();

        boolean verified = authService.verifySignature(address, signature);

        if (verified) {
            JwtResponse jwtResponse = new JwtResponse();

            String token = jwtService.generateToken(address).getAccessToken();
            String expiration = jwtService.dateToString(token);

            jwtResponse.setToken(token);
            jwtResponse.setExpiration(expiration);

            authService.changeNonce(address);

            return new ResponseEntity<>(jwtResponse, HttpStatus.OK);
        } else {
            throw new CustomException(CustomExceptionList.SIGNATURE_INVALID);
        }
    }

    @ApiOperation(value = "닉네임 조회", notes = "지갑 주소로 회원의 닉네임을 조회한다.")
    @GetMapping("/info/nickname/{address}")
    public ResponseEntity<NicknameResponse> memberNickname(
            @ApiParam(value = "지갑 주소")
            @PathVariable(value = "address")
            String address) {
        NicknameResponse response = authService.getMemberNickname(address);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @ApiOperation(value = "닉네임 변경", notes = "지갑 주소와 닉네임으로 회원의 닉네임을 변경한다.")
    @PutMapping("/info/nickname/change/{address}")
    public ResponseEntity<NicknameRequest> changeNickname(
            @ApiParam(value = "지갑 주소")
            @PathVariable(value = "address")
            String address,
            @RequestBody NicknameRequest nicknameRequest) {
        authService.changeNickname(nicknameRequest);
        return new ResponseEntity<>(HttpStatus.OK);
    }
}
