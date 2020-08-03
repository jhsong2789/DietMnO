package com.spring.mno.bmi.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mno.bmi.dao.BmiDAO;
import com.spring.mno.bmi.domain.BmiVO;
import com.spring.mno.user.domain.Dates;

@Service
public class BmiServiceImple implements BmiService {
	@Autowired
	private BmiDAO bmiDAO;
	
	
	/*
	 * @Transactional( propagation = Propagation.REQUIRED, isolation =
	 * Isolation.READ_COMMITTED, timeout = 10, readOnly = false, rollbackFor =
	 * Exception.class )
	 */
	@Override
	public void addbmi(BmiVO bmi)  {
		// TODO Auto-generated method stub
		float bmi2 =  ((float)bmi.getWeight()/(float)(bmi.getHeight()*(float)bmi.getHeight()/10000));
		bmi.setBmi(Math.round((bmi2*100))/100.0+"%");
		SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ( "yyyyMMdd", Locale.KOREA);
		String da=mSimpleDateFormat.format(new Date());
		bmi.setBmi_date(da);
		bmiDAO.insertBmi(bmi);
	}

	@Override
	public ArrayList<BmiVO> getbmis(Dates dates) {
		// TODO Auto-generated method stub
		ArrayList<BmiVO> bmis=bmiDAO.getbmis(dates);
		for (int i = 0; i < bmis.size(); i++) {
			String date=(bmis.get(i).getBmi_date()).substring(0,4)+"-"+(bmis.get(i).getBmi_date()).substring(4,6)+"-"+(bmis.get(i).getBmi_date()).substring(6,8);
			bmis.get(i).setBmi_date(date);
		}
		
		return bmis;
	}
}
