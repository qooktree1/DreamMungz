package dreammungz.db.repository;

import dreammungz.db.entity.Game;
import dreammungz.db.entity.GameStatus;
import dreammungz.db.entity.Status;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;


/*
@author 황승주
@since 2022. 09. 07.
*/

public interface GameStatusRepository extends JpaRepository<GameStatus, Long> {
 
    List<GameStatus> findGameStatusByGame(Game game);
    Optional<GameStatus> findGameStatusByGameAndStatus(Game game, Status status);
    List<GameStatus> findAllByGameId(Long gameId);

}
