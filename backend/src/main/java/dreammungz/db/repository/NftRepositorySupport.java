package dreammungz.db.repository;

import com.querydsl.core.types.OrderSpecifier;
import com.querydsl.core.types.dsl.BooleanExpression;
import com.querydsl.core.types.dsl.Expressions;
import com.querydsl.jpa.JPQLQuery;
import com.querydsl.jpa.impl.JPAQueryFactory;
import dreammungz.api.dto.nft.list.NftListRequest;
import dreammungz.db.entity.Job;
import dreammungz.db.entity.Member;
import dreammungz.db.entity.Nft;
import dreammungz.db.entity.Status;
import dreammungz.enums.*;
import dreammungz.exception.CustomException;
import dreammungz.exception.CustomExceptionList;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.support.QuerydslRepositorySupport;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

import static dreammungz.db.entity.QJob.job;
import static dreammungz.db.entity.QNft.nft;
import static dreammungz.db.entity.QNftStatus.nftStatus;
import static dreammungz.db.entity.QTrade.trade;

/*
@author 신슬기
@since 2022. 09. 23.
*/

@Repository
public class NftRepositorySupport extends QuerydslRepositorySupport {
    private final JPAQueryFactory queryFactory;
    private final MemberRepository memberRepository;
    private final JobRepository jobRepository;
    private final StatusRepository statusRepository;

    public NftRepositorySupport(JPAQueryFactory queryFactory, MemberRepository memberRepository, JobRepository jobRepository, StatusRepository statusRepository) {
        super(Nft.class);
        this.queryFactory = queryFactory;
        this.memberRepository = memberRepository;
        this.jobRepository = jobRepository;
        this.statusRepository = statusRepository;
    }

    public Page<Nft> findSell(Pageable pageable, NftListRequest nftListRequest) {
        JPQLQuery<Nft> query = queryFactory
                .select(nft).distinct()
                .from(nft)
                .leftJoin(nft.trades, trade)
                .leftJoin(nft.nftStatuses, nftStatus)
                .where(eqStatus(nftListRequest.getStatus()),trade.state.eq(State.PROCEEDING), trade.cancel.eq(Check.N), eqAddress(nftListRequest.getAddress()), eqJob(nftListRequest.getJob()), eqHair(nftListRequest.getHair())
                        , eqTier(nftListRequest.getTier()), eqColor(nftListRequest.getColor()), eqGender(nftListRequest.getGender())
                        , eqFace(nftListRequest.getFace()));
        List<Nft> nfts = this.getQuerydsl().applyPagination(pageable, query).orderBy(nft.tokenId.desc()).fetch();
        return new PageImpl<>(nfts, pageable, query.fetchCount());
    }

    public Page<Nft> findAll(Pageable pageable, NftListRequest nftListRequest) {
        JPQLQuery<Nft> query = queryFactory
                .select(nft).distinct()
                .from(nft)
                .leftJoin(nft.nftStatuses, nftStatus)
                .where(eqStatus(nftListRequest.getStatus()),eqAddress(nftListRequest.getAddress()), eqJob(nftListRequest.getJob()), eqHair(nftListRequest.getHair())
                        , eqTier(nftListRequest.getTier()), eqColor(nftListRequest.getColor()), eqGender(nftListRequest.getGender())
                        , eqFace(nftListRequest.getFace()));
        List<Nft> nfts = this.getQuerydsl().applyPagination(pageable, query).orderBy(nft.tokenId.desc()).fetch();
        return new PageImpl<>(nfts, pageable, query.fetchCount());
    }

    public List<Nft> findAllByMember(Member member) {
        return queryFactory
                .select(nft)
                .from(nft)
                .where(nft.member.eq(member))
                .fetch();
    }

    public List<Nft> findAllByMemberAndTier(Member member,List<String> tierList) {
        return queryFactory
                .select(nft).distinct()
                .from(nft)
                .where(nft.member.eq(member),nft.job.eq(job))
                .orderBy(orderSpecifier(tierList),nft.job.id.asc())
                .limit(10)
                .fetch();
    }

    private BooleanExpression eqAddress(String address) {
        if (address == null || address.isEmpty()) {
            return null;
        }
        Member member = memberRepository.findByAddress(address).orElseThrow(() -> new CustomException(CustomExceptionList.MEMBER_NOT_FOUND));
        System.out.println(member.getId());
        return nft.member.eq(member);
    }

    private BooleanExpression eqJob(String jobName) {
        if (jobName == null) {
            return null;
        }
        Job job = jobRepository.findByName(JobName.valueOf(jobName)).orElseThrow(() -> new CustomException(CustomExceptionList.JOB_NOT_FOUND));
        return nft.job.eq(job);
    }

    private BooleanExpression eqHair(String hairName) {
        if (hairName == null) {
            return null;
        }
        Hair hair = Hair.valueOf(hairName);
        return nft.hair.eq(hair);
    }

    private BooleanExpression eqTier(String tierName) {
        if (tierName == null) {
            return null;
        }
        Tier tier = Tier.valueOf(tierName);
        return nft.tier.eq(tier);
    }

    private BooleanExpression eqColor(String colorName) {
        if (colorName == null) {
            return null;
        }
        Color color = Color.valueOf(colorName);
        return nft.color.eq(color);
    }

    private BooleanExpression eqGender(String genderName) {
        if (genderName == null) {
            return null;
        }
        Gender gender = Gender.valueOf(genderName);
        return nft.gender.eq(gender);
    }

    private BooleanExpression eqFace(String faceName) {
        if (faceName == null) {
            return null;
        }
        Face face = Face.valueOf(faceName);
        return nft.face.eq(face);
    }


    private BooleanExpression eqStatus(List<String> status) {
        if (status.size()==0) {
            return null;
        }
        List<StatusName> id = new ArrayList<>();
        for(int i=0;i< status.size();i++){
            Status statusValue = statusRepository.findByName(StatusName.valueOf(status.get(i))).orElseThrow(() -> new CustomException(CustomExceptionList.STATUS_NOT_FOUND));
            id.add(statusValue.getName());
        }
        return nftStatus.status.name.in(id);
    }

    private OrderSpecifier<?> orderSpecifier(List<String> tierList){
        return Expressions.stringTemplate("FIELD({0},{1})",nft.tier,tierList).desc();
    }

}
