package dreammungz.api.service;

import dreammungz.api.dto.trade.*;
import dreammungz.db.entity.*;
import dreammungz.db.repository.*;
import dreammungz.enums.Check;
import dreammungz.enums.State;
import dreammungz.enums.TradeType;
import dreammungz.exception.CustomException;
import dreammungz.exception.CustomExceptionList;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional
public class TradeService {
    final MemberRepository memberRepository;
    final SellerRepository sellerRepository;
    final TradeRepository tradeRepository;
    final TradeRepositorySupport tradeRepositorySupport;
    final NegotiationRepository negotiationRepository;
    final NegotiationRepositorySupport negotiationRepositorySupport;
    final NftRepository nftRepository;

    public void registerNft(TradeRegisterRequest tradeRegisterRequest){
        Member member = getMember(tradeRegisterRequest.getAddress());

        //Seller DB에 사용자 추가
        Seller seller = new Seller(member);
        sellerRepository.save(seller);
        //Trade DB에 사용 정보 추가
        Trade trade = new Trade(State.PROCEEDING,
                tradeRegisterRequest.isNegoAble()?Check.Y:Check.N,
                LocalDateTime.now(),
                tradeRegisterRequest.getPrice(),
                nftRepository.findNftByTokenId(tradeRegisterRequest.getTokenId()).get(),
                seller,
                Check.N,
                tradeRegisterRequest.getContractId()
                );
        tradeRepository.save(trade);
    }

    public void stopNft(TradeStopRequest tradeStopRequest){
        Member member = getMember(tradeStopRequest.getAddress());

        //nft id가 같고 거래상태(state)가 proceeding인 것을 찾는다.
        Trade trade = getTrade(tradeStopRequest.getContractId());
        //해당 거래를 cancel한다.
        trade.setCancel(Check.Y);
        tradeRepository.save(trade);

        //nego table의 모든 네고 요청을 cancel 한다.
        List<Negotiation> negotiations = negotiationRepository.findAllByTradeId(trade.getId());
        for(Negotiation negotiation : negotiations){
            negotiation.setCancel(Check.Y);
        }
        negotiationRepository.saveAll(negotiations);

    }

    public void purchaseNft(TradePurchaseRequest tradePurchaseRequest){
        Member member = getMember(tradePurchaseRequest.getAddress());
        //buyer 만들기
        Buyer buyer = new Buyer(member);

        //해당 거래를 trade 테이블에서 찾기
        Trade trade = getTrade(tradePurchaseRequest.getContractId());
        trade.setBuyer(buyer);  //buyer 추가
        trade.setEndTime(LocalDateTime.now());  // 종료시간 추가
        trade.setEndPrice(trade.getStartPrice());   // 최종거래금액 추가
        trade.setState(State.COMPLETE);// 거래상태 변경
        tradeRepository.save(trade);

        //nego table의 모든 네고 요청을 cancel 한다.
        List<Negotiation> negotiations = negotiationRepository.findAllByTradeId(trade.getId());
        for(Negotiation negotiation : negotiations){
            negotiation.setCancel(Check.Y);
        }
        negotiationRepository.saveAll(negotiations);

        //NFT테이블에 해당 NFT의 member_id를 구매자로 변경한다.
        Nft nft = nftRepository.findNftByTokenId(tradePurchaseRequest.getTokenId()).get();
        nft.setMember(member);
        nftRepository.save(nft);
    }

    public void registerOffer(OfferRegisterRequest offerRegisterRequest){
        Member member = getMember(offerRegisterRequest.getAddress());
        //negotiation DB에 추가
        Negotiation negotiation = new Negotiation(
                offerRegisterRequest.getPrice(),
                LocalDateTime.now(),
                Check.N,
                getTrade(offerRegisterRequest.getTradeContractId()),   //tokenID를 바탕으로 nft->trade 아이디 추적
                member,
                Check.N,
                Check.N,
                offerRegisterRequest.getNegoContractId()
        );
        negotiationRepository.save(negotiation);
    }

    public void cancelOffer(OfferCancelRequest offerCancelRequest){
        Member member = getMember(offerCancelRequest.getAddress());
        //해당하는 negotiation 찾기
        Negotiation negotiation = negotiationRepository.findByContractId(offerCancelRequest.getContractId()).get();
        //negotiation DB 수정
        negotiation.setCancel(Check.Y);
        negotiationRepository.save(negotiation);
    }

    public void refundOffer(Long id){
        Negotiation negotiation = negotiationRepository.findByContractId(id).get();
        negotiation.setRefund(Check.Y); //네고 컨트랙트 아이디를 기준으로
        negotiationRepository.save(negotiation);
    }

