package kr.ac.kopo.phosong.dao;

import java.util.List;

import kr.ac.kopo.phosong.dto.ImageDTO;
import kr.ac.kopo.phosong.dto.TagDTO;
import kr.ac.kopo.phosong.utill.Filter;

public interface ImageDao {

	void add(ImageDTO image);

	List<ImageDTO> searchList(Filter filter);

	ImageDTO loadingImg(String selectImg);

	ImageDTO downloadImg(int code);

	void addTag(TagDTO tag);

	List<String> loadingTag(int imageCode);

	List<ImageDTO> relevantImg(List<String> tag, int code);





}
