package dreammungz.db.repository;

import dreammungz.db.entity.GameResult;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

/*
@author 황승주
@since 2022. 09. 30.
*/

public interface GameResultRepository extends JpaRepository<GameResult, Long> {
    Optional<GameResult> findById(Long id);
    Optional<GameResult> findByGameId(Long gameId);
}