    public void acceptOffer(OfferAcceptRequest offerAcceptRequest){
        //구매 제안자 찾기
        Negotiation negotiation = negotiationRepository.findByContractId(offerAcceptRequest.getContractId()).get();
        Member member = negotiation.getMember();
        //buyer 만들기
        Buyer buyer = new Buyer(member);

        //해당 거래를 trade 테이블에서 찾기
        Trade trade = negotiation.getTrade();
        trade.setBuyer(buyer);  //buyer 추가
        trade.setEndTime(LocalDateTime.now());  // 종료시간 추가
        trade.setEndPrice(negotiation.getPrice());   // 최종거래금액 추가
        trade.setState(State.COMPLETE);// 거래상태 변경
        tradeRepository.save(trade);

        //nego table의 모든 네고 요청을 cancel 한다.
        List<Negotiation> negotiations = negotiationRepository.findAllByTradeId(trade.getId());
        for(Negotiation negotiationTemp : negotiations){
            if(negotiationTemp == negotiation){
                negotiationTemp.setChoice(Check.Y); //수락된 네고는 수락되었음을 표시
            }
            else {
                negotiationTemp.setCancel(Check.Y); //다른 네고들은 취소되었음을 표시
            }
        }
        negotiationRepository.saveAll(negotiations);

        //NFT테이블에 해당 NFT의 member_id를 구매자로 변경한다.
        Nft nft = nftRepository.findNftByTokenId(offerAcceptRequest.getTokenId()).get();
        nft.setMember(member);
        nftRepository.save(nft);
    }

    public TradeHistoryResponse tradeHistory(String address, int page){
        TradeHistoryResponse response = new TradeHistoryResponse();
        PageRequest pageRequest = PageRequest.of(page, 6); //6개씩 페이징

        // 거래가 완료된 거래 내역들만 조회
        Page<Trade> tradeList = tradeRepositorySupport.findHistoryByAddress(pageRequest,address);
        List<TradeHistoryResponse.TradeItem> tradeItems = new ArrayList<>();
        for(int i=0;i<tradeList.getContent().size();i++){
                Trade trade = tradeList.getContent().get(i);
                TradeHistoryResponse.TradeItem tradeItem = TradeHistoryResponse.TradeItem.builder()
                        .id(trade.getNft().getTokenId())
                        .url(trade.getNft().getImageUrl())
                        .metadata(trade.getNft().getMetadata())
                        .type((trade.getSeller().getMember().getAddress().equals(address)? TradeType.SELL:TradeType.BUY)) //판매인지 구매인지 판단
                        .sellerNickname(trade.getSeller().getMember().getNickname())
                        .sellerAddress(trade.getSeller().getMember().getAddress())
                        .buyerNickname(trade.getBuyer().getMember().getNickname())
                        .buyerAddress(trade.getBuyer().getMember().getAddress())
                        .date(trade.getEndTime())
                        .price(trade.getEndPrice())
                        .build();
                tradeItems.add(tradeItem);
            }
        response.setItems(tradeItems);
        response.setCurrentPage(tradeList.getPageable().getPageNumber()); //현재 페이지
        response.setTotalPage(tradeList.getTotalPages()-1); //마지막 페이지
        return response;
    }

    public OfferHistoryResponse offerHistory(String address, int page){
        OfferHistoryResponse response = new OfferHistoryResponse();
        PageRequest pageRequest = PageRequest.of(page, 6); //6개씩 페이징

        // 지갑 주소에 대한 negotiation 조회
        Page<Negotiation> negoList = negotiationRepositorySupport.findHistoryByAddress(pageRequest,address);
        List<OfferHistoryResponse.Offer> offerItems = new ArrayList<>();
        for(int i=0;i<negoList.getContent().size();i++){
                Negotiation negotiation = negoList.getContent().get(i);
                OfferHistoryResponse.Offer offerItem = OfferHistoryResponse.Offer.builder()
                        .tokenId(negotiation.getTrade().getNft().getTokenId())
                        .url(negotiation.getTrade().getNft().getImageUrl())
                        .metadata(negotiation.getTrade().getNft().getMetadata())
                        .offerId(negotiation.getContractId())
                        .tradeId(negotiation.getTrade().getContractId())
                        .offerNickname(negotiation.getMember().getNickname())
                        .offerAddress(negotiation.getMember().getAddress())
                        .offerDate(negotiation.getNegoTime())
                        .offerPrice(negotiation.getPrice())
                        .choice(negotiation.getChoice()==Check.Y)
                        .cancel(negotiation.getCancel()==Check.Y)
                        .refund(negotiation.getRefund()==Check.Y)
                        .build();
                offerItems.add(offerItem);
            }
        response.setOffer(offerItems);
        response.setCurrentPage(negoList.getPageable().getPageNumber()); //현재 페이지
        response.setTotalPage(negoList.getTotalPages()-1); //마지막 페이지
        return response;
    }

