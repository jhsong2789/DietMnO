package com.spring.mno.fooddic.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.mno.common.Criteria;
import com.spring.mno.community.domain.CommunityVO;
import com.spring.mno.fooddic.domain.FoodDicVO;

@Repository
public class FoodDicDAOImpl implements FoodDicDAO {

	@Inject
	private SqlSession sqlSession;

	private static String namespace = "com.spring.mno.mappers.fooddic";

	@Override
	public List<FoodDicVO> list() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".list");
	}

	// 게시물작성
	@Override
	public void write(FoodDicVO vo) throws Exception {

		sqlSession.insert(namespace + ".write", vo);
	}

	// 게시물 조회
	@Override
	public FoodDicVO view(int fbno) throws Exception {

		return sqlSession.selectOne(namespace + ".view", fbno);
	}

	// 게시물 수정
	@Override
	public void modify(FoodDicVO vo) throws Exception {
		sqlSession.update(namespace + ".modify", vo);
	}

	// 게시물 삭제
	@Override
	public void delete(int fbno) throws Exception {
		sqlSession.delete(namespace + ".delete", fbno);
	}

	// 게시물 총 갯수
	@Override
	public int getTotalCount(Criteria cri) throws Exception {
		return sqlSession.selectOne(namespace+".gettotalcount",cri);
	}

	//listPage 구현
		@Override
		public List<FoodDicVO> listPage(Criteria cri) throws Exception {
			return sqlSession.selectList(namespace+".listPage",cri);
		}
	//조회수 증가
	@Override
    public void updateViewCnt(int fbno) throws Exception {
      sqlSession.update(namespace + ".updateViewCnt", fbno);
    }
	

}
