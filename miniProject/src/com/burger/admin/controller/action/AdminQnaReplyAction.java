package com.burger.admin.controller.action;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.burger.controller.action.Action;
import com.burger.dao.QnaDAO;
import com.burger.dao.iBatis.QnaDAO_iBatis;
import com.burger.dto.QnaVO;

public class AdminQnaReplyAction implements Action {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String url= "adminQnaList.do";
		
		int qseq=Integer.parseInt(request.getParameter("qseq"));
		String reply =request.getParameter("reply");
		
		QnaDAO qnaDAO = QnaDAO_iBatis.getInstance();
		QnaVO qnaVO=null;
		try {
			qnaVO=qnaDAO.getQna(qseq);
			qnaVO.setReply(reply);
			qnaVO.setRep("2");
			qnaDAO.updateQna(qnaVO);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("qnaVO", qnaVO);
		
		return url;
	}

}
