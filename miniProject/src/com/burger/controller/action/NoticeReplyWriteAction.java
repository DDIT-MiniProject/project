package com.burger.controller.action;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.burger.dao.BDao;
import com.burger.dao.QnaDAO;
import com.burger.dao.iBatis.QnaDAO_iBatis;
import com.burger.dto.MemberVO;
import com.burger.dto.QnaVO;

public class NoticeReplyWriteAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "/noticeReplyWrite.do";
		
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");

	/*	if (loginUser != null) {
			url = "loginForm.do";
		} else {*/
			/*QnaVO qnaVO = new QnaVO();
			qnaVO.setSubject(request.getParameter("subject"));
			qnaVO.setContent(request.getParameter("content"));
			 QnaDAO qnaDAO = QnaDAO_JDBC.getInstance(); 
			QnaDAO qnaDAO = QnaDAO_iBatis.getInstance();
			try {
				qnaDAO.insertqna(qnaVO, loginUser.getId());
			} catch (SQLException e) {
				e.printStackTrace();
			}*/
			
		String bId = request.getParameter("bId");
		String bName = request.getParameter("bName");
		String bTitle = request.getParameter("bTitle");
		String bContent = request.getParameter("bContent");
		String bGroup = request.getParameter("bGroup");
		String bStep = request.getParameter("bStep");
		String bIndent = request.getParameter("bIndent");
		
		BDao dao = new BDao();
		dao.reply(bId, bName, bTitle, bContent, bGroup, bStep, bIndent);
			
			
		/*}*/
		return url;
	}
}
