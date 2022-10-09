package dreammungz.api.service;

/*
@author 박희조
@since 2022. 09. 13.
 */

import dreammungz.api.dto.game.*;
import dreammungz.db.entity.*;
import dreammungz.db.repository.*;
import dreammungz.enums.*;
import dreammungz.exception.CustomException;
import dreammungz.exception.CustomExceptionList;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@Service
@RequiredArgsConstructor
@Transactional
public class GameService{
    final MemberRepository memberRepository;
    final GameRepository gameRepository;
    final GameStatusRepository gameStatusRepository;
    final StatusRepository statusRepository;
    final StoryRepository storyRepository;
    final GameStoryRepository gameStoryRepository;
    final SceneRepository sceneRepository;
    final SelectionRepository selectionRepository;
    final NftRepository nftRepository;
    final NftStatusRepository nftStatusRepository;

    public boolean isNftValid(Long father, Long mother){
        //부모 개체가 유효한 NFT인지 체크
        return nftRepository.existsByTokenId(father)
                && nftRepository.existsByTokenId(mother);
    }
    public boolean isGenderValid(Long father, Long mother){
        //부모의 성별이 유효하게 지정되었는지 체크
        return (nftRepository.findNftByTokenId(father).get().getGender() == Gender.M)
                && (nftRepository.findNftByTokenId(mother).get().getGender() == Gender.F);
    }

    public boolean isNftOwner(Long father, Long mother, String address){
        //부모 개체가 해당 유저의 NFT 소유권인지 체크
        Member member = memberRepository.findByAddress(address).get();
        return nftRepository.findNftByTokenId(father).get().getMember() == member
                && nftRepository.findNftByTokenId(mother).get().getMember() == member;
    }

    public void inherited(GameStartRequest gameStart){
        //[DB] [Game] 생성
        Game game = new Game(null, null);
        game.setCurScene((long) 1); //첫번째 씬을 프롤로그 첫 씬으로 설정
        //주소가 일치하는 멤버가 있는지 먼저 체크하기
        Member member = memberRepository.findByAddress(gameStart.getAddress())
                .orElseThrow(() -> new CustomException(CustomExceptionList.MEMBER_NOT_FOUND));
        //[DB] [Member] Game id 연결
        member.setGame(game);
        //기본 스탯 생성
        List<GameStatus> gameStatuses = new ArrayList<>();
        StatusName[] statusName = StatusName.values();
        for (StatusName name : statusName) {
            gameStatuses.add(new GameStatus((long) 0, game, statusRepository.findByName(name).get()));
        }

        //메이팅인 경우
        if(gameStart.isMating()){
            //[DB] [Game] 부모 정보 입력
            game.setMother(gameStart.getMother());
            game.setFather(gameStart.getFather());
            //[DB] [Nft_Status] 능력치 데이터 읽어오기
            List<NftStatus> parentStatuses = nftStatusRepository.findAllByNftId(nftRepository.findNftByTokenId(game.getFather()).get().getId());
            parentStatuses.addAll(nftStatusRepository.findAllByNftId(nftRepository.findNftByTokenId(game.getMother()).get().getId()));
            for(NftStatus parentStatus : parentStatuses){
                for(GameStatus gameStatus : gameStatuses){
                    if(gameStatus.getStatus().getName().equals(parentStatus.getStatus().getName())){
                        //스탯 합산
                        gameStatus.setValue(parentStatus.getValue() + gameStatus.getValue());
                        break;
                    }
                }
            }
        }
        //[DB] [Game_Status] 생성. 스탯 반영
        gameStatusRepository.saveAll(gameStatuses);
    }

    public void setGameStart(String address){
        //주소가 일치하는 멤버가 있는지 먼저 체크하기
        Member member = memberRepository.findByAddress(address)
                .orElseThrow(() -> new CustomException(CustomExceptionList.MEMBER_NOT_FOUND));
        //[DB] [Member] 게임진행여부(playing) Y로 변경
        member.setPlaying(Check.Y);
        memberRepository.save(member);
    }

    public boolean checkGameStarted(String address){
        //주소가 일치하는 멤버가 있는지 먼저 체크하기
        Member member = memberRepository.findByAddress(address)
                .orElseThrow(() -> new CustomException(CustomExceptionList.MEMBER_NOT_FOUND));
        return member.getPlaying() == Check.Y;
    }

