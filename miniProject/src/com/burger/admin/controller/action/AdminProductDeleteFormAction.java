package com.burger.admin.controller.action;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.burger.controller.action.Action;
import com.burger.dao.ProductDAO;
import com.burger.dao.iBatis.ProductDAO_iBatis;
import com.burger.dto.ProductVO;

public class AdminProductDeleteFormAction implements Action{

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String url="product/productDelete.jsp";
		
		String pseq =request.getParameter("pseq");
		
		ProductDAO productDAO=ProductDAO_iBatis.getInstance();
		ProductVO productVO=null;
		
		   try {
			productVO = productDAO.getProduct(pseq);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		   
		   request.setAttribute("productVO", productVO);
		return url;
	}

}
