package com.burger.admin.controller.action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.burger.controller.action.Action;
import com.burger.dao.OrderDAO;
import com.burger.dao.iBatis.OrderDAO_iBatis;
import com.burger.dto.OrderVO;

public class AdminOrderSearchAction implements Action{

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String url="order/OrderList.jsp";
		String key = request.getParameter("key");
		String tpage=request.getParameter("tpage");
		

		 if (key == null) {
			 key = "";
			 
			}
			if (tpage == null) {
				tpage = "1"; 
			} else if (tpage.equals("")) {
				
			}
			request.setAttribute("key", key);
			request.setAttribute("tpage", tpage);
		
		OrderDAO orderDAO = OrderDAO_iBatis.getInstance();
		ArrayList<OrderVO> orderList=null;
		String paging =null;
		
		try {
			orderList = orderDAO.listOrder(Integer.parseInt(tpage),key);
			paging=orderDAO.pageNumber(Integer.parseInt(tpage), key);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("orderList", orderList);
		
		
		 int n=orderList.size();
		 request.setAttribute("orderListSize", n);
		 request.setAttribute("paging", paging);
		
		return url;
	}

}
