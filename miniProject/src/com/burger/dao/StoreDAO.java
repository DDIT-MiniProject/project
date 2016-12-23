package com.burger.dao;

import java.sql.SQLException;

import java.util.ArrayList;

import com.burger.dto.StoreVO;

public interface StoreDAO {

	public ArrayList<StoreVO> searchStore(String dong, String key)throws SQLException;

	public ArrayList<StoreVO> selectAllStore() throws SQLException;

	public String pageNumber(int tpage, String name) throws SQLException;

	public ArrayList<StoreVO> listStore(int tpage, String name)throws SQLException;

	int storeTotalRecord(String name) throws SQLException;
	
}
