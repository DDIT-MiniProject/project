package com.burger.admin.controller.action;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.burger.controller.action.Action;
import com.burger.dao.MemberDAO;
import com.burger.dao.iBatis.MemberDAO_iBatis;
import com.burger.dto.MemberVO;

public class AdminMemberDetailAction implements Action {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String url="user/userdetailForm.jsp";
		
		String id=request.getParameter("userid").trim();
		
		MemberDAO memberDAO=MemberDAO_iBatis.getInstance();
		MemberVO memberVO=null;
		
		try {
			memberVO=memberDAO.getMember(id);
			request.setAttribute("memberVO", memberVO);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return url;
	}

}
