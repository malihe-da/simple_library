package com.naji.simplelibrary.model.dao;

import com.naji.simplelibrary.model.entity.Book;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.repository.CrudRepository;
import org.springframework.util.StringUtils;

import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@org.springframework.stereotype.Repository
public interface BookDao extends CrudRepository<Book, Integer> {
    Optional<Book> findFirstByISBN(String code);

    List<Book> findAll(Specification<Book> maxMatch);

    static Specification<Book> findMaxMatch(String name,
                                            String author,
                                            String ISBN) {
        return (Specification<Book>) (root, criteriaQuery, builder) -> {
            CriteriaQuery<Book> resultCriteria = builder.createQuery(Book.class);

            List<Predicate> predicates = new ArrayList<Predicate>();
            if (!StringUtils.isEmpty(name) && name != null) {
                predicates.add(builder.equal(root.get("name"), name));
            }
            if (!StringUtils.isEmpty(author) && author != null) {
                predicates.add(builder.equal(root.get("author"), author));
            }
            if (!StringUtils.isEmpty(ISBN) && ISBN != null) {
                predicates.add(builder.equal(root.get("ISBN"), ISBN));
            }

            resultCriteria.select(root).where(predicates.toArray(new Predicate[0]));
            return resultCriteria.getRestriction();
        };
    }
}
