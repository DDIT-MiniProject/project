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

public class AdminQnaDetailAction implements Action {

  @Override
  public String execute(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    String url = "qna/qnaDetail.jsp";

    String qseq = request.getParameter("qseq").trim();
    System.out.println(qseq+"이것은 ana qseq");

 
    QnaDAO qnaDAO = QnaDAO_iBatis.getInstance();
    QnaVO qnaVO=null;
	try {
		qnaVO = qnaDAO.getQna(Integer.parseInt(qseq));
	} catch (NumberFormatException e) {
		e.printStackTrace();
	} catch (SQLException e) {
		e.printStackTrace();
	}

    request.setAttribute("qnaVO", qnaVO);
        
    return url;
  }
}
