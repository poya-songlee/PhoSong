package kr.ac.kopo.phosong.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.ac.kopo.phosong.component.MailComponent;
import kr.ac.kopo.phosong.dto.ImageDTO;
import kr.ac.kopo.phosong.dto.UserDTO;
import kr.ac.kopo.phosong.service.ImageService;
import kr.ac.kopo.phosong.service.UserService;
import kr.ac.kopo.phosong.utill.Filter;

@Controller
@RequestMapping("/")
public class RootController {

	@Autowired
	UserService userService;
	
	@Autowired
	ImageService imageService;
	
	@Autowired
	MailComponent mail;

	@RequestMapping("/")
	public String index(Model model,Filter filter) {
		filter.setSearch("계절");
		List<ImageDTO> image = imageService.list(filter);
		model.addAttribute("indexImage",image);
		return "index";
	}

	@GetMapping("/login")
	public String login() {
		return "login";
	}

	@PostMapping("/login")
	public String login(UserDTO user, HttpSession session, RedirectAttributes ra) {
		if (userService.login(user)) {
			session.setAttribute("user", user);
			return "redirect:.";
		}
		ra.addFlashAttribute("msg", "로그인 실패");
		return "redirect:/login";
	}

	@GetMapping("/signup")
	public String singup() {
		return "signup";
	}

	@PostMapping("/signup")
	public String signup(UserDTO user) {
		userService.add(user);
		return "redirect:/login";
	}
	
	@ResponseBody
	@PostMapping("/checkId")
	public String checkId(@RequestBody String id) {
		if(userService.checkId(id))
			return "success";
		else
			return "fail";
	}
	
	@ResponseBody
	@PostMapping("/checkEmail")
	public String checkEmail(@RequestBody String email) {
		System.out.println(email);
		if(userService.checkEmail(email))
			return "success";
		else
			return "fail";
	}
	

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:.";
	}

	@GetMapping("/user_find")
	public String user_find() {
		return "user_find";
	}

	@PostMapping("/user_find")
	public String user_find(UserDTO user, RedirectAttributes ra) {
		// 아이디 찾기일때
		if (user.getId() == null) {
			if (userService.findId(user)) {
				ra.addFlashAttribute("msg", user.getId());
				return "redirect:/user_find";
			}
			ra.addFlashAttribute("msg", "일치하는 정보를 찾을 수 없습니다.");
			return "redirect:/user_find";
		}

		// 비밀번호 찾기일때
		else {
			if (userService.findPw(user)) {
				mail.sendMailTest(user);
				return "redirect:/login";
			}
			ra.addFlashAttribute("msg", "일치하는 정보를 찾을 수 없습니다.");
			return "redirect:/user_find";

		}
	}
}
