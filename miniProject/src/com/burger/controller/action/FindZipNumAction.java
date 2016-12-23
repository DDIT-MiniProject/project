package com.burger.controller.action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.burger.dao.AddressDAO;
import com.burger.dao.iBatis.AddressDAO_iBatis;
import com.burger.dto.AddressVO;

public class FindZipNumAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "findZipNum.jsp";
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String dong = request.getParameter("dong");

		if (dong != null && dong.trim().equals("") == false) {
			//AddressDAO addressDAO = AddressDAO_JDBC.getInstance();
			AddressDAO addressDAO = AddressDAO_iBatis.getInstance();
			try {
				ArrayList<AddressVO> addressList = addressDAO
						.selectAddressByDong(dong.trim());
				request.setAttribute("addressList", addressList);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return url;
	}
}
