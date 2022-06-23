package kr.ac.kopo.phosong.service;

import org.springframework.stereotype.Service;

import kr.ac.kopo.phosong.dto.UserDTO;

@Service
public interface UserService {

	void add(UserDTO user);

	boolean login(UserDTO user);

	boolean findId(UserDTO user);

	boolean findPw(UserDTO user);

	boolean checkId(String id);

	boolean checkEmail(String email);

	
}
