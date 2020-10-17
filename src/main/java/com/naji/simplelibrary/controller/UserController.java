package com.naji.simplelibrary.controller;

import com.naji.simplelibrary.model.entity.User;
import com.naji.simplelibrary.service.UserService;
import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;
import java.io.*;
import java.sql.Blob;
import java.util.ArrayList;
import java.util.List;

@Controller
public class UserController {

    UserService userService;

    @Autowired
    public UserController(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String getHomePage() {
        return "home";
    }

    @RequestMapping(value = "userManagement", method = RequestMethod.GET)
    public String getHomePage(Model model) {
        model.addAttribute("user", new User());
        return "userManagement";
    }


    @RequestMapping(value = "registerProcess", method = RequestMethod.POST)
    public String addUser(@ModelAttribute("user") User user,
                          @RequestParam CommonsMultipartFile[] photo,
                          Model model)  {

        if (!userService.isValidNationalCode(user.getNationalCode())) {
            model.addAttribute("message", "The entered national code was not valid!");

        } else if (userService.duplicateNationalCode(user.getNationalCode())) {
            model.addAttribute("message", "This national code is already registered before. Cannot register again!");
        }  else {
            if (photo != null && photo.length > 0) {
                for (CommonsMultipartFile aFile : photo){
                    user.setPicture(aFile.getBytes());
                }
            }
            userService.userRegister(user);
            model.addAttribute("message", user.getFirstName() + " " + user.getLastName() +
                    " registered successfully by membership number = " +
                    user.getMembershipNumber() + "!");
        }
        model.addAttribute("user", new User());
        return "userManagement";
    }

    @RequestMapping(value = "updateUser", method = RequestMethod.GET)
    public String updateUser(@ModelAttribute("user") User user,
                             Model model) throws UnsupportedEncodingException {
        List<User> userList = userService.findMaxMatch(user);
        System.out.println("update==>" + userList.toString());
        if (userList.size() != 1) {
            model.addAttribute("message", "A unique person with the entered profile could not be found. Try again!");
            model.addAttribute("user", new User());
            return "userManagement";
        } else {
            User newUser = userList.get(0);
            newUser.setBase64Encoded(new String(Base64.encodeBase64(newUser.getPicture()), "UTF-8"));
            model.addAttribute("user", newUser);
            return "updateUser";
        }
    }


    @RequestMapping(value = "userUpdateProcess", method = RequestMethod.POST)
    public String userUpdateProcess(@ModelAttribute("user") User user,
                                    @RequestParam CommonsMultipartFile[] photo,
                                    Model model) {

        User preUser = userService.findUserByMembershipNumber(user.getMembershipNumber());
        if (user.getNationalCode() != null) {
            if (!userService.isValidNationalCode(user.getNationalCode())) {
                model.addAttribute("message", "The entered national code was not valid!");
                model.addAttribute("user", new User());
                return "userManagement";
            }
        }
        if (photo != null && photo.length > 0) {
            for (CommonsMultipartFile aFile : photo) {
                user.setPicture(aFile.getBytes());
            }
        }
        System.out.println(user.toString());
        System.out.println(preUser.toString());
         if(userService.updateUserInfo(preUser, user)){
            model.addAttribute("message", "User information update was successful!");
            model.addAttribute("user", new User());
            return "userManagement";
        }else {
            model.addAttribute("message", "Updating user information has not been successful. Try again!");

        }
        model.addAttribute("user", preUser);
        return "updateUser";
    }


    @RequestMapping(value = "deleteUser", method = RequestMethod.GET)
    public String deleteUser(@ModelAttribute("user") User user,
                             Model model) {
        if (!userService.deleteUser(user)) {
            model.addAttribute("message", "A unique person with the entered profile could not be found. Try again!");
        }
        model.addAttribute("message", "Deleting operation completed successfully!");
        model.addAttribute("user", new User());
        return "userManagement";
    }

    @RequestMapping(value = "searchUser", method = RequestMethod.GET)
    public String searchUser(@ModelAttribute("user") User user,
                             Model model) throws UnsupportedEncodingException {

        List<User> userList = userService.findMaxMatch(user);
        System.out.println("search==>" + userList.toString());
        if (userList.size() == 0) {
            model.addAttribute("message", "There is no user with this profile!");
            model.addAttribute("user", new User());
            return "userManagement";
        } else {
            for (User us:
                 userList) {
                us.setBase64Encoded(new String(Base64.encodeBase64(us.getPicture()), "UTF-8"));
            }
            model.addAttribute("userList", userList);
            return "showUsers";
        }
    }


}
