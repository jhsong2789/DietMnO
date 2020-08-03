package com.spring.mno.community.service;

import java.util.List;

import com.spring.mno.common.Criteria;
import com.spring.mno.community.domain.CommunityVO;

public interface CommunityService {

	public List<CommunityVO> list() throws Exception;

	public void write(CommunityVO vo) throws Exception;

	public CommunityVO view(int bno) throws Exception;

	public void modify(CommunityVO vo) throws Exception;

	public void delete(int bno) throws Exception;

	int getTotalCount(Criteria cri) throws Exception;

	//listPage 메소드 추가
	List<CommunityVO> listPage(Criteria cri) throws Exception;


	
}
