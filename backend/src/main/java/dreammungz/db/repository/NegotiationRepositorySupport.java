package dreammungz.db.repository;

import com.querydsl.jpa.JPQLQuery;
import com.querydsl.jpa.impl.JPAQueryFactory;
import dreammungz.db.entity.Negotiation;
import dreammungz.enums.Check;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.support.QuerydslRepositorySupport;
import org.springframework.stereotype.Repository;

import java.util.List;

import static dreammungz.db.entity.QNegotiation.negotiation;
import static dreammungz.db.entity.QTrade.trade;

/*
@author 신슬기
@since 2022. 09. 26
*/

@Repository
public class NegotiationRepositorySupport extends QuerydslRepositorySupport {
    private final JPAQueryFactory queryFactory;

    public NegotiationRepositorySupport(JPAQueryFactory queryFactory) {
        super(Negotiation.class);
        this.queryFactory = queryFactory;
    }

    public List<Negotiation> findByTradeId(Long tradeId){
        return queryFactory
                .select(negotiation)
                .where(negotiation.trade.id.eq(tradeId),negotiation.cancel.eq(Check.N),negotiation.choice.eq(Check.N))
                .from(negotiation)
                .orderBy(trade.endTime.desc())
                .fetch();
    }

    public Page<Negotiation> findHistoryByAddress(Pageable pageable, String address) {
        JPQLQuery<Negotiation> query = queryFactory
                .select(negotiation)
                .where(negotiation.member.address.eq(address))
                .from(negotiation);
        List<Negotiation> negotiations = this.getQuerydsl().applyPagination(pageable, query).orderBy(negotiation.negoTime.desc()).fetch();
        return new PageImpl<>(negotiations, pageable, query.fetchCount());
    }

}
