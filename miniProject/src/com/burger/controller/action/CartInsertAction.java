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

public class CartInsertAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String url = "cartForm.do";
		String pseq = request.getParameter("pseq");
		
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		ProductVO product = (ProductVO) session.getAttribute("productVO");
		
		if (loginUser == null) { //임시방편으로 not null
			url = "loginForm.do";
		} else {
			CartVO cartVO = new CartVO();
			cartVO.setId("one");
			cartVO.setPseq(product.getPseq());
			cartVO.setQuantity(Integer.parseInt(request.getParameter("quantity")));
			cartVO.setPname(product.getName());
			cartVO.setPrice2(product.getPrice2());
			CartDAO cartDAO = CartDAO_iBatis.getInstance();
			try {
				cartDAO.insertCart(cartVO);
			} catch (SQLException e) {				
				e.printStackTrace();
			}
		}
		return url;
	}

}
