package com.spring.mno.user.dao;

import java.util.List;

import com.spring.mno.user.domain.MemberVO;

public interface LoginDAO {

	List<MemberVO> getMembers();

	void insertMember(MemberVO member);

	MemberVO memberinfo(String id);

	void updateMember(MemberVO member);

	

}
