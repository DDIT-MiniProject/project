package com.burger.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.burger.dto.MemberVO;

public interface MemberDAO {
	public int confirmID(String userid) throws SQLException;
	public MemberVO getMember(String id) throws SQLException;
	public int insertMember(MemberVO memberVO) throws SQLException;
	
	public ArrayList<MemberVO> listMember(String member_name) throws SQLException;
	public int totalMember(String member_name) throws SQLException;
}
