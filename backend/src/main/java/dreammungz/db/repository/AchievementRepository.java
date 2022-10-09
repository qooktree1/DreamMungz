package dreammungz.db.repository;

import dreammungz.db.entity.Achievement;
import dreammungz.db.entity.Job;
import dreammungz.db.entity.Member;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

/*
@author 황승주
@since 2022. 09. 07.
*/

public interface AchievementRepository extends JpaRepository<Achievement, Long> {
    List<Achievement> findByMember(Member member);

    Optional<Achievement> findByMemberAndJob(Member member, Job job);
}
