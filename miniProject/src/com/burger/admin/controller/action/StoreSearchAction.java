package com.burger.admin.controller.action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.burger.controller.action.Action;
import com.burger.dao.StoreDAO;
import com.burger.dao.iBatis.StoreDAO_iBatis;
import com.burger.dto.StoreVO;

public class StoreSearchAction implements Action{

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		/*String url = "storeForm.jsp";
	    String key = "";
	    if (request.getParameter("key") != null) {
	      key = request.getParameter("key");
	    }

	    StoreDAO storeDAO = StoreDAO_iBatis.getInstance();
	    ArrayList<StoreVO> searchList=null;
		try {
			searchList = storeDAO.searchStore("searchStore", key);
		} catch (SQLException e) {	
			e.printStackTrace();
		}

	    request.setAttribute("searchList", searchList);

	    return url;
	  }*/
		  String url = "storeForm.jsp";
		    
		    String key=request.getParameter("key");
		    String tpage=request.getParameter("tpage");
		    if(key==null){
		     key="";
		    }    
		    if(tpage== null){
		      tpage="1"; //현재 페이지 (default 1)                        
		    }else if(tpage.equals("")){
		       tpage="1";  
		    }
		    request.setAttribute("key", key);
		    request.setAttribute("tpage",tpage);
		    
		    /*ProductDAO productDAO=ProductDAO_JDBC.getInstance();*/
		    StoreDAO storeDAO=StoreDAO_iBatis.getInstance();   
		    ArrayList<StoreVO> storeList=null;
		    String paging=null;
			try {
				storeList=storeDAO.selectAllStore();
				storeList=storeDAO.listStore(Integer.parseInt(tpage), key);
				paging = storeDAO.pageNumber(Integer.parseInt(tpage), key);
			} catch (NumberFormatException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		    request.setAttribute("storeList",storeList);
		    int n=storeList.size();   
		    request.setAttribute("allListSize",n); 
		    request.setAttribute("paging", paging);   
		    return url;
		  }
}