    public void setStory(String address){
        Game game = memberRepository.findByAddress(address).get().getGame();

        List<Story> shortStories = storyRepository.findAllByType(StoryType.SHORT);
        List<Story> normalStories = storyRepository.findAllByType(StoryType.NORMAL);
        List<Story> longStories = storyRepository.findAllByType(StoryType.LONG);

        int shortListCount = shortStories.size();
        int normalListCount = normalStories.size();
        int longListCount = longStories.size();

        //스토리 탐색 수 설정
        final int shortFinalCount = 7;  //단편 수
        final int normalFinalCount = 2; //중편 수
        final int longFinalCount = 1;   //장편 수
        
//        //모든 스토리를 탐색할 수 있게 설정
//        final int shortFinalCount = shortListCount;
//        final int normalFinalCount = normalListCount;
//        final int longFinalCount = longListCount;

        final int storiesSumCount = shortFinalCount + normalFinalCount + longFinalCount;
        final int storiesFinalCount = shortFinalCount + normalFinalCount + longFinalCount + 2;

        //랜덤 1단계. 각 유형별 스토리들을 랜덤으로 뽑아, array에 삽입한다.
        long[] randomStoriesNum = new long[storiesSumCount];

        int index = 0;
        for(int i = index; i<index + shortFinalCount; i++){
            //랜덤함수 뽑기
            Random r = new Random();
            Story tempStory = shortStories.get(r.nextInt(shortListCount));
            randomStoriesNum[i] = tempStory.getId();
            for(int j = index; j<i; j++){
                if(randomStoriesNum[i]==randomStoriesNum[j]){
                    i--;
                }
            }
        }
        index += shortFinalCount;
        for(int i = index; i<index + normalFinalCount; i++){
            //랜덤함수 뽑기
            Random r = new Random();
            Story tempStory = normalStories.get(r.nextInt(normalListCount));
            randomStoriesNum[i] = tempStory.getId();
            for(int j = index; j<i; j++){
                if(randomStoriesNum[i]==randomStoriesNum[j]){
                    i--;
                }
            }
        }
        index += normalFinalCount;
        for(int i = index; i<index + longFinalCount; i++){
            //랜덤함수 뽑기
            Random r = new Random();
            Story tempStory = longStories.get(r.nextInt(longListCount));
            randomStoriesNum[i] = tempStory.getId();
            for(int j = index; j<i; j++){
                if(randomStoriesNum[i]==randomStoriesNum[j]){
                    i--;
                }
            }
        }
        index += longFinalCount;

        //랜덤 2단계. storiesSumCount 크기에 맞춰 번호를 뽑는다.
        int[] tempSequenceNum = new int[storiesSumCount];
        for(int i = 0; i<storiesSumCount; i++){
            //랜덤함수 뽑기
            Random r = new Random();
            tempSequenceNum[i] = r.nextInt(storiesSumCount);
            for(int j = 0; j<i; j++){
                if(tempSequenceNum[i]==tempSequenceNum[j]){
                    i--;
                }
            }
        }

        //랜덤 3단계. 뽑힌 번호를 기준으로 배열을 정리한다.
        long[] selectedStoriesNum = new long[storiesFinalCount];
        for(int i =0; i<storiesSumCount; i++){
            selectedStoriesNum[tempSequenceNum[i]+1] = randomStoriesNum[i];
        }

        //시작과 끝은 정해진 story
        selectedStoriesNum[0] = 1;  //STORY DB의 1번 스토리가 시작 스토리
        selectedStoriesNum[storiesFinalCount-1] = 2;    //STORY DB의 2번 스토리가 엔딩 스토리

        //선택된 스토리들 LIST로 담기
        List<GameStory> selectedGameStories = new ArrayList<>();
        for(long i = 0; i<storiesFinalCount; i++){
            if(i==0){
                selectedGameStories.add(new GameStory(
                        i, State.PROCEEDING, game, storyRepository.findById(selectedStoriesNum[(int) i]).get()));
            }
            else{
                selectedGameStories.add(new GameStory(
                        i, State.INCOMPLETE, game, storyRepository.findById(selectedStoriesNum[(int) i]).get()));
            }
        }
        //[DB] [Game_Story] 스토리 순서대로 입력
        gameStoryRepository.saveAll(selectedGameStories);
    }

