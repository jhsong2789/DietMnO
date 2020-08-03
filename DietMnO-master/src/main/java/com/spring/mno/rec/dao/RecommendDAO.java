package com.spring.mno.rec.dao;

import java.util.ArrayList;

import com.spring.mno.diet.domain.paylist;
import com.spring.mno.rec.domain.Recommendvo;
import com.spring.mno.user.domain.Dates;



public interface RecommendDAO {

	void insertRec(Recommendvo recommend);

	ArrayList<Recommendvo> getrecommends(int rec_category);

	ArrayList<Recommendvo> getrecommends2(int[] rec_id);

	void insertpay(String id,String date, int sum);

	ArrayList<paylist> getpaylist(Dates dates);
	ArrayList<paylist> getpaylists(Dates dates);



}
