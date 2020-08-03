package com.spring.mno.community.dao;

import java.util.List;

import com.spring.mno.common.Criteria;
import com.spring.mno.community.domain.CommunityVO;

public interface CommunityDAO {
	// 게시판 목록
	public List<CommunityVO> list() throws Exception;

	// 게시물 작성
	public void write(CommunityVO vo) throws Exception;

	// 게시물 조회
	public CommunityVO view(int bno) throws Exception;

	// 게시물 수정
	public void modify(CommunityVO vo) throws Exception;

	// 게시뮬 삭제
	public void delete(int bno) throws Exception;

	// 게시물 총 갯수
	int getTotalCount(Criteria cri) throws Exception; 
		
	//listPage 메소드 추가
	List<CommunityVO> listPage(Criteria cri) throws Exception;

	//조회수 증가
	public void updateViewCnt(int bno) throws Exception;
	
}
