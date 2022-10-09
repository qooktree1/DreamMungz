package dreammungz.db.repository;

import dreammungz.db.entity.NftStatus;
import dreammungz.db.entity.Selection;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/*
@author 황승주
@since 2022. 09. 07.
*/

public interface SelectionRepository extends JpaRepository<Selection, Long> {
    List<Selection> findAllBySceneId(Long sceneId);

}
