package kr.ac.kopo.phosong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.kopo.phosong.dao.ImageDao;
import kr.ac.kopo.phosong.dto.ImageDTO;
import kr.ac.kopo.phosong.dto.TagDTO;
import kr.ac.kopo.phosong.utill.Filter;

@Service
public class ImageServiceImpl implements ImageService {

	@Autowired
	ImageDao dao;
	
	@Override
	@Transactional
	public void add(ImageDTO image,String[] tagList) {
		dao.add(image);
		
		for(String item : tagList) {
			TagDTO tag = new TagDTO();
			tag.setTagName(item);
			tag.setImageCode(image.getImageCode());
			dao.addTag(tag);
		}
	}

	@Override
	public List<ImageDTO> list(Filter filter) {
		
		String search = filter.getSearch();
		search = search.replaceAll("\\p{Z}", "");
		search = search.strip();
		filter.setSearch(search);
		return dao.searchList(filter);
	}

	@Override
	public ImageDTO loadingImg(String selectImg) {
		return dao.loadingImg(selectImg);
	}


	@Override
	public ImageDTO downloadImg(int code) {
		
		return dao.downloadImg(code);
	}

	@Override
	public List<String> loadingTag(int imageCode) {
		return dao.loadingTag(imageCode);
	}

	@Override
	public List<ImageDTO> relevantImg(List<String> tag, ImageDTO image) {
		return dao.relevantImg(tag);
	}

	//@Override
	//public List<ImageDTO> filter(String option) {
		

	//}










}
