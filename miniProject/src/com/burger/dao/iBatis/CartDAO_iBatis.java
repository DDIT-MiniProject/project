package com.burger.dao.iBatis;

import java.sql.SQLException;
import java.util.ArrayList;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.burger.dao.CartDAO;
import com.burger.db.sqlconfig.IBatisDBConnector;
import com.burger.dto.CartVO;

public class CartDAO_iBatis implements CartDAO {
	private SqlMapClient client = IBatisDBConnector.getSqlMapInstance();
	private static CartDAO_iBatis instance = new CartDAO_iBatis();

	private CartDAO_iBatis() {
	}

	public static CartDAO_iBatis getInstance() {
		return instance;
	}

	@Override
	public void insertCart(CartVO cartVO) throws SQLException {
		client.insert("insertCart", cartVO);
	}

	@Override
	public ArrayList<CartVO> listCart(String userId) throws SQLException {
		ArrayList<CartVO> cartList = new ArrayList<CartVO>();
		cartList = (ArrayList<CartVO>) client.queryForList("listCart", userId);
		return cartList;
	}
	
	@Override
	public CartVO getCart(String cseq) throws SQLException {
		CartVO cartVO=null;
		cartVO=(CartVO)client.queryForObject("getCart", Integer.parseInt(cseq));
		return cartVO;
	}

	@Override
	public void deleteCart(int cseq) throws SQLException {
		client.delete("deleteCart",cseq);
	}

	@Override
	public int updateCart(CartVO cartVO) throws SQLException {
		int result = (Integer)client.update("updateCart", cartVO);
		return result;
	}

}
