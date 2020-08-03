package com.spring.mno.ht.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;

import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.mno.common.Criteria;
import com.spring.mno.common.PageMaker;
import com.spring.mno.community.domain.CommunityVO;
import com.spring.mno.community.service.CommunityService;

import com.spring.mno.fooddic.service.FoodDicService;
import com.spring.mno.ht.domain.HtVO;
import com.spring.mno.ht.service.HtService;

@Controller
@RequestMapping("/ht/*")
public class HtController {
	@Inject
	private HtService service;

	// 게시물 목록
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void getList(Model model) throws Exception {
		List<HtVO> list = null;
		list = service.list();
		model.addAttribute("list", list);
	}

	// 게시물 작성(create)
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public void getWrite(HtVO vo,
			@ModelAttribute("cri") Criteria cri) throws Exception {

	}

	// 게시물 작성(create)
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String postWrite(HtVO vo,
			Criteria cri,
			RedirectAttributes rttr) throws Exception {
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
		service.write(vo);
		rttr.addFlashAttribute("result", "registerOK");
		rttr.addAttribute("page", 1);
		rttr.addAttribute("perPageNum", cri.getPerPageNum());

		return "redirect:/ht/listPage";
	}

	// 게시물 조회
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public void getView(@RequestParam("hbno") int hbno,
			@ModelAttribute("cri") Criteria cri,
			Model model) throws Exception {

		HtVO vo = service.view(hbno);
		model.addAttribute("view", vo);
		
	}
	
	// 게시물 수정
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void getModify(@RequestParam("hbno") int hbno,
			@ModelAttribute("cri") Criteria cri, 
			Model model) throws Exception {

		HtVO vo = service.view(hbno);

		model.addAttribute("view",vo);
	}

	// 게시물 수정
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String postModify(HtVO vo,
			Criteria cri, 
			RedirectAttributes rttr) throws Exception {

		service.modify(vo);
		rttr.addFlashAttribute("result","saveOK");
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addAttribute("hbno", vo.getHbno());
		return "redirect:/ht/view";
	}

	// 게시물 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String getDelete(@RequestParam("hbno") int hbno,
			Criteria cri,
			RedirectAttributes rttr) throws Exception {

		service.delete(hbno);
		rttr.addFlashAttribute("result","removeOK");
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		return "redirect:/ht/listPage";
	}
	//게시물 목록+페이징
	@RequestMapping(value = "/listPage", method = RequestMethod.GET)
	public void listPage(Criteria cri, Model model) throws Exception{
		 //현재 페이지에 해당하는 게시물을 조회해 옴 
		List<HtVO> list = service.listPage(cri);
        //모델에 추가
		model.addAttribute("list",list);
        //PageMaker 객체 생성
		PageMaker pageMaker = new PageMaker(cri);
        //전체 게시물 수를 구함
		int totalCount = service.getTotalCount(cri);
        //pageMaker로 전달 -> pageMaker는 startPage, endPage, prev, next를 계산함
		pageMaker.setTotalCount(totalCount);
        //모델에 추가
		model.addAttribute("pageMaker", pageMaker);
	}
}
