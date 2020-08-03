package com.spring.mno.ht.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.mno.common.Criteria;
import com.spring.mno.ht.dao.HtDAO;
import com.spring.mno.ht.domain.HtVO;


@Service
public class HtServiceImpl implements HtService {

	@Inject
	private HtDAO dao;

	@Override
	public List<HtVO> list() throws Exception {
		// TODO Auto-generated method stub
		return dao.list();
		
	}

	@Override
	public void write(HtVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.write(vo);
	}

	@Override
	public HtVO view(int hbno) throws Exception {
		// TODO Auto-generated method stub
		dao.updateViewCnt(hbno);
		return dao.view(hbno);
	}

	@Override
	public void modify(HtVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.modify(vo);
	}

	@Override
	public void delete(int hbno) throws Exception {
		// TODO Auto-generated method stub
		dao.delete(hbno);
	}

	

	//listPage 구현
		@Override
		public List<HtVO> listPage(Criteria cri) throws Exception {
			return dao.listPage(cri);
		}
	
		@Override
		public int getTotalCount(Criteria cri) throws Exception {
			return dao.getTotalCount(cri);
		}

}
