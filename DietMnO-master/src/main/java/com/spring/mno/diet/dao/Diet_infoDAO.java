package com.spring.mno.diet.dao;

import java.util.ArrayList;
import java.util.Date;

import com.spring.mno.diet.domain.Diet_info;
import com.spring.mno.user.domain.Dates;



public interface Diet_infoDAO {

	void insetdiet_info(Diet_info diet_info);

	/*ArrayList<Diet_info> getdiet_infolist(String date1, String date2);*/

	ArrayList<Diet_info> getdiet_infolist(Dates dates);

}
