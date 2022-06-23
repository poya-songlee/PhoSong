package kr.ac.kopo.phosong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.phosong.dao.MyPageDao;
import kr.ac.kopo.phosong.dto.ImageDTO;

@Service
public class MyPageServiceImpl implements MyPageService {

	@Autowired
	MyPageDao dao;

	@Override
	public void addCollection(ImageDTO vo) {
		dao.addCollection(vo);
	}
	@Override
	public void addMyDownload(ImageDTO vo) {
		dao.addMyDownload(vo);
	}


	@Override
	public List<ImageDTO> resultCollection(String id) {
		return dao.resultCollection(id);
	}

	@Override
	public List<ImageDTO> resultMyDownload(String id) {
		return dao.resultMyDownload(id);
	}
	@Override
	public List<ImageDTO> resultMyUpload(String id) {
		return dao.resultMyUpload(id);
	}
	

}
