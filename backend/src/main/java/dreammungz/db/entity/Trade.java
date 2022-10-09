package dreammungz.db.entity;

import dreammungz.enums.Check;
import dreammungz.enums.State;
import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.DynamicUpdate;

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
@Table(name = "trade")
public class Trade {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "trade_id")
    private Long id;

    @Enumerated(EnumType.STRING)
    @Column(name = "state", nullable = false)
    private State state;

    @Enumerated(EnumType.STRING)
    @Column(name = "nego_able", nullable = false)
    private Check negoAble;

    @Column(name = "start_time", nullable = false, updatable = false)
    private LocalDateTime startTime;

    @Column(name = "end_time")
    private LocalDateTime endTime;

    @Column(name = "start_price", nullable = false)
    private Long startPrice;

    @Column(name = "end_price")
    private Long endPrice;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "nft_id")
    private Nft nft;

    @OneToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinColumn(name = "seller_id")
    private Seller seller;

    @OneToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinColumn(name = "buyer_id")
    private Buyer buyer;

    @Enumerated(EnumType.STRING)
    @Column(name = "cancel", nullable = false)
    private Check cancel;

    @Column(name = "contract_id", unique = true, nullable = false)
    private Long contractId;

    @Builder
    public Trade(State state, Check negoAble, LocalDateTime startTime, Long startPrice, Nft nft, Seller seller, Check cancel, Long contractId) {
        this.state = state;
        this.negoAble = negoAble;
        this.startTime = startTime;
        this.startPrice = startPrice;
        this.nft = nft;
        this.seller = seller;
        this.cancel = cancel;
        this.contractId = contractId;
    }

    public void setState(State state) { this.state = state;}
    public void setBuyer(Buyer buyer) {
        this.buyer = buyer;
    }
    public void setCancel(Check cancel){ this.cancel = cancel;}
    public void setEndPrice(Long endPrice) { this.endPrice = endPrice; }
    public void setEndTime(LocalDateTime endTime) { this.endTime = endTime; }
}
