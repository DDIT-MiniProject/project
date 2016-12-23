package com.burger.controller.action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.burger.dao.CartDAO;
import com.burger.dao.OrderDAO;
import com.burger.dao.iBatis.CartDAO_iBatis;
import com.burger.dao.iBatis.OrderDAO_iBatis;
import com.burger.dto.CartVO;
import com.burger.dto.MemberVO;
import com.burger.dto.OrderVO;

public class OrderInsertAction implements Action{

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String url="index.do";
		
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		OrderVO orderVO = null;
		
		if (loginUser == null) {
			url = "loginForm.do";
		} else {
			CartDAO cartDAO = CartDAO_iBatis.getInstance();
			OrderDAO orderDAO = OrderDAO_iBatis.getInstance();
			/*CartDAO cartDAO = CartDAO_JDBC.getInstance();*/
			try {
				ArrayList<CartVO> cartList = cartDAO
						.listCart(loginUser.getId());
				orderDAO.insertOrder(cartList, loginUser.getId());
				int totalPrice = 0;
				for (CartVO cartVO : cartList) {
					totalPrice += cartVO.getPrice2() * cartVO.getQuantity();
					orderDAO.insertOrderDetail(cartVO, );
					cartDAO.deleteCart(cartVO.getCseq());
				}
				
				
				
				
				request.setAttribute("orderVO", orderVO);
				request.setAttribute("cartList", cartList);
				request.setAttribute("totalPrice", totalPrice);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
			
		return url;
	}

}
