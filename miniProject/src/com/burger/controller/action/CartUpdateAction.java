package com.burger.controller.action;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.burger.dao.CartDAO;
import com.burger.dao.ProductDAO;
import com.burger.dao.iBatis.CartDAO_iBatis;
import com.burger.dao.iBatis.ProductDAO_iBatis;
import com.burger.dto.CartVO;
import com.burger.dto.MemberVO;
import com.burger.dto.ProductVO;

public class CartUpdateAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String url = "cartForm.do";
		String message = null; 
		
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		CartVO cartVO = null;
		CartDAO cartDAO = CartDAO_iBatis.getInstance();
		try {
			cartVO = cartDAO.getCart(request.getParameter("cseq"));
			cartVO.setQuantity(Integer.parseInt(request.getParameter("cnt")));
			cartDAO.updateCart(cartVO);
			message = cartVO.getPname()+"의 수량이 변경되었습니다";
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		session.setAttribute("message", message);
		/*if (loginUser != null) { //임시방편으로 not null
			url = "loginForm.do";
		} else {
			CartVO cartVO = new CartVO();
			cartVO.setId("one");
			cartVO.setPseq(Integer.parseInt(pseq));
			cartVO.setQuantity(1);
			cartVO.setPname(request.getParameter("pname"));
			System.out.println(request.getParameter("price2"));
			//cartVO.setPrice2(Integer.parseInt(request.getParameter("price2")));
			CartDAO cartDAO = CartDAO_iBatis.getInstance();
			try {
				cartDAO.insertCart(cartVO);
			} catch (SQLException e) {				
				e.printStackTrace();
			}
		}*/
		return url;
	}

}
