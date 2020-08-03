package com.spring.mno.diet.controller;

import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.mno.diet.domain.Diet_info;
import com.spring.mno.diet.service.Diet_infoService;
import com.spring.mno.user.domain.Dates;




@Controller
public class Diet_infoController {
	
	
	@Autowired
	private Diet_infoService diet_infoService; 
	
	@RequestMapping("/Diet_info_List")
	public ModelAndView Diet_info_list() {
		ModelAndView mav =new ModelAndView();
		mav.setViewName("Diet_info_List");
		return mav;
	}
	
	@RequestMapping("/List")
	public ModelAndView Diet_info_lists(Dates dates) {
		ModelAndView mav =new ModelAndView();
		ArrayList<Diet_info> diet_infolist=diet_infoService.diet_infos(dates);	
		mav.addObject("diet_infolist",diet_infolist);
		mav.setViewName("Diet_info_List");
		return mav;
	}
	
	@RequestMapping("/Diet")
	public ModelAndView Diet_info_regist() {

		ModelAndView mav =new ModelAndView();
		mav.setViewName("Diet_info_Regist");
		return mav;
	}
	
	
	@RequestMapping("/Diet_info_Regist" )
	public String Diet_info_registOn(Diet_info diet_info) {
		
		diet_infoService.addinfo(diet_info);
		return "redirect:/Diet";
	}
}
