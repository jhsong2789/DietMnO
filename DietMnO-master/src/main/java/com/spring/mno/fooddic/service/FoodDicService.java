package com.spring.mno.fooddic.service;

import java.util.List;

import com.spring.mno.common.Criteria;
import com.spring.mno.community.domain.CommunityVO;
import com.spring.mno.fooddic.domain.FoodDicVO;

public interface FoodDicService {

	public List<FoodDicVO> list() throws Exception;

	public void write(FoodDicVO vo) throws Exception;

	public FoodDicVO view(int fbno) throws Exception;

	public void modify(FoodDicVO vo) throws Exception;

	public void delete(int fbno) throws Exception;

	int getTotalCount(Criteria cri) throws Exception;

	//listPage 메소드 추가
	List<FoodDicVO> listPage(Criteria cri) throws Exception;


	
}
