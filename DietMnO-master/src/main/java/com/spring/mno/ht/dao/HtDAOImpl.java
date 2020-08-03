package com.spring.mno.ht.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.mno.common.Criteria;
import com.spring.mno.ht.domain.HtVO;


@Repository
public class HtDAOImpl implements HtDAO {

	@Inject
	private SqlSession sqlSession;

	private static String namespace = "com.spring.mno.mappers.ht";

	@Override
	public List<HtVO> list() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".list");
	}

	// 게시물작성
	@Override
	public void write(HtVO vo) throws Exception {

		sqlSession.insert(namespace + ".write", vo);
	}

	// 게시물 조회
	@Override
	public HtVO view(int hbno) throws Exception {

		return sqlSession.selectOne(namespace + ".view", hbno);
	}

	// 게시물 수정
	@Override
	public void modify(HtVO vo) throws Exception {
		sqlSession.update(namespace + ".modify", vo);
	}

	// 게시물 삭제
	@Override
	public void delete(int hbno) throws Exception {
		sqlSession.delete(namespace + ".delete", hbno);
	}

	// 게시물 총 갯수
	@Override
	public int getTotalCount(Criteria cri) throws Exception {
		return sqlSession.selectOne(namespace+".gettotalcount",cri);
	}

	//listPage 구현
		@Override
		public List<HtVO> listPage(Criteria cri) throws Exception {
			return sqlSession.selectList(namespace+".listPage",cri);
		}
	//조회수 증가
	@Override
    public void updateViewCnt(int hbno) throws Exception {
      sqlSession.update(namespace + ".updateViewCnt", hbno);
    }
	

}
