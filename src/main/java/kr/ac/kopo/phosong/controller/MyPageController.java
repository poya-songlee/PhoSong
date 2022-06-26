package kr.ac.kopo.phosong.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.ac.kopo.phosong.dto.ImageDTO;
import kr.ac.kopo.phosong.dto.UserDTO;
import kr.ac.kopo.phosong.service.ImageService;
import kr.ac.kopo.phosong.service.MyPageService;
import kr.ac.kopo.phosong.utill.Filter;

@Controller
@RequestMapping("/mypage")
public class MyPageController {
	final String path = "mypage/";

	@Autowired
	MyPageService service;

	
	
	@RequestMapping({ "/", "/collection" })
	public String collection(Model model, HttpSession session) {
		UserDTO user = (UserDTO) session.getAttribute("user");
		List<ImageDTO> image = service.resultCollection(user.getId());
		model.addAttribute("collection", image);
		return path + "collection";
	}
	
	@RequestMapping("/mydownload")
	public String mydownload(Model model,HttpSession session) {
		UserDTO user = (UserDTO) session.getAttribute("user");
		List<ImageDTO> image = service.resultMyDownload(user.getId());
		model.addAttribute("mydownload",image);
		return path + "mydownload";
	}
	
	@RequestMapping("/myupload")
	public String myupload(Model model, HttpSession session, Filter filter) {
		System.out.println("get");
		System.out.println(filter.getOrder());
		UserDTO user = (UserDTO) session.getAttribute("user");
		List<ImageDTO> image = service.resultMyUpload(user.getId(), filter);
		model.addAttribute("myupload",image);
		return path + "myupload";

	}


}
