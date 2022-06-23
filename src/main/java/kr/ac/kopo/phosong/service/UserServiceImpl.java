package kr.ac.kopo.phosong.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.phosong.dao.UserDao;
import kr.ac.kopo.phosong.dto.UserDTO;
import kr.ac.kopo.phosong.utill.RandomPassword;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	UserDao dao;

	@Override
	public void add(UserDTO user) {
		dao.add(user);
	}

	@Override
	public boolean login(UserDTO user) {
		UserDTO item = dao.login(user);
		if (item != null) {
			user.setPassword(null);
			user.setEmail(item.getEmail());
			return true;
		}
		return false;
	}

	@Override
	public boolean findId(UserDTO user) {
		UserDTO item;

		item = dao.findID(user);
		if (item != null) {
			user.setId(item.getId());
			return true;
		} else
			return false;
	}

	public boolean findPw(UserDTO user) {
		UserDTO item = dao.findID(user);
		if (item != null && item.getId().equals(user.getId())) {
			user.setPassword(RandomPassword.getRamdomPassword());
			dao.findPW(user);
			return true;
		} else
			return false;
	}

	@Override
	public boolean checkId(String id) {
		if(dao.checkId(id) == 0)
			return true;
		else
			return false;
	}

	@Override
	public boolean checkEmail(String email) {
		if(dao.checkEmail(email) == 0)
			return true;
		else
			return false;
	}


}
