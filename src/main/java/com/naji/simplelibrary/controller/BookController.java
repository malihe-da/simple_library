package com.naji.simplelibrary.controller;


import com.naji.simplelibrary.model.entity.Book;
import com.naji.simplelibrary.model.entity.User;
import com.naji.simplelibrary.service.BookService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
public class BookController {
    BookService bookService;

    public BookController(BookService bookService) {
        this.bookService = bookService;
    }

    @RequestMapping(value = "bookManagement", method = RequestMethod.GET)
    public String showRegister(Model model) {
        model.addAttribute("book", new Book());
        return "bookManagement";
    }

    @RequestMapping(value = "submitNewBook", method = RequestMethod.POST)
    public String submitNewBook(@ModelAttribute("book") Book book,
                          Model model) {

        if (!bookService.isValidISBN(book.getISBN())) {
            model.addAttribute("message", "The entered ISBN is not valid!");

        } else{
            if (bookService.duplicateISBN(book.getISBN())) {
                model.addAttribute("message", "This ISBN is already submitted before!");
            } else {
                bookService.submitNewBook(book);
                model.addAttribute("message", book.getName() +
                        " submitted successfully!");
            }
        }
        model.addAttribute("book", new Book());
        return "bookManagement";
    }

    @RequestMapping(value = "searchBook", method = RequestMethod.GET)
    public String searchBook(@ModelAttribute("book") Book book,
                          Model model) {

        List<Book> bookList = bookService.findMaxMatch(book);
        System.out.println(bookList.toString());
        if (bookList.size() == 0) {
            model.addAttribute("message", "There is no book with this profile!");
            model.addAttribute("book", new Book());
            return "bookManagement";
        } else {
            model.addAttribute("bookList", bookList);
            return "showBooks";
        }
    }

    @RequestMapping(value = "updateBookCount", method = RequestMethod.GET)
    public String updateBookCount(@ModelAttribute("book") Book book,
                          Model model) {

        List<Book> bookList = bookService.findMaxMatch(book);
        if (bookList.size() != 1) {
            model.addAttribute("message", "A unique book with the entered profile could not be found. Try again!");
            model.addAttribute("book", new Book());
            return "bookManagement";
        } else {
            model.addAttribute("book", bookList.get(0));
            return "updateBookCount";
        }
    }

    @RequestMapping(value = "bookCountUpdateProcess", method = RequestMethod.GET)
    public String bookCountUpdateProcess(@ModelAttribute("book") Book book,
                          Model model) {

       Book preBook = bookService.findByISBN(book.getISBN());
       bookService.updateCount(preBook, book.getCount());
        model.addAttribute("message", "Book count update was successful!");
        model.addAttribute("book", new Book());
        return "bookManagement";
    }

    @RequestMapping(value = "deleteBook", method = RequestMethod.GET)
    public String deleteBook(@ModelAttribute("Book") Book book,
                             Model model) {
        List<Book> bookList = bookService.findMaxMatch(book);
        if (bookList.size()!=1) {
            model.addAttribute("message", "A unique book with the entered profile could not be found. Try again!");
        }
        bookService.deleteBook(bookList.get(0));
        model.addAttribute("message", "Deleting operation completed successfully!");
        model.addAttribute("user", new User());
        return "userManagement";
    }
}
