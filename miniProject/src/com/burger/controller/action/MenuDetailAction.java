package com.burger.controller.action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.burger.dao.ProductDAO;
import com.burger.dao.iBatis.ProductDAO_iBatis;
import com.burger.dto.ProductVO;

public class MenuDetailAction implements Action{

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String url="/menu/menuDetail.jsp";

		String pseq = request.getParameter("pseq");
	   
	    ProductDAO productDAO=ProductDAO_iBatis.getInstance();   
	    
	    ProductVO productVO = null;
		try {
			productVO = productDAO.getProduct(pseq);
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
		HttpSession session = request.getSession();
		session.setAttribute("productVO", productVO);
		request.setAttribute("productVO", productVO);

		return url;
	}

}
