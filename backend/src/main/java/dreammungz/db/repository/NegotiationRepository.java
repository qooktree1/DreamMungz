package dreammungz.db.repository;

import dreammungz.db.entity.Negotiation;
import dreammungz.db.entity.Nft;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;
import java.util.Optional;

/*
@author 황승주
@since 2022. 09. 07.
*/

public interface NegotiationRepository extends JpaRepository<Negotiation, Long>, JpaSpecificationExecutor<Nft> {
    List<Negotiation> findAllByTradeId(Long tradeId);
    Optional<Negotiation> findByContractId(Long contractId);

}
