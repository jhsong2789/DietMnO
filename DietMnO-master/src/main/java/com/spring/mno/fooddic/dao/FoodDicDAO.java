package com.spring.mno.fooddic.dao;

import java.util.List;

import com.spring.mno.common.Criteria;
import com.spring.mno.community.domain.CommunityVO;
import com.spring.mno.fooddic.domain.FoodDicVO;

public interface FoodDicDAO {
	// 게시판 목록
	public List<FoodDicVO> list() throws Exception;

	// 게시물 작성
	public void write(FoodDicVO vo) throws Exception;

	// 게시물 조회
	public FoodDicVO view(int fbno) throws Exception;

	// 게시물 수정
	public void modify(FoodDicVO vo) throws Exception;

	// 게시뮬 삭제
	public void delete(int fbno) throws Exception;

	// 게시물 총 갯수
	int getTotalCount(Criteria cri) throws Exception; 
		
	//listPage 메소드 추가
	List<FoodDicVO> listPage(Criteria cri) throws Exception;

	//조회수 증가
	public void updateViewCnt(int fbno) throws Exception;
	
}
