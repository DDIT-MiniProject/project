package com.burger.controller.action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.burger.dao.MemberDAO;
import com.burger.dao.iBatis.MemberDAO_iBatis;
import com.burger.dto.MemberVO;

public class FindPasswordAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "findPassword.jsp";
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String id = request.getParameter("id");
		
		if (id != null && id.trim().equals("") == false) {
			//AddressDAO addressDAO = AddressDAO_JDBC.getInstance();
			MemberDAO memberDAO = MemberDAO_iBatis.getInstance();
			try {
				MemberVO member = memberDAO.getMember(id.trim());
				request.setAttribute("member", member);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return url;
	}
}
