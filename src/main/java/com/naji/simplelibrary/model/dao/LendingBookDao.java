package com.naji.simplelibrary.model.dao;


import com.naji.simplelibrary.model.entity.LendingBook;
import org.springframework.data.repository.CrudRepository;

@org.springframework.stereotype.Repository
public interface LendingBookDao extends CrudRepository<LendingBook, Integer> {

}
