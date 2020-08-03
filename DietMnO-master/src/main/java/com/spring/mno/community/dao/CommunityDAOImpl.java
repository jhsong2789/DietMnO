package com.spring.mno.community.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.mno.common.Criteria;
import com.spring.mno.community.domain.CommunityVO;

@Repository
public class CommunityDAOImpl implements CommunityDAO {

	@Inject
	private SqlSession sqlSession;

	private static String namespace = "com.spring.mno.mappers.community";

	@Override
	public List<CommunityVO> list() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".list");
	}

	// 게시물작성
	@Override
	public void write(CommunityVO vo) throws Exception {

		sqlSession.insert(namespace + ".write", vo);
	}

	// 게시물 조회
	@Override
	public CommunityVO view(int bno) throws Exception {

		return sqlSession.selectOne(namespace + ".view", bno);
	}

	// 게시물 수정
	@Override
	public void modify(CommunityVO vo) throws Exception {
		sqlSession.update(namespace + ".modify", vo);
	}

	// 게시물 삭제
	@Override
	public void delete(int bno) throws Exception {
		sqlSession.delete(namespace + ".delete", bno);
	}

	// 게시물 총 갯수
	@Override
	public int getTotalCount(Criteria cri) throws Exception {
		return sqlSession.selectOne(namespace+".gettotalcount",cri);
	}

	//listPage 구현
		@Override
		public List<CommunityVO> listPage(Criteria cri) throws Exception {
			return sqlSession.selectList(namespace+".listPage",cri);
		}
	//조회수 증가
	@Override
    public void updateViewCnt(int bno) throws Exception {
      sqlSession.update(namespace + ".updateViewCnt", bno);
    }
	

}
