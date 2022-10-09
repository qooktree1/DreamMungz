package dreammungz.db.entity;

import dreammungz.enums.StoryType;
import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

/*
@author 황승주
@since 2022. 09. 07.
*/

@NoArgsConstructor(access = AccessLevel.PROTECTED)
@DynamicUpdate
@Entity
@Getter
@Table(name = "story")
public class Story {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "story_id")
    private Long id;

    @Column(name = "name", nullable = false)
    private String title;

    @Column(name = "image")
    private String image;

    @Enumerated(EnumType.STRING)
    @Column(name = "type", nullable = false)
    private StoryType type;

    @Column(name = "first_scene", nullable = false)
    private Long firstScene;

    @OneToMany(mappedBy = "story", cascade = CascadeType.ALL)
    private List<Scene> scenes = new ArrayList<>();

    @OneToMany(mappedBy = "story", cascade = CascadeType.ALL)
    private List<GameStory> gameStories= new ArrayList<>();

    @Builder
    public Story(Long id, String title, StoryType type, Long firstScene) {
        this.id = id;
        this.title = title;
        this.type = type;
        this.firstScene = firstScene;
    }

    public void setImage(String image){
        this.image = image;
    }
}
