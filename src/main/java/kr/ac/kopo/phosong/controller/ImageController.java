package kr.ac.kopo.phosong.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.ac.kopo.phosong.dto.ImageDTO;
import kr.ac.kopo.phosong.dto.UserDTO;
import kr.ac.kopo.phosong.service.ImageService;
import kr.ac.kopo.phosong.service.MyPageService;
import kr.ac.kopo.phosong.utill.FileDownloader;
import kr.ac.kopo.phosong.utill.FileUploader;
import kr.ac.kopo.phosong.utill.Filter;

@Controller
@RequestMapping("/image")
public class ImageController {
	final String path = "image/";

	@Autowired
	ImageService service;

	@Autowired
	MyPageService Myservice;

	@RequestMapping("/")
	public String search(Model model,Filter filter) {
		List<ImageDTO> image = service.list(filter);
		model.addAttribute("image", image);
		return path + "list";
	}

	@ResponseBody
	@PostMapping("/list")
	public List<ImageDTO> searchFilter(Model model, @RequestBody Filter filter) {
		List<ImageDTO> image = service.list(filter);
		model.addAttribute("image", image);
		return image;
	}
	
	
	@GetMapping("/fileUpload")
	public String fileUpload() {
		return path + "fileUpload";
	}

	@Transactional
	@PostMapping("/fileUpload")
	public String fileUpload(MultipartHttpServletRequest uploadfile, HttpSession session, Model model) {
		UserDTO user = (UserDTO) session.getAttribute("user");
		FileUploader file = new FileUploader();
		ImageDTO image = file.upload(uploadfile.getFile("file"));
		image.setImageLicense(uploadfile.getParameter("check_license"));
		image.setId(user.getId());
		String[] tag = uploadfile.getParameterValues("tag");
		System.out.println(tag[0]);
		service.add(image, tag);
		return "redirect:..";
	}

	@GetMapping("/Loding/{selectImg}")
	public String Loding(@PathVariable String selectImg, Model model) {
		ImageDTO img = service.loadingImg(selectImg);
		List<String> tag = service.loadingTag(img.getImageCode());
		List<ImageDTO> relevant = service.relevantImg(tag, img);
		model.addAttribute("img", img);
		model.addAttribute("tag", tag);
		model.addAttribute("relevant", relevant);

		return path + "fileDownload";
	}

	@GetMapping("/fileDownload/{code}")
	public void fileDownload(@PathVariable int code, HttpServletResponse response, HttpSession session)
			throws Exception {
		ImageDTO image = service.downloadImg(code);
		UserDTO user = (UserDTO) session.getAttribute("user");
		FileDownloader file = new FileDownloader();
		file.download(image.getImageUuid(), response);

		if (user != null) { // 다운받은 사진 정보와, 세션에 저장된 내 로그인 정보를 넘겨줌
			ImageDTO vo = new ImageDTO();
			vo.setId(user.getId());
			vo.setImageCode(image.getImageCode());
			Myservice.addMyDownload(vo);
		}
	}

	@ResponseBody
	@PostMapping("/addCollection")
	public String addCollection(@RequestBody int code,HttpSession session) {
		UserDTO user = (UserDTO) session.getAttribute("user");
		if(user != null) {
			ImageDTO image = service.downloadImg(code);
			ImageDTO vo = new ImageDTO();
			vo.setId(user.getId());
			vo.setImageCode(image.getImageCode());
			Myservice.addCollection(vo);
			return "success";
		}
		return "fail";
	}

}
