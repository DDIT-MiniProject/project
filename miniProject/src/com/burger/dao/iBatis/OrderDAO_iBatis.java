package com.burger.dao.iBatis;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.catalina.connector.Request;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapSession;
import com.burger.dao.OrderDAO;
import com.burger.db.sqlconfig.IBatisDBConnector;
import com.burger.dto.CartVO;
import com.burger.dto.OrderVO;

public class OrderDAO_iBatis implements OrderDAO {
	private SqlMapClient client = IBatisDBConnector.getSqlMapInstance();
	private static OrderDAO_iBatis instance = new OrderDAO_iBatis();

	private OrderDAO_iBatis() {
	}

	public static OrderDAO_iBatis getInstance() {
		return instance;
	}
	static int view_rows = 10; // 占쎈읂占쎌뵠筌욑옙占쎌벥 揶쏆뮇??
	static int counts = 10;
	
	@Override
	public int totalOrderRecord(String product_name) throws SQLException {
		int total_pages = 0;
		if (product_name.equals("")) {
			product_name = "%";
		}
		total_pages = (Integer) client.queryForObject("totalOrderRecord",product_name);
		return total_pages;
	}
	
	@Override
	public String pageNumber(int tpage, String name) throws SQLException {
		String str = "";

		int total_pages = totalOrderRecord(name);
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
			str += "<a href='adminOrderList.do?tpage=1&key="
					+ name + "'>&lt;&lt;</a>&nbsp;&nbsp;";
			str += "<a href='adminOrderList.do?tpage="
					+ (start_page - 1);
			str += "&key=<%=product_name%>'>&lt;</a>&nbsp;&nbsp;";
		}

		for (int i = start_page; i <= end_page; i++) {
			if (i == tpage) {
				str += "<font color=red>[" + i + "]&nbsp;&nbsp;</font>";
			} else {
				str += "<a href='adminOrderList.do?tpage="
						+ i + "&key=" + name + "'>[" + i + "]</a>&nbsp;&nbsp;";
			}
		}

		if (page_count > end_page) {
			str += "<a href='adminOrderList.do?tpage="
					+ (end_page + 1) + "&key=" + name
					+ "'> &gt; </a>&nbsp;&nbsp;";
			str += "<a href='adminOrderList.do?tpage="
					+ page_count + "&key=" + name
					+ "'> &gt; &gt; </a>&nbsp;&nbsp;";
		}
		return str;
	}

	@Override
	public int insertOrder(ArrayList<CartVO> cartList, String id)
			throws SQLException {
		int maxOseq = 0;		

		// iBatis Transaction
		Connection conn = null;
		SqlMapSession session = null;
			
			conn=client.getDataSource().getConnection();
			session=client.openSession(conn);
			session.insert("insertOrder", id);			
			maxOseq = (Integer)session.queryForObject("selectMaxOseq", null);
			
			for (CartVO cartVO : cartList) {				
				insertOrderDetail(cartVO, maxOseq);
				
			}
		return maxOseq;
	}

	@Override
	public void insertOrderDetail(CartVO cartVO, int maxOseq)
			throws SQLException {		

		Connection conn = null;
		SqlMapSession session = null;
		try {
			conn = client.getDataSource().getConnection();
			session = client.openSession(conn);

			conn.setAutoCommit(false);
			
			OrderVO oVo=new OrderVO();
			oVo.setOseq(maxOseq);
			oVo.setPseq(cartVO.getPseq());
			oVo.setQuantity(cartVO.getQuantity());
			
			session.insert("insertOrderDetail", oVo);			
			session.update("updateCartResult",cartVO.getCseq());
			
			conn.commit();
		} catch (Exception e) {
			conn.rollback();
		}
	}

	@Override
	public ArrayList<OrderVO> listOrderById(String id, String result, int oseq)
			throws SQLException {
		OrderVO oVo=new OrderVO();
		oVo.setId(id);
		oVo.setResult(result);
		oVo.setOseq(oseq);
		
		ArrayList<OrderVO> orderList=(ArrayList<OrderVO>)client.queryForList("listOrderById",oVo);
		
		return orderList;
	}

	@Override
	public ArrayList<Integer> selectSeqOrderIng(String id) throws SQLException {
		ArrayList<Integer> oseqList = (ArrayList<Integer>)client.queryForList("selectSeqOrderIng", id);
		
		return oseqList;
	}
	@Override
	public ArrayList<Integer> selectSeqOrderTotal(String id)
			throws SQLException {
		ArrayList<Integer> oseqList = (ArrayList<Integer>)client.queryForList("selectSeqOrderTotal", id);
		return oseqList;
	}
	@Override
	public ArrayList<OrderVO> listOrder(String member_name) throws SQLException {
		ArrayList<OrderVO> orderList=(ArrayList<OrderVO>)client.queryForList("listOrder",member_name );
		return orderList;
	}

	@Override
	public void updateOrderResult(String oseq) throws SQLException {
		client.update("updateOrderResult",oseq);
	}

	@Override
	public int newOrderSearch() throws SQLException {
		int result=(int) client.queryForObject("newOrderSearch", null);
		return result;
	}

	@Override
	public ArrayList<OrderVO> epistasisList() throws SQLException {
		ArrayList<OrderVO> orderList=(ArrayList<OrderVO>)client.queryForList("epistasisList", null);
		return orderList;
	}	

}
