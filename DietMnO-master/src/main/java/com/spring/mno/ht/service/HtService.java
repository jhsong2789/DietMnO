package com.spring.mno.ht.service;

import java.util.List;

import com.spring.mno.common.Criteria;
import com.spring.mno.ht.domain.HtVO;


public interface HtService {

	public List<HtVO> list() throws Exception;

	public void write(HtVO vo) throws Exception;

	public HtVO view(int hbno) throws Exception;

	public void modify(HtVO vo) throws Exception;

	public void delete(int hbno) throws Exception;

	int getTotalCount(Criteria cri) throws Exception;

	//listPage 메소드 추가
	List<HtVO> listPage(Criteria cri) throws Exception;


	
}
