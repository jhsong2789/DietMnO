package com.spring.mno.rec.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mno.bmi.domain.BmiVO;
import com.spring.mno.diet.domain.paylist;
import com.spring.mno.rec.domain.Recommendvo;
import com.spring.mno.user.domain.Dates;



@Repository
public class RecommendDAOImple implements RecommendDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private static String namespace = "com.spring.mno.mappers.community";

	@Override
	public void insertRec(Recommendvo recommend) {
		// TODO Auto-generated method stub
		
			sqlSession.insert(namespace+".insertrecommend",recommend);
		
	}
	String rec_id2;
	
	@Override
	public ArrayList<Recommendvo> getrecommends2(int[] rec_id) {
		// TODO Auto-generated method stub
		rec_id2="";
		ArrayList<Recommendvo> recommends = new ArrayList<Recommendvo>();	
		for (int i = 0; i < rec_id.length; i++) {
			recommends.add( sqlSession.selectOne(namespace+".getrecommends2",rec_id[i]) );
			rec_id2 +=Integer.toString(rec_id[i])+",";
		}
		
		return recommends;
	}
	
	
	@Override
	public ArrayList<Recommendvo> getrecommends(int rec_category) {
		// TODO Auto-generated method stub
		
		ArrayList<Recommendvo> arrayList = new ArrayList<Recommendvo>();
		arrayList.addAll(sqlSession.selectList(namespace+".getrecommends",rec_category));

		return arrayList;
	}
	@Override
	public void insertpay(String id,String date,int sum) {
		// TODO Auto-generated method stub
		
		paylist paylist = new paylist();
		paylist.setPaylist_date(date);
		paylist.setPaylist_memberid(id);
		paylist.setPaylist_orderlist(rec_id2);
		paylist.setPaylist_price(sum);
		sqlSession.insert(namespace+".insertpay",paylist);
	}
	@Override
	public ArrayList<paylist> getpaylist(Dates dates) {
		// TODO Auto-generated method stub
		ArrayList<paylist> arrayList = new ArrayList<paylist>();
		arrayList.addAll(sqlSession.selectList(namespace+".getpaylist",dates));

		return arrayList;
	}
	@Override
	public ArrayList<paylist> getpaylists(Dates dates) {
		// TODO Auto-generated method stub
		ArrayList<paylist> arrayList = new ArrayList<paylist>();
		arrayList.addAll(sqlSession.selectList(namespace+".getpaylists",dates));
		return arrayList;
	}
}

