package com.burger.admin.controller.action;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.burger.controller.action.Action;
import com.burger.dao.StoreDAO;
import com.burger.dao.iBatis.StoreDAO_iBatis;
import com.burger.dto.StoreVO;

public class AdminStoreInsertAction implements Action{

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String url="store/storeinsertForm.jsp?";
		
		StoreDAO storeDAO = StoreDAO_iBatis.getInstance();
		StoreVO storeVO = new StoreVO();
	
		storeVO.setName(request.getParameter("name"));
		storeVO.setAddress(request.getParameter("address"));
		storeVO.setTime(request.getParameter("time"));
		
		
		try {
			storeDAO.insertStore(storeVO);
			url="adminStoreSearch.do";
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return url;
	}

}
