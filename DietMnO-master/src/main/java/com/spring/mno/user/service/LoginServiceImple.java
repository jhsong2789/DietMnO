package com.spring.mno.user.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mno.user.dao.LoginDAO;
import com.spring.mno.user.domain.MemberVO;

@Service
public class LoginServiceImple implements LoginService {

	@Inject
	private LoginDAO loginDAO;

	@Override
	public List<MemberVO> getmembers() {
		// TODO Auto-generated method stub
		List<MemberVO> memberList = new ArrayList<MemberVO>();
			memberList=	loginDAO.getMembers();
		return memberList;
	}

	@Override
	public void addMember(MemberVO member) {
		// TODO Auto-generated method stub
		loginDAO.insertMember(member);
	}

	@Override
	public MemberVO memberinfo(String id) {
		// TODO Auto-generated method stub
		MemberVO member = loginDAO.memberinfo(id);
		return member;
	}

	@Override
	public boolean login(String id, String passwd1, HttpServletResponse response) {
		// TODO Auto-generated method stub
		List<MemberVO> memberList = new ArrayList<MemberVO>();
		memberList=loginDAO.getMembers();
		Boolean loginSuccess = false;
		for (int i = 0; i < memberList.size(); i++) {
			if (id.equals(memberList.get(i).getId()) && passwd1.equals(memberList.get(i).getPasswd1())) {
				loginSuccess = true;
				Cookie cookie1 = new Cookie("id", memberList.get(i).getId());
				cookie1.setMaxAge(-1);
				cookie1.setPath("/");
				response.addCookie(cookie1);
				Cookie cookie2 = new Cookie("usertype", memberList.get(i).getUsertype());
				cookie2.setMaxAge(-1);
				cookie2.setPath("/");
				response.addCookie(cookie2);
				Cookie cookie3 = new Cookie("filename", memberList.get(i).getFileName());
				cookie3.setMaxAge(-1);
				cookie3.setPath("/");
				response.addCookie(cookie3);
				
				
				break;
			}
		}
		return loginSuccess;
	}

	@Override
	public void modifyMember(MemberVO member) {
		// TODO Auto-generated method stub
		loginDAO.updateMember(member);
	}
}
