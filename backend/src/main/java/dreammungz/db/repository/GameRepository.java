package dreammungz.db.repository;

import dreammungz.db.entity.Game;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

/*
@author 황승주
@since 2022. 09. 07.
*/

public interface GameRepository extends JpaRepository<Game, Long> {
    Optional<Game> findById(Long id);
}
