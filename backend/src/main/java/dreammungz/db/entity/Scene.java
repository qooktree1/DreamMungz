package dreammungz.db.entity;

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
@Table(name = "scene")
public class Scene {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "scene_id")
    private Long id;

    @Column(name = "image")
    private String image;

    @Column(name = "bgm")
    private String bgm;

    @Column(name = "content", nullable = false)
    private String content;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "story_id", nullable = false)
    private Story story;

    @OneToMany(mappedBy = "scene", cascade = CascadeType.ALL)
    private List<Selection> selections = new ArrayList<>();

    @Builder
    public Scene(Long id, String image, String bgm, String content, Story story) {
        this.id = id;
        this.image = image;
        this.bgm = bgm;
        this.content = content;
        this.story = story;
    }
}
