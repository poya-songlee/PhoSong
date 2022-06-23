package kr.ac.kopo.phosong.utill;


import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.springframework.web.multipart.MultipartFile;

import kr.ac.kopo.phosong.dto.ImageDTO;

public class FileUploader {
	final String uploadPath = "c:/upload/";
	
	public ImageDTO upload(MultipartFile file) {
		ImageDTO image = new ImageDTO();
		String uuid = UUID.randomUUID().toString();
		String safeFile = uploadPath + uuid + "_" + file.getOriginalFilename();
	
		try {
	        	file.transferTo(new File(safeFile));
	        	image.setImageName(file.getOriginalFilename()); //파일 원본 이름
	        	image.setImageUuid(uuid + "_" + file.getOriginalFilename());
	    		image.setImageFormat(image.getImageName().substring(image.getImageName().lastIndexOf(".")+1)); //파일 포맷
	    		BufferedImage img =  ImageIO.read(new File(safeFile));
	    		image.setImageWidth(img.getWidth());
	    		image.setImageHeight(img.getHeight());
	        	
	        } catch (IllegalStateException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        } catch (IOException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }
		return image;
	}
}
