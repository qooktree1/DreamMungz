package dreammungz.db.repository;

import dreammungz.db.entity.Buyer;
import org.springframework.data.jpa.repository.JpaRepository;

/*
@author 황승주
@since 2022. 09. 07.
*/

public interface BuyerRepository extends JpaRepository<Buyer, Long> {
}
