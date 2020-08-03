package com.spring.mno.rec.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mno.diet.domain.paylist;
import com.spring.mno.rec.dao.RecommendDAO;
import com.spring.mno.rec.domain.Recommendvo;
import com.spring.mno.user.domain.Dates;



@Service
public class RecommendServiceImple implements RecommendService {

	@Autowired
	private RecommendDAO recommendDAO;
	@Override
	public void insertRec(Recommendvo recommend) {
		// TODO Auto-generated method stub
		recommendDAO.insertRec(recommend);
	}
	@Override
	public ArrayList<Recommendvo> getrecommend2(int[] rec_id) {
		// TODO Auto-generated method stub
		ArrayList<Recommendvo> recommends=recommendDAO.getrecommends2(rec_id);
		return recommends;
	}
	@Override
	public int sum(ArrayList<Recommendvo> recommends) {
		// TODO Auto-generated method stub
		int sum=0;
		for (int i = 0; i < recommends.size(); i++) {
			sum=sum+recommends.get(i).getRec_price();
		}
		return sum;
	}
	@Override
	public ArrayList<Recommendvo> getrecommend(int rec_category) {
		// TODO Auto-generated method stub
		ArrayList<Recommendvo> recommends=recommendDAO.getrecommends(rec_category);
		return recommends;
	}
	@Override
	public void insertpay(String id,int sum) {
		// TODO Auto-generated method stub
		SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ( "yyyyMMddHHmm", Locale.KOREA);
		String da=mSimpleDateFormat.format(new Date());
		recommendDAO.insertpay(id,da,sum);
	}
	@Override
	public ArrayList<paylist> getpaylist(Dates dates) {
		// TODO Auto-generated method stub
		ArrayList<paylist> paylist=recommendDAO.getpaylist(dates); 
		for (int i = 0; i < paylist.size(); i++) {
			String date=(paylist.get(i).getPaylist_date()).substring(0,4)+"-"+(paylist.get(i).getPaylist_date()).substring(4,6)+"-"+(paylist.get(i).getPaylist_date()).substring(6,8)+"일 "+(paylist.get(i).getPaylist_date()).substring(8,10)+"시"+(paylist.get(i).getPaylist_date()).substring(10,12)+"분";
			paylist.get(i).setPaylist_date(date);
		}
		return paylist;
	}
	@Override
	public ArrayList<paylist> getpaylists(Dates dates) {
		// TODO Auto-generated method stub
		ArrayList<paylist> paylist=recommendDAO.getpaylists(dates); 
		for (int i = 0; i < paylist.size(); i++) {
			String date=(paylist.get(i).getPaylist_date()).substring(0,4)+"-"+(paylist.get(i).getPaylist_date()).substring(4,6)+"-"+(paylist.get(i).getPaylist_date()).substring(6,8)+"일 "+(paylist.get(i).getPaylist_date()).substring(8,10)+"시"+(paylist.get(i).getPaylist_date()).substring(10,12)+"분";
			paylist.get(i).setPaylist_date(date);
		}
		return paylist;
	}
}
