package com.burger.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.burger.dto.AddressVO;

public interface AddressDAO {
	public ArrayList<AddressVO> selectAddressByDong(String dong) throws SQLException;
}
