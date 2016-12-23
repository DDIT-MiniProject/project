package com.burger.admin.controller.action;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.burger.controller.action.Action;
import com.burger.dao.ProductDAO;
import com.burger.dao.iBatis.ProductDAO_iBatis;

public class AdminProductDelete implements Action {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String url="product/productDelete.jsp";
		
		String pseq=request.getParameter("pseq");
	
		int result=-1;
		
		ProductDAO productDAO = ProductDAO_iBatis.getInstance();
		 try {
			result= productDAO.deleteProduct(pseq);
			url = "adminProductList.do";
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		        
		
		return url;
	}

}
