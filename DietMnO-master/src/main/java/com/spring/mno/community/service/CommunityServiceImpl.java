package com.spring.mno.community.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.mno.common.Criteria;
import com.spring.mno.community.dao.CommunityDAO;
import com.spring.mno.community.domain.CommunityVO;

@Service
public class CommunityServiceImpl implements CommunityService {

	@Inject
	private CommunityDAO dao;

	@Override
	public List<CommunityVO> list() throws Exception {
		// TODO Auto-generated method stub
		return dao.list();
	}

	@Override
	public void write(CommunityVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.write(vo);
	}

	@Override
	public CommunityVO view(int bno) throws Exception {
		// TODO Auto-generated method stub
		dao.updateViewCnt(bno);
		return dao.view(bno);
	}

	@Override
	public void modify(CommunityVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.modify(vo);
	}

	@Override
	public void delete(int bno) throws Exception {
		// TODO Auto-generated method stub
		dao.delete(bno);
	}

	

	//listPage 구현
		@Override
		public List<CommunityVO> listPage(Criteria cri) throws Exception {
			return dao.listPage(cri);
		}
	
		@Override
		public int getTotalCount(Criteria cri) throws Exception {
			return dao.getTotalCount(cri);
		}

}
