package com.spring.mno.diet.service;

import java.util.ArrayList;
import java.util.Date;

import com.spring.mno.diet.domain.Diet_info;
import com.spring.mno.user.domain.Dates;

public interface Diet_infoService {

	

	void addinfo(Diet_info diet_info);

	ArrayList<Diet_info> diet_infos(Dates dates);



}
