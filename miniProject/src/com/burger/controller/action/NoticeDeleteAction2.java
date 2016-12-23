package com.burger.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.burger.dao.BDao;
import com.burger.dao.BDao2;
import com.burger.dto.MemberVO;

public class NoticeDeleteAction2 implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "/qnaNotice2.do";
		
		System.out.println("request : "+request.getParameter("bName"));
		System.out.println("request : "+request.getParameter("bTitle"));
		
		
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
		BDao2 dao = new BDao2();
		dao.delete(bId);
			
			
		/*}*/
		return url;
	}
}
