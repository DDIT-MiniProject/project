package com.burger.admin.controller.action;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.burger.controller.action.Action;
import com.burger.dao.OrderDAO;
import com.burger.dao.iBatis.OrderDAO_iBatis;

public class AdminOrderSaveAction implements Action {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String url="adminOrderList.do";
		
		String[] resultArr=request.getParameterValues("result");
		
			System.out.println(request.getParameterValues("result"));
		
		for(String oseq:resultArr){
			OrderDAO orderDAO = OrderDAO_iBatis.getInstance();
			
			try {
				orderDAO.updateOrderResult(oseq);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return url;
	}

}
