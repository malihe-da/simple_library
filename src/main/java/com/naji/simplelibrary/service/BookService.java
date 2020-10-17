package com.naji.simplelibrary.service;

import com.naji.simplelibrary.model.dao.BookDao;
import com.naji.simplelibrary.model.dao.UserDao;
import com.naji.simplelibrary.model.entity.Book;
import com.naji.simplelibrary.model.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class BookService {
    BookDao bookDao;

    public void submitNewBook(Book book) {
        bookDao.save(book);
    }

    public List<Book> findMaxMatch(Book book) {
        return bookDao.findAll(BookDao.findMaxMatch(book.getName(),
                book.getAuthor(), book.getISBN()));
    }

    public Book findByISBN(String isbn) {
        Optional<Book> found = bookDao.findFirstByISBN(isbn);
        if(found.isPresent()){
            return found.get();
        }
        return null;
    }


    public void updateCount(Book preBook, int count) {
        preBook.setCount(count);
        bookDao.save(preBook);
    }

    public boolean isValidISBN(String code) {
        if (!(code.length() == 10 || code.length() == 13))
            return false;


        for (int i = 0; i < code.length(); i++) {
            if (!Character.isDigit(code.charAt(i)))
                return false;
        }
        return true;
    }
    public void deleteBook(Book book) {
        bookDao.delete(book);
    }

    public boolean duplicateISBN(String code) {
        Optional<Book> found = bookDao.findFirstByISBN(code);
        if (found.isPresent())
            return true;

        return false;
    }

    @Autowired
    public void setBookDao(BookDao bookDao) {
        this.bookDao = bookDao;
    }



}
