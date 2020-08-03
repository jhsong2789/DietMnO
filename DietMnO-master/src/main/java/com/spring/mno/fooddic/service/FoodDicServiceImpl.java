package com.spring.mno.fooddic.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.mno.common.Criteria;
import com.spring.mno.community.dao.CommunityDAO;
import com.spring.mno.community.domain.CommunityVO;
import com.spring.mno.fooddic.dao.FoodDicDAO;
import com.spring.mno.fooddic.domain.FoodDicVO;

@Service
public class FoodDicServiceImpl implements FoodDicService {

	@Inject
	private FoodDicDAO dao;

	@Override
	public List<FoodDicVO> list() throws Exception {
		// TODO Auto-generated method stub
		return dao.list();
	}

	@Override
	public void write(FoodDicVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.write(vo);
	}

	@Override
	public FoodDicVO view(int fbno) throws Exception {
		// TODO Auto-generated method stub
		dao.updateViewCnt(fbno);
		return dao.view(fbno);
	}

	@Override
	public void modify(FoodDicVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.modify(vo);
	}

	@Override
	public void delete(int fbno) throws Exception {
		// TODO Auto-generated method stub
		dao.delete(fbno);
	}

	

	//listPage 구현
		@Override
		public List<FoodDicVO> listPage(Criteria cri) throws Exception {
			return dao.listPage(cri);
		}
	
		@Override
		public int getTotalCount(Criteria cri) throws Exception {
			return dao.getTotalCount(cri);
		}

}
