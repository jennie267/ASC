package com.object.asc.user.service;

import java.sql.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.object.asc.user.dao.UserDAO;
import com.object.asc.user.domain.User;

/**
 *
 * 유저 인터페이스 구현 클래스
 * 
 * @패키지 : com.object.asc.user.service
 * @파일명 : UserServiceImpl.java
 * @작성자 : 이현명
 * @작성일 : 2017. 6. 01.
 *
 */
@Service
public class UserServiceImpl implements UserService {
   
	@Inject
	private UserDAO dao;

	@Override
	public void register(User user) {
		dao.register(user);
	}
	
	@Override
	public boolean idCheck(String id) {
		return dao.idCheck(id);
	}

	@Override
	public void modify(User user) {
		dao.modify(user);
	}

	@Override
	public User login(User user) {
		return dao.login(user);
	}

	@Override
	public void keepLogin(String id, String sessionId, Date sessionLimit) {
		dao.keepLogin(id, sessionId, sessionLimit);
	}

	@Override
	public User checkUserWithSessionKey(String cookieValue) {
		return dao.checkUserWithSessionKey(cookieValue);
	}

	@Override
	public User get(int userNo) {
		return dao.get(userNo);
	}

	@Override
	public void delete(int userNo) {
		dao.delete(userNo);
		
	}

	@Override
	public List<String> userFind(String id) {
		return dao.userFind(id+"%");
	}

	@Override
	public int userIdFind(String id) {
		return dao.userIdFind(id);
	}

	@Override
	public String findId(String name, String phone) {
		return dao.findId(name, phone);
	}

	@Override
	public String findPw(String id, String name, String phone) {
		return dao.findPw(id, name, phone);
	}

	@Override
	public void createNewPw(String id, String password) {
		dao.createNewPw(id, password);
		
	}

	@Override
	public void setStatus(String id) {
		dao.setStatus(id);
		
	}

	
}