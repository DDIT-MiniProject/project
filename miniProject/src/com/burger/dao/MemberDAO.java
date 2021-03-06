package com.burger.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.burger.dto.MemberVO;

public interface MemberDAO {
	public int confirmID(String userid) throws SQLException;
	public MemberVO getMember(String id) throws SQLException;
	public int insertMember(MemberVO memberVO) throws SQLException;
	public MemberVO searchMember(String pwd) throws SQLException;
	public ArrayList<MemberVO> listMember(int tpage,String member_name) throws SQLException;
	public int totalMember(String member_name) throws SQLException;
	public String pageNumber(int tpage, String name) throws SQLException;
	public int totalRecord(String product_name) throws SQLException;
}
