package com.spring.mno.bmi.dao;

import java.util.ArrayList;

import com.spring.mno.bmi.domain.BmiVO;
import com.spring.mno.user.domain.Dates;


public interface BmiDAO {

	void insertBmi(BmiVO bmi);

	ArrayList<BmiVO> getbmis(Dates dates);

}
