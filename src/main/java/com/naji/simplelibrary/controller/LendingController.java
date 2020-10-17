package com.naji.simplelibrary.controller;

import com.naji.simplelibrary.model.entity.Book;
import com.naji.simplelibrary.model.entity.LendingBook;
import com.naji.simplelibrary.model.entity.User;
import com.naji.simplelibrary.service.BookService;
import com.naji.simplelibrary.service.LendingBookService;
import com.naji.simplelibrary.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LendingController {
    LendingBookService lendingBookService;
    UserService userService;
    BookService bookService;

    public LendingController(LendingBookService lendingBookService, UserService userService, BookService bookService) {
        this.lendingBookService = lendingBookService;
        this.userService = userService;
        this.bookService = bookService;
    }

    @RequestMapping(value = "lendingBook", method = RequestMethod.GET)
    public String lendingBookManagement(Model model) {
        model.addAttribute("lending", new LendingBook());
        return "lendingBook";
    }
    @RequestMapping(value = "lendingProcess", method = RequestMethod.GET)
    public String lendingBookProcess(@ModelAttribute("lending") LendingBook lending,
                                     Model model) {

        User user = userService.findUserByMembershipNumber(lending.getUserMembershipNumber());
        Book book = bookService.findByISBN(lending.getBookISBN());
        if(user==null){
            model.addAttribute("message", "The entered membership number is not valid!");
            model.addAttribute("lending", new LendingBook());
            return "lendingBook";
        }
         else if(book==null){
            model.addAttribute("message", "The entered ISBN is not valid!");
            model.addAttribute("lending", new LendingBook());
            return "lendingBook";
        }
        if(book.getCount()==0){
            model.addAttribute("message", "No copies of this book are available in the library!");
            model.addAttribute("lending", new LendingBook());
            return "lendingBook";
        }
        lending.setBook(book);
        lending.setUser(user);
        lendingBookService.lendBookToUser(lending);
        model.addAttribute("message", "The lending book was successfully!");
        model.addAttribute("lending", new LendingBook());
        return "lendingBook";
    }
}
