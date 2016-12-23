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

public class AdminProductUpdateFormAction implements Action {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String url = "product/ProductUpdate.jsp";

	    String pseq = (String)request.getParameter("pseq").trim();
	    System.out.println(pseq+"이건 수정용 pseq");
     
	    /*ProductDAO productDAO = ProductDAO_JDBC.getInstance();*/
	    ProductDAO productDAO = ProductDAO_iBatis.getInstance();
	    ProductVO productVO=null;
		try {
			productVO = productDAO.getProduct(pseq);
			request.setAttribute("productVO", productVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}

	    

	    
	    String tpage = "1";
	    if (request.getParameter("tpage") != null) {
	      tpage = request.getParameter("tpage");
	    }
	    request.setAttribute("tpage", tpage);
	    
	    String kindList[] = { "스페셜오퍼", "딜리버리팩", "세트메뉴", "버거",
	        "사이드", "드링크" };    
	    request.setAttribute("kindList", kindList);
	    
	    return url;
	  }

}
