package kr.ac.kopo.phosong.dao;

import java.util.List;

import kr.ac.kopo.phosong.dto.ImageDTO;
import kr.ac.kopo.phosong.utill.Filter;

public interface MyPageDao {

	void addCollection(ImageDTO vo);
	void addMyDownload(ImageDTO vo);
	
	List<ImageDTO> resultCollection(String id);
	List<ImageDTO> resultMyDownload(String id);
	List<ImageDTO> resultMyUpload(String id, Filter filter);

}
