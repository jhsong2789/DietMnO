package com.spring.mno.bmi.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.mno.bmi.domain.BmiVO;
import com.spring.mno.bmi.service.BmiService;
import com.spring.mno.user.domain.Dates;

@Controller
public class BmiController {
	
	@Autowired
	private BmiService bmiService;
	
	
	@RequestMapping(value = "/BmiCalcs")
	public String addBmi(BmiVO bmi) throws Exception {
		bmiService.addbmi(bmi);
		return "redirect:/bmi";
	}

	@RequestMapping("/bmi")
	public ModelAndView main() {
		ModelAndView mav =new ModelAndView();
		mav.setViewName("BmiCalc");
		return mav;
	}
	@RequestMapping("/bmilistform")
	public ModelAndView bmilistform() {
		ModelAndView mav =new ModelAndView();
		mav.setViewName("Bmi_List");
		return mav;
	}
	
	@RequestMapping("/bmilist")
	public ModelAndView bmi_lists(Dates dates) {
		ModelAndView mav =new ModelAndView();
		ArrayList<BmiVO> bmis=bmiService.getbmis(dates);
		mav.addObject("bmis",bmis);
		mav.setViewName("Bmi_List");
		return mav;
	}


}
