package com.burger.controller.action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.burger.dao.BDao;
import com.burger.dao.QnaDAO;
import com.burger.dao.iBatis.QnaDAO_iBatis;
import com.burger.dto.BDto;
import com.burger.dto.MemberVO;
import com.burger.dto.QnaVO;

public class NoticeContentAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "qna/notice/notice_content.jsp";
		
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		String bId = request.getParameter("bId");
		BDao dao = new BDao();
		BDto dto = dao.contentView(bId);
		
		request.setAttribute("content_view", dto);
		
		/*if (loginUser == null) {
			Curl = "loginForm.do";
		} else {
			int qseq = Integer.parseInt(request.getParameter("qseq"));
			 QnaDAO qnaDAO = QnaDAO_JDBC.getInstance(); 
			QnaDAO qnaDAO = QnaDAO_iBatis.getInstance();
			QnaVO qnaVO = null;
			try {
				qnaVO = qnaDAO.getQna(qseq);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.setAttribute("qnaVO", qnaVO);
		}*/
		return url;
	}
}
