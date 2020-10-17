package com.naji.simplelibrary.model.dao;


import com.naji.simplelibrary.model.entity.User;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.util.StringUtils;

import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@org.springframework.stereotype.Repository
public interface UserDao extends CrudRepository<User, Integer> {
    Optional<User> findFirstByNationalCode(String code);
    Optional<User> findFirstByMembershipNumber(Integer number);

    @Query(value = "SELECT max(membershipNumber) FROM User")
     Integer max();

    List<User> findAll(Specification<User> maxMatch);

    static Specification<User> findMaxMatch(String firstName,
                                            String lastName,
                                            String nationalCode,
                                            Integer membershipNumber) {
        return (Specification<User>) (root, criteriaQuery, builder) -> {
            CriteriaQuery<User> resultCriteria = builder.createQuery(User.class);

            List<Predicate> predicates = new ArrayList<Predicate>();
            if (!StringUtils.isEmpty(firstName) && firstName != null) {
                predicates.add(builder.equal(root.get("firstName"), firstName));
            }
            if (!StringUtils.isEmpty(lastName) && lastName != null) {
                predicates.add(builder.equal(root.get("lastName"), lastName));
            }
            if (membershipNumber != null && membershipNumber > 0) {
                predicates.add(builder.equal(root.get("membershipNumber"), membershipNumber));
            }
            if (!StringUtils.isEmpty(nationalCode) && nationalCode != null) {
                predicates.add(builder.equal(root.get("nationalCode"), nationalCode));
            }

            resultCriteria.select(root).where(predicates.toArray(new Predicate[0]));
            return resultCriteria.getRestriction();
        };
    }
}
