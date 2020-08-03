package com.spring.mno.rec.service;

import java.util.ArrayList;

import com.spring.mno.diet.domain.paylist;
import com.spring.mno.rec.domain.Recommendvo;
import com.spring.mno.user.domain.Dates;



public interface RecommendService {

	void insertRec(Recommendvo recommend);

	ArrayList<Recommendvo> getrecommend(int rec_category);

	ArrayList<Recommendvo> getrecommend2(int[] rec_id);

	int sum(ArrayList<Recommendvo> recommends);

	void insertpay(String id, int sum);

	ArrayList<paylist> getpaylist(Dates dates);

	ArrayList<paylist> getpaylists(Dates dates);

}
