package dreammungz.db.repository;

import dreammungz.db.entity.Job;
import dreammungz.enums.JobName;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

/*
@author 황승주
@since 2022. 09. 07.
*/

public interface JobRepository extends JpaRepository<Job, Long> {
    /*
    @author 신슬기
    @since 2022. 09. 20.
    */
    Optional<Job> findById(Long id);
    Optional<Job> findByName(JobName name);
}
