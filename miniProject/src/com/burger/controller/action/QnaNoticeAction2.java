package com.burger.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.burger.dao.BDao;
import com.burger.dao.BDao2;
import com.burger.dto.BDto;
import com.burger.dto.BDto2;
import com.burger.dto.MemberVO;

public class QnaNoticeAction2 implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "qna2/notice/notice.jsp";
		
		System.out.println("a : "+(String)request.getParameter("bName"));

		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		BDao2 dao = new BDao2();
		ArrayList<BDto2> dtos = dao.list();
		request.setAttribute("list", dtos);
		
		/*if (loginUser == null) {
			url = "loginForm.do";
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
