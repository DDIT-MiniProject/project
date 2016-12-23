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

public class MenuFormAction implements Action{

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String url="/menu/menuForm.jsp";

	    String kind="12";
	    
	    /*ProductDAO productDAO=ProductDAO_JDBC.getInstance();*/
	    ProductDAO productDAO=ProductDAO_iBatis.getInstance();   
	    
	    ArrayList<ProductVO> productList=null;
		try {
			productList=productDAO.listKindProduct(kind);
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    
		
	    request.setAttribute("productList",productList);
		
		return url;
	}

}
