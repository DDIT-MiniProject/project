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
//
public class AdminOrderListAction implements Action {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String url = "order/OrderList.jsp";
		
		String key=request.getParameter("key");
		String tpage=request.getParameter("tpage");
		if(request.getParameter("key")!=null){
			key=request.getParameter("key");
		}else if(request.getParameter("key")==null){
			key="";
		}
		 if(tpage== null){
		      tpage="1"; //占쎌겱占쎌삺 占쎈읂占쎌뵠筌욑옙 (default 1)                        
		    }else if(tpage.equals("")){
		         
		    }
		 request.setAttribute("key", key);
		 request.setAttribute("tpage",tpage);
		
		OrderDAO orderDAO = OrderDAO_iBatis.getInstance();
		ArrayList<OrderVO>  orderList= null;
		String paging=null;
		
		try {
			orderList=orderDAO.listOrder(key);
			paging = orderDAO.pageNumber(Integer.parseInt(tpage), key);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("orderList", orderList);
		int n=orderList.size();   
	    request.setAttribute("orderListSize",n); 
	    request.setAttribute("paging", paging); 
		
		return url;
	}

}
