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

public class AdminQnaListAction implements Action {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String url = "qna/QnaList.jsp";
		String key = request.getParameter("key");
		String tpage = request.getParameter("tpage");
		System.out.println(tpage + "111");
		if (key == null) {
			key = "";
		}
		if (tpage == null) {
			tpage = "1"; // 占쎌겱占쎌삺 占쎈읂占쎌뵠筌욑옙 (default 1)
		} else if (tpage.equals("")) {

		}
		request.setAttribute("key", key);
		request.setAttribute("tpage", tpage);

		QnaDAO qnaDAO = QnaDAO_iBatis.getInstance();
		ArrayList<QnaVO> qnaList = null;
		String paging =null;

		try {
			qnaList = qnaDAO.listAllQna();
			paging=qnaDAO.pageNumber(Integer.parseInt(tpage), key);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		request.setAttribute("qnaList", qnaList);
		int n=qnaList.size();   
	    request.setAttribute("qnaListSize",n); 
	    request.setAttribute("paging", paging);
		return url;
	}

}
