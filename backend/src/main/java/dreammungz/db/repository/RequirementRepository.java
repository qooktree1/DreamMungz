package dreammungz.db.repository;

import dreammungz.db.entity.Job;
import dreammungz.db.entity.Requirement;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/*
@author 황승주
@since 2022. 09. 07.
*/

public interface RequirementRepository extends JpaRepository<Requirement, Long>{
    /*
    @author 신슬기
    @since 2022. 09. 18.
    */
    List<Requirement> findRequirementByJob(Job job);
}
