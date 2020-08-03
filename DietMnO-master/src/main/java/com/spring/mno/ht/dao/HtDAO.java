package com.spring.mno.ht.dao;

import java.util.List;

import com.spring.mno.common.Criteria;
import com.spring.mno.ht.domain.HtVO;

public interface HtDAO {
	// 게시판 목록
	public List<HtVO> list() throws Exception;

	// 게시물 작성
	public void write(HtVO vo) throws Exception;

	// 게시물 조회
	public HtVO view(int hbno) throws Exception;

	// 게시물 수정
	public void modify(HtVO vo) throws Exception;

	// 게시뮬 삭제
	public void delete(int hbno) throws Exception;

	// 게시물 총 갯수
	int getTotalCount(Criteria cri) throws Exception; 
		
	//listPage 메소드 추가
	List<HtVO> listPage(Criteria cri) throws Exception;

	//조회수 증가
	public void updateViewCnt(int hbno) throws Exception;
	
}
