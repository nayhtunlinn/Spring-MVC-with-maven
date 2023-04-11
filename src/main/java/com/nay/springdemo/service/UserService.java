package com.nay.springdemo.service;

import org.springframework.security.core.userdetails.UserDetailsService;

import com.nay.springdemo.entity.User;
import com.nay.springdemo.user.CrmUser;


public interface UserService extends UserDetailsService {
	
	 User findByUserName(String userName);

	 void save(CrmUser crmUser);

}
