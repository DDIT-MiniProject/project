package com.burger.controller.action;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.burger.dao.MemberDAO;
import com.burger.dao.iBatis.MemberDAO_iBatis;

public class IdCheckFormAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String url = "idCheck.jsp";
		String id = request.getParameter("id").trim();
		
		//MemberDAO memberDAO=MemberDAO_JDBC.getInstance();		
		MemberDAO memberDAO=MemberDAO_iBatis.getInstance();
		int message=-1;
		try {
			message = memberDAO.confirmID(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("message", message);
		request.setAttribute("id", id);
		
		return url;
	}

}
