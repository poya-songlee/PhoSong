package kr.ac.kopo.phosong.service;

import java.util.List;

import kr.ac.kopo.phosong.dto.ImageDTO;
import kr.ac.kopo.phosong.utill.Filter;

public interface ImageService {

	void add(ImageDTO image, String[] tag);

	List<ImageDTO> list(Filter filter);

	ImageDTO loadingImg(String selectImg);

	List<String> loadingTag(int imageCode);
	
	ImageDTO downloadImg(int code);

	List<ImageDTO> relevantImg(List<String> tag, ImageDTO img);



	

}
