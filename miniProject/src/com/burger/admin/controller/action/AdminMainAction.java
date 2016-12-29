package com.burger.admin.controller.action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.burger.controller.action.Action;
import com.burger.dao.MemberDAO;
import com.burger.dao.OrderDAO;
import com.burger.dao.QnaDAO;
import com.burger.dao.iBatis.MemberDAO_iBatis;
import com.burger.dao.iBatis.OrderDAO_iBatis;
import com.burger.dao.iBatis.QnaDAO_iBatis;
import com.burger.dto.OrderVO;

public class AdminMainAction implements Action{

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String url="admainForm.jsp";
		String member_name="";
		MemberDAO memberDAO =MemberDAO_iBatis.getInstance();
		OrderDAO orderDAO = OrderDAO_iBatis.getInstance();
		QnaDAO qnaDAO = QnaDAO_iBatis.getInstance();
		try {
			int result = memberDAO.totalMember(member_name);
			request.setAttribute("result", result);
			int orderResult=orderDAO.newOrderSearch();
			request.setAttribute("orderResult", orderResult);
			int qnaResult=qnaDAO.newQnaSearch();
			request.setAttribute("qnaResult", qnaResult);
			ArrayList<OrderVO> orderList = orderDAO.epistasisList();
			request.setAttribute("orderList", orderList);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return url;
	}

}
