package dreammungz.db.entity;

import dreammungz.enums.*;
import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;

/*
@author 황승주
@since 2022. 09. 30.
*/

@NoArgsConstructor(access = AccessLevel.PROTECTED)
@DynamicUpdate
@Entity
@Getter
@Table(name = "game_result")
public class GameResult {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "game_result_id")
    private Long id;

    @Enumerated(EnumType.STRING)
    @Column(name = "hair", nullable = false)
    private Hair hair;

    @Enumerated(EnumType.STRING)
    @Column(name = "face", nullable = false)
    private Face face;

    @Enumerated(EnumType.STRING)
    @Column(name = "gender", nullable = false)
    private Gender gender;

    @Enumerated(EnumType.STRING)
    @Column(name = "color", nullable = false)
    private Color color;

    @Enumerated(EnumType.STRING)
    @Column(name = "tier", nullable = false)
    private Tier tier;


    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "game_id")
    private Game game;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "job_id", nullable = false)
    private Job job;

    @Builder
    public GameResult(Long id, String hair, String face, String gender, String color, String tier, Job job, Game game) {
        this.id = id;
        this.hair = Hair.valueOf(hair);
        this.face = Face.valueOf(face);
        this.gender = Gender.valueOf(gender);
        this.color = Color.valueOf(color);
        this.tier = Tier.valueOf(tier);
        this.job = job;
        this.game = game;
    }
}
