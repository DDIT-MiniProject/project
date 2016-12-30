package com.burger.admin.controller.action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.burger.controller.action.Action;
import com.burger.dao.MemberDAO;
import com.burger.dao.iBatis.MemberDAO_iBatis;
import com.burger.dto.MemberVO;

public class AdminMemberSearchAction implements Action {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String url="user/UserList.jsp";
		
		 request.setCharacterEncoding("utf-8");
		    
		    String key=request.getParameter("key");
			String tpage=request.getParameter("tpage");
			
			if(request.getParameter("key")!=null){
				key=request.getParameter("key");
			}else if(request.getParameter("key")==null){
				key="";
			}
			 if(tpage== null){
			      tpage="1"; //占쎌겱占쎌삺 占쎈읂占쎌뵠筌욑옙 (default 1)                        
			    }else if(tpage.equals("")){
			         
			    }
			 System.out.println(tpage+"xtttttt");
			 request.setAttribute("key", key);
			 request.setAttribute("tpage",tpage);
		
		MemberDAO memberDAO = MemberDAO_iBatis.getInstance();
		ArrayList<MemberVO> memberList=null;
		
		
		try {
			memberList=memberDAO.listMember(Integer.parseInt(tpage),key);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("memberList", memberList);
		
		
		return url;
	}

}
