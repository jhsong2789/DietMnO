package com.spring.mno.diet.dao;

import java.util.ArrayList;
import java.util.Date;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.mno.diet.domain.Diet_info;
import com.spring.mno.user.domain.Dates;


@Repository
public class Diet_infoDAOImple implements Diet_infoDAO {
	@Inject
	private SqlSession sqlSession;

	private static String namespace = "com.spring.mno.mappers.community";

	@Override
	public void insetdiet_info(Diet_info diet_info) {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace + ".insertDiet_info",diet_info);
	}
	@Override
	public ArrayList<Diet_info> getdiet_infolist(Dates dates) {
		// TODO Auto-generated method stub
		ArrayList<Diet_info> arrayList = new ArrayList<Diet_info>();
		arrayList.addAll(sqlSession.selectList(namespace+".getdiet_infolist",dates));
		return arrayList;
	}
	
}
