package com.burger.admin.controller.action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.burger.controller.action.Action;
import com.burger.dao.ProductDAO;
import com.burger.dao.iBatis.ProductDAO_iBatis;
import com.burger.dto.ProductVO;

public class AdminProductListAction implements Action {

  @Override
  public String execute(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    String url = "product/pproductList.jsp";
    
    String key=request.getParameter("key");
    String tpage=request.getParameter("tpage");
    System.out.println(tpage+"111");
    if(key==null){
     key="";
    }    
    if(tpage== null){
      tpage="1"; //占쎌겱占쎌삺 占쎈읂占쎌뵠筌욑옙 (default 1)                        
    }else if(tpage.equals("")){
         
    }
    request.setAttribute("key", key);
    request.setAttribute("tpage",tpage);
    
    /*ProductDAO productDAO=ProductDAO_JDBC.getInstance();*/
    ProductDAO productDAO=ProductDAO_iBatis.getInstance();   
    
    ArrayList<ProductVO> productList=null;
    String paging=null;
	try {
		productList=productDAO.listProduct(Integer.parseInt(tpage), key);
		paging = productDAO.pageNumber(Integer.parseInt(tpage), key);
	} catch (NumberFormatException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
     
    request.setAttribute("productList",productList);
    int n=productList.size();   
    request.setAttribute("productListSize",n); 
    request.setAttribute("paging", paging);   
    
    return url;
  }
}

