package kr.ac.kopo.phosong.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.phosong.dto.UserDTO;

@Repository
public class UserDaoImpl implements UserDao {
	@Autowired
	SqlSession sql;
	
	@Override
	public void add(UserDTO user) {
		sql.insert("user.add",user);
	}

	@Override
	public UserDTO login(UserDTO user) {
		return sql.selectOne("user.login", user);
	}

	@Override
	public UserDTO findID(UserDTO user) {
		return sql.selectOne("user.findID",user);
	}

	@Override
	public void findPW(UserDTO user) {
		sql.update("user.findPW", user);
	}

	@Override
	public int checkId(String id) {
		return sql.selectOne("user.checkId",id);
		
	}

	@Override
	public int checkEmail(String email) {
		return sql.selectOne("user.checkEmail",email);
	}

}