    public GameResponse getGameInformation(String address){
        Long sceneId = memberRepository.findByAddress(address).get().getGame().getCurScene();   //현재 씬 번호
        Scene scene = sceneRepository.findById(sceneId).get();  //현재 씬
        Long storyId = scene.getStory().getId();    //현재 스토리 번호
        Story story = storyRepository.findById(storyId).get();  //현재 스토리

        //현재 스토리 제목과 씬 정보
        GameResponse gameResponse = new GameResponse(
                story.getTitle(),
                scene.getContent(),
                scene.getImage(),
                scene.getBgm()
        );

        //선택지 List 받아오기
        List<Selection> dbSelections = selectionRepository.findAllBySceneId(sceneId);
        List<GameSelectionDto> selections = new ArrayList<>();
        for (Selection dbSelection : dbSelections) {
            selections.add(new GameSelectionDto(dbSelection.getId(), dbSelection.getContent()));
        }
        //선택지 내용들 삽입하기
        gameResponse.setSelection(selections);

        //현재 스탯 정보를 DB에서 받아오기
        List<GameStatus> dbStatuses = gameStatusRepository.findAllByGameId(memberRepository.findByAddress(address).get().getGame().getId());
        List<GameStatusDto> outputStatus = new ArrayList<>();
        for(GameStatus status : dbStatuses){
            if(status.getStatus().getName() == StatusName.JUSTICE){
                //정의로움은 별도의 변수로 저장
                gameResponse.setJustice(status.getValue());
            }
            else {
                //이외의 스탯들은 List 형태로 저장
                outputStatus.add(new GameStatusDto(status.getStatus().getName(), status.getValue()));
            }
        }
        //gameResponse에 반영하고 response
        gameResponse.setStatus(outputStatus);
        return gameResponse;
    }

    public List<GameEndingCreditDto> getEndingCreditInformation(String address){
        //멤버의 게임 스토리 데이터를 쭉 불러온다.
        Member member = memberRepository.findByAddress(address).get();
        Game game = member.getGame();

        //결과 데이터 저장용
        List<GameEndingCreditDto> gameEndingCreditDtos = new ArrayList<>();
        List<GameStory> gameStories = gameStoryRepository.findAllByGameId(game.getId());
        for(GameStory gameStory : gameStories){
            //목록 중에 시작과 엔딩은 제외하고 추가한다.
            if(gameStory.getSequence() !=0 && gameStory.getSequence() !=11) {
                String image = null;
                if(gameStory.getStory().getImage() != null){
                    image = gameStory.getStory().getImage();
                }
                gameEndingCreditDtos.add(new GameEndingCreditDto(gameStory.getSequence(), image, gameStory.getStory().getTitle()));
            }
        }
        return gameEndingCreditDtos;
    }
    public void setNextGame(GameSelectRequest gameInfo) {
        //현재 유저의 게임, 스토리, 씬, 선택지 확인
        Game currentGame = memberRepository.findByAddress(gameInfo.getAddress()).get().getGame();
        Selection currentSelection = selectionRepository.findById(gameInfo.getSelection()).get();
        //선택지의 스탯 변경여부 확인
        if(currentSelection.getStatus() != null){
         //스탯 변경된다면, 스탯 변경하기
            //무슨 스탯인지 찾기
            StatusName statusName = currentSelection.getStatus().getName();
            //값이 얼마나 바뀌는지 확인하기
            long value = currentSelection.getStatusValue();
            //gameStatus에서 해당 스탯 찾아서 변경하기
            List<GameStatus> gameStatuses = gameStatusRepository.findAllByGameId(currentGame.getId());
            for(GameStatus gameStatus : gameStatuses){
                if(gameStatus.getStatus().getName() == statusName){
                    gameStatus.setValue(gameStatus.getValue() + value);
                    gameStatusRepository.save(gameStatus);
                    break;
                }
            }
        }
        //선택지의 다음 씬 체크
        if(currentSelection.getNextScene() != null){
            //다음 씬이 있다면, 그 씬으로 이동
            currentGame.setCurScene(currentSelection.getNextScene());
        }
        else {
            //다음 씬이 없다면, 다음 스토리로 이동
            //현재 스토리 PROCEEDING에서 COMPLETE로 변경
            List<GameStory> gameStories = gameStoryRepository.findAllByGameId(currentGame.getId());
            long totalSequence = gameStories.size();
            long currentSequence = -1;
            for(GameStory gameStory : gameStories){
                if(gameStory.getState() == State.PROCEEDING){
                    gameStory.setState(State.COMPLETE);
                    currentSequence = gameStory.getSequence();
                }
            }
            //모든 스토리가 끝남
            if(totalSequence==currentSequence){
                //사실 끝날 일은 없다. (마지막 엔딩 스토리에서는 이곳으로 접근을 안하기 때문)
            }
            else{
                currentSequence++;
                //다음 스토리 찾아서 PROCEEDING으로 처리
                gameStories.get((int) currentSequence).setState(State.PROCEEDING);
                //첫 씬으로 이동
                currentGame.setCurScene(gameStories.get((int) currentSequence).getStory().getFirstScene());
            }
        }
    }
}