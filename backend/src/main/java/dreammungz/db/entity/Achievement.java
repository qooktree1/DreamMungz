package dreammungz.db.entity;

import dreammungz.enums.Check;
import dreammungz.enums.Tier;
import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.DynamicUpdate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import java.time.LocalDateTime;

/*
@author 황승주
@since 2022. 09. 07.
*/

@NoArgsConstructor(access = AccessLevel.PROTECTED)
@DynamicUpdate
@Entity
@Getter
@Table(name = "achievement")
@EntityListeners(AuditingEntityListener.class)
public class Achievement {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "achievement_id")
    private Long id;

    @Enumerated(EnumType.STRING)
    @Column(name = "tier")
    private Tier tier;

    @Enumerated(EnumType.STRING)
    @Column(name = "achieve", nullable = false)
    private Check achieve;

    @Column(name = "achieve_date")
    private LocalDateTime achieveDate;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "member_id", nullable = false)
    private Member member;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "job_id", nullable = false)
    private Job job;

    @Builder
    public Achievement(Check achieve, Member member, Job job) {
        this.achieve = achieve;
        this.member = member;
        this.job = job;
    }

    public void setTier(Tier tier) {
        this.tier = tier;
    }

    public void setAchieve(Check achieve) {
        this.achieve = achieve;
    }

    public void setAchieveDate(LocalDateTime achieveDate) {
        this.achieveDate = achieveDate;
    }
}
