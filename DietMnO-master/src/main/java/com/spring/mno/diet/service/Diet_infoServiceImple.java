package com.spring.mno.diet.service;

import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mno.diet.dao.Diet_infoDAO;
import com.spring.mno.diet.domain.Diet_info;
import com.spring.mno.user.domain.Dates;


@Service
public class Diet_infoServiceImple implements Diet_infoService {
	@Autowired
	private Diet_infoDAO diet_infoDAO;
	
/*@Override
public ArrayList<Diet_info> diet_infos(String date1, String date2) {
	// TODO Auto-generated method stub
	ArrayList<Diet_info> diet_infolist=diet_infoDAO.getdiet_infolist(date1,date2);
	return diet_infolist;
}*/
	
	@Override
	public void addinfo(Diet_info diet_info) {
		// TODO Auto-generated method stub
		int cal=(int) (Integer.parseInt(diet_info.getCal())* Double.valueOf(diet_info.getEat()));
		diet_info.setCal(Integer.toString(cal));
		diet_infoDAO.insetdiet_info(diet_info);
	}

	@Override
	public ArrayList<Diet_info> diet_infos(Dates dates) {
		// TODO Auto-generated method stub
		ArrayList<Diet_info> diet_infolist=diet_infoDAO.getdiet_infolist(dates);
		
		for (int i = 0; i < diet_infolist.size(); i++) {
			String date=(diet_infolist.get(i).getDates()).substring(0,4)+"-"+(diet_infolist.get(i).getDates()).substring(4,6)+"-"+(diet_infolist.get(i).getDates()).substring(6,8)+"일  "+(diet_infolist.get(i).getDates()).substring(8,10)+"시"+(diet_infolist.get(i).getDates()).substring(10,12)+"분";
			diet_infolist.get(i).Dates(date);
		}
		
		
		return diet_infolist;
	}

}
