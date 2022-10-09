package dreammungz.db.repository;

import dreammungz.db.entity.Member;
import dreammungz.db.entity.Status;
import dreammungz.enums.StatusName;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

/*
@author 황승주
@since 2022. 09. 07.
*/

public interface StatusRepository extends JpaRepository<Status, Long> {

    Optional<Status> findById(Long id);
    Optional<Status> findByName(StatusName statusName);

}
