package com.naji.simplelibrary.service;

import com.naji.simplelibrary.model.dao.UserDao;
import com.naji.simplelibrary.model.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.criteria.CriteriaBuilder;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class UserService {
    UserDao userDao;

    public void userRegister(User user) {

        Optional<User> found = userDao.findFirstByMembershipNumber(10001);
        if (found.isPresent()) {
            int lastNumber = userDao.max();
            if (lastNumber > 0) {
                user.setMembershipNumber(lastNumber + 1);
            } else {
                user.setMembershipNumber(10001);
            }
        } else {
            user.setMembershipNumber(10001);
        }
        userDao.save(user);
    }

    public boolean deleteUser(User user){
        List<User> users= findMaxMatch(user);
        if(users.size()!=1){
            return false;
        }
        userDao.delete(users.get(0));
        return true;
    }

    public List<User> findMaxMatch(User user) {

        List<User> users= new ArrayList<>();

        users= userDao.findAll(UserDao.findMaxMatch(user.getFirstName(),
                user.getLastName(), user.getNationalCode(), user.getMembershipNumber()));
        return users;
    }

    public boolean updateUserInfo(User preUser, User newUser){
        if(newUser.getFirstName()!=null){
            preUser.setFirstName(newUser.getFirstName());
        }
        if(newUser.getLastName()!=null){
            preUser.setLastName(newUser.getLastName());
        }
        if(newUser.getPicture().length!=0){
            preUser.setPicture(newUser.getPicture());
        }
        if(newUser.getNationalCode()!=null){
            if(!preUser.getNationalCode().equals(newUser.getNationalCode())){
                if(duplicateNationalCode(newUser.getNationalCode())){
                    return false;
                }
                else {
                    preUser.setNationalCode(newUser.getNationalCode());
                }
            }
        }

        userDao.save(preUser);
        return true;
    }

    public User findUserByMembershipNumber(Integer number){
        Optional<User> found = userDao.findFirstByMembershipNumber(number);
        if(found.isPresent()){
            return found.get();
        }
        return null;
    }


    public boolean isValidNationalCode(String code) {
        if (code.length() != 10)
            return false;


        for (int i = 0; i < code.length(); i++) {
            if (!Character.isDigit(code.charAt(i)))
                return false;
        }

        return true;
    }

    public boolean duplicateNationalCode(String code) {
        Optional<User> found = userDao.findFirstByNationalCode(code);
        if (found.isPresent())
            return true;

        return false;
    }


    @Autowired
    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }
}
