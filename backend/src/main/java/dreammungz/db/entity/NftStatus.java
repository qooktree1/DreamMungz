package dreammungz.db.entity;

import dreammungz.enums.Check;
import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;

/*
@author 황승주
@since 2022. 09. 07.
*/

@NoArgsConstructor(access = AccessLevel.PROTECTED)
@DynamicUpdate
@Entity
@Getter
@Table(name = "nft_status")
public class NftStatus {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "nft_status_id")
    private Long id;

    @Column(name = "value", nullable = false)
    private Long value;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "nft_id", nullable = false)
    private Nft nft;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "status_id", nullable = false)
    private Status status;

    @Builder
    public NftStatus(Long id, Long value, Nft nft, Status status) {
        this.value = value;
        this.nft = nft;
        this.status = status;
    }

    public void setValue(Long value){
        this.value = value;
    }
}
