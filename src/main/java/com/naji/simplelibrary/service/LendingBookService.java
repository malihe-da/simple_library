package com.naji.simplelibrary.service;

import com.naji.simplelibrary.model.dao.BookDao;
import com.naji.simplelibrary.model.dao.LendingBookDao;
import com.naji.simplelibrary.model.entity.Book;
import com.naji.simplelibrary.model.entity.LendingBook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class LendingBookService {
    LendingBookDao lendingBookDao;
    BookDao bookDao;

    public void lendBookToUser(LendingBook lending) {
        Book book = lending.getBook();
        int count = book.getCount();
        book.setCount(count - 1);
        lending.setBook(book);
        bookDao.save(book);
        lendingBookDao.save(lending);
    }

    @Autowired
    public void setLendingBookDao(LendingBookDao lendingBookDao) {
        this.lendingBookDao = lendingBookDao;
    }

    @Autowired
    public void setBookDao(BookDao bookDao) {
        this.bookDao = bookDao;
    }
}
