package com.burger.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.burger.dto.CartVO;

public interface CartDAO {
	public void insertCart(CartVO cartVO) throws SQLException;
	public ArrayList<CartVO> listCart(String userId) throws SQLException;
	public void deleteCart(int cseq) throws SQLException;	
	public CartVO getCart(String cseq) throws SQLException;
	public int updateCart(CartVO cartVO) throws SQLException;
}
