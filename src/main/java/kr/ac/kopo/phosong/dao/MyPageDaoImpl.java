package kr.ac.kopo.phosong.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.phosong.dto.ImageDTO;

@Repository
public class MyPageDaoImpl implements MyPageDao {

	@Autowired
	SqlSession sql;

	@Override
	public void addCollection(ImageDTO vo) {
		sql.insert("mypage.addCollection", vo);
	}
	@Override
	public void addMyDownload(ImageDTO vo) {
		sql.insert("mypage.addMyDownload", vo);
		
	}


	@Override
	public List<ImageDTO> resultCollection(String id) {
		return sql.selectList("mypage.resultCollection", id);
	}

	@Override
	public List<ImageDTO> resultMyDownload(String id) {
		return sql.selectList("mypage.resultMyDownload", id);
	}

	@Override
	public List<ImageDTO> resultMyUpload(String id) {
		return sql.selectList("mypage.resultMyUpload", id);
	}




}
