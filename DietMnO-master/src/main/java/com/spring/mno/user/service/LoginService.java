package com.spring.mno.user.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.spring.mno.user.domain.MemberVO;

public interface LoginService {

	List<MemberVO> getmembers();

	void addMember(MemberVO member);

	boolean login(String id, String passwd1, HttpServletResponse response);

	MemberVO memberinfo(String id);

	void modifyMember(MemberVO member);

}
