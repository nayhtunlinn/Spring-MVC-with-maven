package com.nay.springdemo.dao;

import com.nay.springdemo.entity.User;

public interface UserDao {

	User findByUserName(String userName);

	void save(User user);

}
