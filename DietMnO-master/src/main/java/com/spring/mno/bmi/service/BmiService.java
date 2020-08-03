package com.spring.mno.bmi.service;

import java.util.ArrayList;

import com.spring.mno.bmi.domain.BmiVO;
import com.spring.mno.user.domain.Dates;



public interface BmiService {

	void addbmi(BmiVO bmi);

	ArrayList<BmiVO> getbmis(Dates dates);

}
