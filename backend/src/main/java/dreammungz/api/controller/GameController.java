package dreammungz.api.controller;

/*
@author 박희조
@since 22. 09. 13.
 */

import dreammungz.api.dto.game.*;
import dreammungz.api.service.AuthService;
import dreammungz.api.service.GameService;
import dreammungz.exception.CustomException;
import dreammungz.exception.CustomExceptionList;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/game")
public class GameController{

    final GameService gameService;
    final AuthService authService;
    @ApiOperation(value = "게임 페이지 불러오기", notes = "현재 진행중인 게임 페이지를 Response한다.")
    @GetMapping("/info/{address}")
    public ResponseEntity<GameResponse> gameInfo(
            @ApiParam(value = "지갑 주소", required = true) @PathVariable String address){
        /*
        게임 정보 프로세스
        1. 게임중인 회원이라면, 현재 페이지 출력
        2. 게임중이 아니라면, null 출력
         */
        GameResponse gameResponse = new GameResponse();
        if(!authService.getMemberExists(address)){
            //Exception. Member 테이블에 사용자 주소가 없다면 사용자 존재하지 않는다는 예외처리
            throw new CustomException(CustomExceptionList.MEMBER_NOT_FOUND);
        }
        //게임중인 사용자라면 현재 게임 페이지 정보를 출력한다.
        if(gameService.checkGameStarted(address)){
            gameResponse = gameService.getGameInformation(address);
        }
        //게임 정보들을 리턴
        return new ResponseEntity<>(gameResponse, HttpStatus.OK);
    }
    @ApiOperation(value = "게임 진행하기(선택지 선택)", notes = "현재 진행중인 게임 선택지를 선택하고, 다음 페이지를 Response한다.")
    @PostMapping("/select")
    public ResponseEntity<GameResponse> gameSelect(
            @RequestBody @ApiParam(value = "사용자 주소와 선택 번호", required = true) GameSelectRequest gameSelect){
        //선택지에 따라 다음 씬으로 DB를 갱신
        gameService.setNextGame(gameSelect);
        GameResponse gameResponse = gameService.getGameInformation(gameSelect.getAddress());

        //게임 정보들을 리턴
        return new ResponseEntity<>(gameResponse, HttpStatus.OK);
    }
    @ApiOperation(value = "게임 시작", notes = "게임을 시작하는 단계. 모든 초기 설정들이 이루어지고, 게임이 시작된다.")
    @PostMapping("/start")
    public ResponseEntity<GameResponse> gameStart(
            @RequestBody @ApiParam(value = "게임 시작 정보 (메이팅 or 분양)", required = true) GameStartRequest gameStart){
        /*
        게임 시작 4단계 프로세스
        0. 게임 진행 여부 확인
        1. 스탯 선정 (메이팅 or 분양)
        2. 기타 초기 설정
        3. 스토리 선정
        => front에 전송
         */

        //0. 게임 진행 여부 확인 : 이미 게임을 진행하고 있는 유저라면 게임 새롭게 시작을 할 수 없다.
//        if(gameService.checkGameStarted(gameStart.getAddress())){
//            throw new CustomException(CustomExceptionList.MEMBER_IS_GAMING);
//        }

        //1. 스탯 설정 : 교배를 통한 게임 시작인지, 분양을 통한 게임 시작인지 확인하기 (DB에 저장)
        if(gameStart.isMating()){
            //교배 조건1. 해당 개체가 유효한 개체인가?
            if(!gameService.isNftValid(gameStart.getMother(), gameStart.getFather())){
                //throw : 부모 개체가 유효하지 않습니다.
                throw new CustomException(CustomExceptionList.MATING_PARENT_NOT_VALID);
            }
            //교배 조건2. 메이팅의 성별이 유효한가? (남-father, 여-mother)
            if(!gameService.isGenderValid(gameStart.getFather(), gameStart.getMother())){
                //throw : 부모 개체의 성별이 유효하지 않습니다.
                throw new CustomException(CustomExceptionList.MATING_PARENT_GENDER_NOT_CORRECT);
            }
            //교배 조건3. 부모 개체가 둘 다 본인 소유인가?
            if(!gameService.isNftOwner(gameStart.getFather(), gameStart.getMother(), gameStart.getAddress())){
                //throw : 부모 개체의 소유자가 아닙니다.
                throw new CustomException(CustomExceptionList.MATING_PARENT_NOT_OWNER);
            }
        }
        //메이팅 조건이 모두 일치하거나, 분양인 경우에만 실행
        gameService.inherited(gameStart);

        //2. 기타 초기 설정 (게임 진행 여부 Y로 변경)
        gameService.setGameStart(gameStart.getAddress());

        //3. 게임 스토리 선정
        gameService.setStory(gameStart.getAddress());

        return new ResponseEntity<>(HttpStatus.OK);
    }

    @ApiOperation(value = "게임 엔딩 크레딧", notes = "엔딩 크레딧에 보여지는 스토리 제목과 사진들을 Response한다.")
    @PostMapping("/endingCredit")
    public ResponseEntity<List<GameEndingCreditDto>> gameEndingCredit(
            @RequestBody @ApiParam(value = "사용자 주소", required = true) GameEndingCreditRequest gameEndingCreditRequest){
        //해당 주소의 진행중인 스토리 정보들을 불러온다.
        List<GameEndingCreditDto> gameEndingCreditDtos = gameService.getEndingCreditInformation(gameEndingCreditRequest.getAddress());

        //게임 정보들을 리턴
        return new ResponseEntity<>(gameEndingCreditDtos, HttpStatus.OK);
    }
}