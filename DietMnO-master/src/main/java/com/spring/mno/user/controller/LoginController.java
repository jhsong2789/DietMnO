package com.spring.mno.user.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spring.mno.user.domain.MemberVO;
import com.spring.mno.user.service.LoginService;

@Controller
public class LoginController {
	@Autowired
	private LoginService loginService; 
	
	@RequestMapping("/loginform")
	public ModelAndView loginform(HttpServletResponse response,HttpServletRequest request) {
		Cookie[] cookies = request.getCookies(); 
		if(cookies!=null){                                            // 
			for(int i=0; i<cookies.length; i++){                // 
				cookies[i].setMaxAge(0);                    // 
				cookies[i].setPath("/");
				response.addCookie(cookies[i]);        // 
			}
		}
		ModelAndView mav =new ModelAndView();
		mav.setViewName("loginForm");
		return mav;
	}
	
	@RequestMapping("/memberRegform")
	public ModelAndView memberReg() {
		ModelAndView mav =new ModelAndView();
		List<MemberVO> memberlist=loginService.getmembers();
		mav.addObject("memberlist",memberlist);
		mav.setViewName("memberReg");
		return mav;
	}
	
	@RequestMapping("/memberReg")
	public String addMember(MemberVO vo) throws IllegalStateException, IOException {
		String fileName = null;
		MultipartFile uploadFile = vo.getUploadFile();
		if (!uploadFile.isEmpty()) {
			String originalFileName = uploadFile.getOriginalFilename(); // 원래 이름
			String ext = FilenameUtils.getExtension(originalFileName); // 확장자 구하기
			UUID uuid = UUID.randomUUID(); // UUID 구하기
			fileName = uuid + "." + ext;
			uploadFile.transferTo(new File("D:\\upload\\" + fileName));
		}
		vo.setFileName(fileName);
		System.out.println(fileName);
		System.out.println(vo.getFileName());
		loginService.addMember(vo);
		return "redirect:/loginform";
	}
	
	@RequestMapping("/findidform")
	public ModelAndView  findid() {
		ModelAndView mav =new ModelAndView();
		List<MemberVO> memberlist=loginService.getmembers();
		mav.addObject("memberlist",memberlist);
		mav.setViewName("FindId");
		return mav;
	}
	
	@RequestMapping("/findpwform")
	public ModelAndView  findpw() {
		ModelAndView mav =new ModelAndView();
		List<MemberVO> memberlist=loginService.getmembers();
		mav.addObject("memberlist",memberlist);
		mav.setViewName("Findpw");
		return mav;
	}
	
	@RequestMapping("/login")
	public String  login(HttpServletResponse response,@RequestParam String id,@RequestParam String passwd1) {
		ModelAndView mav =new ModelAndView();
		boolean loginSuccess=loginService.login(id,passwd1,response);
		login2(loginSuccess);
		return "redirect:/login2?loginSuccess="+loginSuccess;
	}
	
	@RequestMapping("/login2")
	public ModelAndView  login2(boolean loginSuccess) {
		ModelAndView mav =new ModelAndView();
		
		if(loginSuccess) {
			mav.setViewName("home");			
		}
		else {			
			mav.addObject("loginSuccess",loginSuccess);
			mav.setViewName("loginForm");
		}
		return mav;
	}
	
	@RequestMapping("/memberinfo")
	public ModelAndView memberinfo(@RequestParam String id) {
		ModelAndView mav =new ModelAndView();
		MemberVO member=loginService.memberinfo(id);
		mav.addObject("member",member);
		mav.setViewName("Memberinfo");
		return mav;
	}
	
	@RequestMapping("/updateform")
	public ModelAndView updateform(@RequestParam String id) {
		ModelAndView mav=new ModelAndView();
		MemberVO member=loginService.memberinfo(id);
		mav.addObject("member",member);
		mav.setViewName("updateForm");
		return mav;
	}
	
	@RequestMapping(value = "/update")
	public String modifyMember(MemberVO vo) throws IllegalStateException, IOException {
		String fileName = null;
		MultipartFile uploadFile = vo.getUploadFile();
		if (!uploadFile.isEmpty()) {
			String originalFileName = uploadFile.getOriginalFilename(); // 원래 이름
			String ext = FilenameUtils.getExtension(originalFileName); // 확장자 구하기
			UUID uuid = UUID.randomUUID(); // UUID 구하기
			fileName = uuid + "." + ext;
			uploadFile.transferTo(new File("D:\\upload\\" + fileName));
		}
		vo.setFileName(fileName);
		loginService.modifyMember(vo);
		return "redirect:/memberinfo?id="+vo.getId();
	}
}
