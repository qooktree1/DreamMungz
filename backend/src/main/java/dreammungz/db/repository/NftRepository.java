package dreammungz.db.repository;

import dreammungz.db.entity.Nft;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.Optional;

/*
@author 황승주
@since 2022. 09. 07.
*/

public interface NftRepository extends JpaRepository<Nft, Long>, JpaSpecificationExecutor<Nft> {

    /*
    @author 신슬기
    @since 2022. 09. 16.
    */
    Optional<Nft> findNftByTokenId(Long tokenId);
    boolean existsByTokenId(Long tokenId);
    Page<Nft> findAll(Pageable pageable);
    //Page<Nft> findAll(Specification<Nft> spec, Pageable pagealbe); //Specification를 이용해 동적 조건 검색


}
