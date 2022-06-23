package kr.ac.kopo.phosong.dao;

import kr.ac.kopo.phosong.dto.UserDTO;

public interface UserDao {

	void add(UserDTO user);

	UserDTO login(UserDTO user);

	UserDTO findID(UserDTO user);

	void findPW(UserDTO user);

	int checkId(String id);

	int checkEmail(String email);

}
