package com.burger.admin.controller.action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.burger.controller.action.Action;
import com.burger.dao.QnaDAO;
import com.burger.dao.iBatis.QnaDAO_iBatis;
import com.burger.dto.QnaVO;

public class AdminQnaListAction implements Action{

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String url="qna/QnaList.jsp";
		
		QnaDAO qnaDAO = QnaDAO_iBatis.getInstance();
		ArrayList<QnaVO> qnaList =null;
	    
		try {
			qnaList=qnaDAO.listAllQna();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("qnaList",qnaList);
		return url;
	}

}
