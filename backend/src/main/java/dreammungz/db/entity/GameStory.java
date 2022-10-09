package dreammungz.db.entity;

import dreammungz.enums.State;
import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;

/*
@author 황승주
@since 2022. 09. 10.
*/

@NoArgsConstructor(access = AccessLevel.PROTECTED)
@DynamicUpdate
@Entity
@Getter
@Table(name = "game_story")
public class GameStory {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "game_story_id")
    private Long id;

    @Column(name = "sequence", nullable = false)
    private Long sequence;

    @Enumerated(EnumType.STRING)
    @Column(name = "state", nullable = false)
    private State state;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "game_id", nullable = false)
    private Game game;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "story_id", nullable = false)
    private Story story;

    @Builder
    public GameStory(Long sequence, State state, Game game, Story story) {
        this.sequence = sequence;
        this.state = state;
        this.game = game;
        this.story = story;
    }

    public void setState(State state){
        this.state = state;
    }
}
