package com.spring.mno.bmi.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mno.bmi.domain.BmiVO;
import com.spring.mno.user.domain.Dates;

@Repository
public class BmiDAOImple implements BmiDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private static String namespace = "com.spring.mno.mappers.community";
	@Override
	public void insertBmi(BmiVO bmi) {
		// TODO Auto-generated method stub
//		MemberMapper na = sqlSession.getMapper(MemberMapper.class);
//		memberMapper.insertBmi(bmi);
		sqlSession.insert(namespace+".insertBmi",bmi);
	}

	@Override
	public ArrayList<BmiVO> getbmis(Dates dates) {
		// TODO Auto-generated method stub
//		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
//		ArrayList<BmiVO> bmis=memberMapper.getbmis(dates);
		ArrayList<BmiVO> arrayList = new ArrayList<BmiVO>();
		arrayList.addAll(sqlSession.selectList(namespace+".getbmis",dates));

		return arrayList;
	}
}
