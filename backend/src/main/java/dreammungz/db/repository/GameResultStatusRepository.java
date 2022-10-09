package dreammungz.db.repository;

import dreammungz.db.entity.GameResultStatus;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/*
@author 황승주
@since 2022. 09. 30.
*/

public interface GameResultStatusRepository extends JpaRepository<GameResultStatus, Long> {
    List<GameResultStatus> findAllByGameResultId(Long gameResultId);
}