    public NftInfoResponse nftInfo(Long id){
        NftInfoResponse nftInfoResponse = new NftInfoResponse();
        NftInfoResponse.Nft nft = new NftInfoResponse.Nft();
        //token id로 nft 정보 조회
        Nft nftItem = getNft(id);
        List<NftInfoResponse.Nft.Status> statusList = new ArrayList<>();
        for(int i=0;i<nftItem.getNftStatuses().size();i++){
            NftStatus status = nftItem.getNftStatuses().get(i);
            statusList.add(new NftInfoResponse.Nft.Status(status.getStatus().getName(),status.getValue()));
        }
        nft = NftInfoResponse.Nft.builder()
                .id(id)
                .url(nftItem.getImageUrl())
                .metadata(nftItem.getMetadata())
                .job(nftItem.getJob().getName())
                .color(nftItem.getColor())
                .gender(nftItem.getGender())
                .tier(nftItem.getTier())
                .face(nftItem.getFace())
                .hair(nftItem.getHair())
                .status(statusList)
                .build();
        nftInfoResponse.setNft(nft);
        //거래 이력 조회(완료된 건만) -> 거래중인 내역이 있다면 sell -> true 및 관련 정보 담기
        List<Trade> tradeList = tradeRepositorySupport.findByTokenId(id);
        List<NftInfoResponse.Trade> tradeItems = new ArrayList<>();
        for(Trade trade:tradeList){
            NftInfoResponse.Trade tradeItem = NftInfoResponse.Trade.builder()
                    .tradeId(trade.getContractId())
                    .sellerNickname(trade.getSeller().getMember().getNickname())
                    .sellerAddress(trade.getSeller().getMember().getAddress())
                    .buyerNickname(trade.getBuyer().getMember().getNickname())
                    .buyerAddress(trade.getBuyer().getMember().getAddress())
                    .tradeDate(trade.getEndTime())
                    .tradePrice(trade.getEndPrice())
                    .build();
            tradeItems.add(tradeItem);
        }
        nftInfoResponse.setTrade(tradeItems);

        //sell true면 offer 리스트 담기(진행중인 건만)
        List<Trade> isSell = tradeRepositorySupport.findSellByTokenId(id);
        List<NftInfoResponse.Offer> offers = new ArrayList<>();
        if(isSell.size()!=0){
            nftInfoResponse.setTraceId(isSell.get(0).getContractId());
            nftInfoResponse.setSell(true);
            nftInfoResponse.setNego(isSell.get(0).getNegoAble()==Check.Y);
            nftInfoResponse.setPrice(isSell.get(0).getStartPrice());
            nftInfoResponse.setSellerNickname(isSell.get(0).getSeller().getMember().getNickname());
            nftInfoResponse.setSellerAddress(isSell.get(0).getSeller().getMember().getAddress());
            List<Negotiation> negos = negotiationRepositorySupport.findByTradeId(isSell.get(0).getId());
            for(Negotiation negotiation:negos){
                NftInfoResponse.Offer offer = NftInfoResponse.Offer.builder()
                        .offerId(negotiation.getContractId())
                        .offerPrice(negotiation.getPrice())
                        .offerNickname(negotiation.getMember().getNickname())
                        .offerAddress(negotiation.getMember().getAddress())
                        .offerDate(negotiation.getNegoTime())
                        .build();
                offers.add(offer);
            }
            nftInfoResponse.setOffer(offers);
        }else{ // 판매 안하면 소유자의 주소와 닉네임 반환(판매중이면 판매자의 주소와 닉네임)
            nftInfoResponse.setSell(false);
            nftInfoResponse.setSellerAddress(nftItem.getMember().getAddress());
            nftInfoResponse.setSellerNickname(nftItem.getMember().getNickname());
            nftInfoResponse.setOffer(offers);
        }
        return nftInfoResponse;
    }

    public Member getMember(String address){
        return memberRepository.findByAddress(address).orElseThrow(() -> new CustomException(CustomExceptionList.MEMBER_NOT_FOUND));
    }

    public Trade getTrade(Long contractId){
        return tradeRepository.findByContractId(contractId).get();
    }

    private Nft getNft(Long tokenId) {
        Nft nft = nftRepository.findNftByTokenId(tokenId).orElseThrow(() -> new CustomException(CustomExceptionList.NFT_NOT_FOUND));
        return nft;
    }
}
