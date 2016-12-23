package com.burger.admin.controller.action;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.burger.controller.action.Action;
import com.burger.dao.MemberDAO;
import com.burger.dao.iBatis.MemberDAO_iBatis;

public class AdminMainAction implements Action{

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String url="admainForm.jsp";
		String member_name="";
		MemberDAO memberDAO =MemberDAO_iBatis.getInstance();
		try {
			int result = memberDAO.totalMember(member_name);
			request.setAttribute("result", result);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return url;
	}

}
