package com.spring.mno.rec.controller;

import java.util.ArrayList;
import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.mno.rec.domain.Recommendvo;
import com.spring.mno.rec.service.RecommendService;
import com.spring.mno.user.domain.Dates;
import com.spring.mno.user.domain.MemberVO;
import com.spring.mno.user.service.LoginService;
import com.spring.mno.diet.domain.paylist;





@Controller
public class RecommendController {
		@Autowired
		private RecommendService recommendService;
		
		@Autowired
		private LoginService loginService; 
		
		
		@RequestMapping("/rec")
		public ModelAndView rec(@RequestParam int rec_category) {
			ArrayList<Recommendvo> recommends=recommendService.getrecommend(rec_category);
			ModelAndView mav =new ModelAndView();
			mav.addObject("recommends",recommends);
			mav.setViewName("Recommend");
			return mav;
		}
		
		/*@RequestMapping("/rec")
		public ModelAndView rec() {
			ArrayList<Recommendvo> recommends=recommendService.getrecommend();
			ModelAndView mav =new ModelAndView();
			mav.addObject("recommends",recommends);
			mav.setViewName("Recommend");
			return mav;
		}*/
		
		@RequestMapping("/recform")
		public ModelAndView recform() {
			ModelAndView mav =new ModelAndView();	
			mav.setViewName("Recommend");
			return mav;
		}
		
		@RequestMapping("/recRegform")
		public ModelAndView recregform() {
			ModelAndView mav =new ModelAndView();
			mav.setViewName("RecommendReg");
			return mav;
		}
		
		@RequestMapping("/recReg")
		public String recReg(Recommendvo recommend) {
			recommendService.insertRec(recommend);
			return "redirect:/recRegform";
		}
		
		
		@RequestMapping("/pay")
		public ModelAndView pay(@RequestParam int[] rec_id ,@RequestParam String user) {
			ModelAndView mav =new ModelAndView();
			MemberVO member=loginService.memberinfo(user);
			ArrayList<Recommendvo> recommends2=recommendService.getrecommend2(rec_id);
			int sum=recommendService.sum(recommends2);
			mav.addObject("recommends",recommends2);
			mav.addObject("member",member);
			mav.addObject("sum",sum);
			mav.setViewName("pay");
			return mav;
		}
		
		@RequestMapping("/pay1")
		public ModelAndView pay1(@RequestParam String id) {
			ModelAndView mav =new ModelAndView();
			int [] rec_id=Arrays.stream(id.split(",")).mapToInt(Integer::parseInt).toArray();
			ArrayList<Recommendvo> recommends2=recommendService.getrecommend2(rec_id);
			mav.addObject("recommends",recommends2);
			mav.setViewName("Reco");
			return mav;
		}
		@RequestMapping("/pay2")
		public ModelAndView pay2(@RequestParam String id ,@RequestParam String memberid) {
			ModelAndView mav =new ModelAndView();
			int [] rec_id=Arrays.stream(id.split(",")).mapToInt(Integer::parseInt).toArray();
			ArrayList<Recommendvo> recommends2=recommendService.getrecommend2(rec_id);
			MemberVO member=loginService.memberinfo(memberid);	
			mav.addObject("member",member);
			mav.addObject("recommends",recommends2);
			mav.setViewName("Reco");
			return mav;
		}
		
		
		@RequestMapping("/paySuccess")
		public String paySuccess(@RequestParam String id,@RequestParam int sum) {
			recommendService.insertpay(id,sum);
			return "redirect:/paylistform";
		}
		
		
		@RequestMapping("/paylistform")
		public ModelAndView paylistform() {
			ModelAndView mav =new ModelAndView();
			mav.setViewName("paylist");
			return mav;
		}
		
		@RequestMapping("/paylist")
		public ModelAndView paylist(Dates dates) {
			ModelAndView mav =new ModelAndView();
			ArrayList<paylist> paylist= recommendService.getpaylist(dates);
			System.out.println(dates.getDate1());
			System.out.println(dates.getDate2());
			mav.addObject("paylist",paylist);
			mav.setViewName("paylist");
			return mav;
		}
		
		
		
		@RequestMapping("/allpaylistform")
		public ModelAndView allpaylistform() {
			ModelAndView mav =new ModelAndView();
			mav.setViewName("allpaylist");
			return mav;
		}
		@RequestMapping("/allpaylist")
		public ModelAndView allpaylist(Dates dates) {
			ModelAndView mav =new ModelAndView();
			ArrayList<paylist> paylist= recommendService.getpaylists(dates);
			mav.addObject("paylist",paylist);
			mav.setViewName("allpaylist");
			return mav;
		}
		
	
		
}
