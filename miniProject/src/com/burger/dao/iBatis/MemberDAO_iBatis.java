package com.burger.dao.iBatis;

import java.sql.SQLException;
import java.util.ArrayList;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.burger.dao.MemberDAO;
import com.burger.db.sqlconfig.IBatisDBConnector;
import com.burger.dto.MemberVO;

public class MemberDAO_iBatis implements MemberDAO {
	private SqlMapClient client = IBatisDBConnector.getSqlMapInstance();
	private static MemberDAO_iBatis instance = new MemberDAO_iBatis();

	private MemberDAO_iBatis() {
	}

	public static MemberDAO_iBatis getInstance() {
		return instance;
	}

	@Override
	public int confirmID(String userid) throws SQLException {
		int result = -1;
		MemberVO member = (MemberVO) client.queryForObject("confirmID", userid);
		if (member != null) {
			result = 1;
		} else {
			result = -1;
		}
		return result;
	}

	@Override
	public MemberVO getMember(String id) throws SQLException {
		MemberVO member = (MemberVO) client.queryForObject("getMember", id);
		return member;
	}

	@Override
	public int insertMember(MemberVO memberVO) throws SQLException {
		int result = -1;
		if (client.insert("insertMember", memberVO) != null) {
			result=-1;
		} else {
			result=1;
		}
		return result;
	}

	@Override
	public ArrayList<MemberVO> listMember(String member_name)
			throws SQLException {
		if (member_name == "") {
			member_name= "%";
		}
		ArrayList<MemberVO> memberList =(ArrayList<MemberVO>)client.queryForList("listMember",member_name);		
		return memberList;
	}

	@Override
	public int totalMember(String member_name) throws SQLException {
		   int result = (int) client.queryForObject("totalMember", member_name);
		return result;
	}

	@Override
	public MemberVO searchMember(String pwd) throws SQLException {
		MemberVO member = (MemberVO) client.queryForObject("getMember", pwd);
		return member;
	}
	@Override
	public int totalRecord(String product_name) throws SQLException {
		int total_pages = 0;
		if (product_name.equals("")) {
			product_name = "%";
		}
		total_pages = (Integer) client.queryForObject("totalMember",product_name);
		return total_pages;
	}
	static int view_rows = 10; // 占쎈읂占쎌뵠筌욑옙占쎌벥 揶쏆뮇??
	static int counts = 10; // 占쎈립 占쎈읂占쎌뵠筌욑옙占쎈퓠 占쎄돌占쏙옙占쎄땔 占쎄맒占쎈?占쎌벥 揶쏆뮇??
	
	@Override
	public String pageNumber(int tpage, String name) throws SQLException {
		String str = "";

		int total_pages = totalRecord(name);
		int page_count = total_pages / counts + 1;

		if (total_pages % counts == 0) {
			page_count--;
		}
		if (tpage < 1) {
			tpage = 1;
		}

		int start_page = tpage - (tpage % view_rows) + 1;
		System.out.println(start_page+"?ㅽ??⑦럹?댁?");
		int end_page = start_page + (counts - 1);

		if (end_page > page_count) {
			end_page = page_count;
		}
		if (start_page > view_rows) {
			str += "<a href='adminMemberList.do?tpage=1&key="
					+ name + "'>&lt;&lt;</a>&nbsp;&nbsp;";
			str += "<a href='adminMemberList.do?tpage="
					+ (start_page - 1);
			str += "&key=<%=product_name%>'>&lt;</a>&nbsp;&nbsp;";
		}

		for (int i = start_page; i <= end_page; i++) {
			if (i == tpage) {
				str += "<font color=red>[" + i + "]&nbsp;&nbsp;</font>";
			} else {
				str += "<a href='adminMemberList.do?tpage="
						+ i + "&key=" + name + "'>[" + i + "]</a>&nbsp;&nbsp;";
			}
		}

		if (page_count > end_page) {
			str += "<a href='adminMemberList.do?tpage="
					+ (end_page + 1) + "&key=" + name
					+ "'> &gt; </a>&nbsp;&nbsp;";
			str += "<a href='adminMemberList.do?tpage="
					+ page_count + "&key=" + name
					+ "'> &gt; &gt; </a>&nbsp;&nbsp;";
		}
		return str;
		
	}

}
