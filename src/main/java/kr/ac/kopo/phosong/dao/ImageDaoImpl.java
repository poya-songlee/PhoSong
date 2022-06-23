package kr.ac.kopo.phosong.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.phosong.dto.ImageDTO;
import kr.ac.kopo.phosong.dto.TagDTO;
import kr.ac.kopo.phosong.utill.Filter;

@Repository
public class ImageDaoImpl implements ImageDao {
	@Autowired
	SqlSession sql;
	
	@Override
	public void add(ImageDTO image) {
		sql.insert("image.add",image);
	}

	@Override
	public List<ImageDTO> searchList(Filter filter) {
		return sql.selectList("image.searchList", filter);
	}
	


	@Override
	public ImageDTO loadingImg(String selectImg) {
		return sql.selectOne("image.loading",selectImg);
	}

	@Override
	public ImageDTO downloadImg(int code) {
		sql.update("image.countUp",code);
		return sql.selectOne("image.download",code);
	}

	@Override
	public void addTag(TagDTO tag) {
		sql.insert("image.addTag",tag);
	}

	@Override
	public List<String> loadingTag(int imageCode) {
		return sql.selectList("image.loadingTag", imageCode);
	}

	@Override
	public List<ImageDTO> relevantImg(List<String> tag) {
		return sql.selectList("image.relevantImg",tag);
	}


}
