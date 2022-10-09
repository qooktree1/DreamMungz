package dreammungz.db.repository;

import dreammungz.db.entity.GameStory;
import dreammungz.db.entity.Story;
import dreammungz.enums.StoryType;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/*
@author 황승주
@since 2022. 09. 10.
*/

public interface GameStoryRepository extends JpaRepository<GameStory, Long> {
    //gameid가 같은 스토리들에서 proceeding인 것을 찾기
    List<GameStory> findAllByGameId(Long gameId);

}
