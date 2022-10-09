package dreammungz.db.entity;

import dreammungz.enums.*;
import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@NoArgsConstructor(access = AccessLevel.PROTECTED)
@DynamicUpdate
@Entity
@Getter
@Table(name = "Nft")
public class Nft {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "nft_id")
    private Long id;

    @Column(name = "token_id", nullable = false, unique = true)
    private Long tokenId;

    @Column(name = "metadata", nullable = false, unique = true)
    private String metadata;

    @Column(name = "image_url", nullable = false)
    private String imageUrl;

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


    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "job_id", nullable = false)
    private Job job;

    @OneToMany(mappedBy = "nft", cascade = CascadeType.ALL)
    private List<NftStatus> nftStatuses = new ArrayList<>();

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "member_id", nullable = false)
    private Member member;

    @OneToMany(mappedBy = "nft", cascade = CascadeType.ALL)
    private List<Trade> trades = new ArrayList<>();

    @Builder
    public Nft(Long id, Long tokenId, String imageUrl, String metadata, String hair, String face, String gender, String color, String tier, Member member, Job job) {
        this.id = id;
        this.tokenId = tokenId;
        this.imageUrl = imageUrl;
        this.metadata = metadata;
        this.hair = Hair.valueOf(hair);
        this.face = Face.valueOf(face);
        this.gender = Gender.valueOf(gender);
        this.color = Color.valueOf(color);
        this.tier = Tier.valueOf(tier);
        this.member = member;
        this.job = job;
    }

    public void setMember(Member member){
        this.member = member;
    }
}