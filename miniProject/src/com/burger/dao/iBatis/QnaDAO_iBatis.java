package com.burger.dao.iBatis;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import mvjsp.jdbc.JdbcUtil;
import mvjsp.jdbc.connection.ConnectionProvider;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.burger.dao.QnaDAO;
import com.burger.db.sqlconfig.IBatisDBConnector;
import com.burger.dto.QnaVO;

public class QnaDAO_iBatis implements QnaDAO {
	private SqlMapClient client = IBatisDBConnector.getSqlMapInstance();
	private static QnaDAO_iBatis instance = new QnaDAO_iBatis();

	private QnaDAO_iBatis() {
	}

	public static QnaDAO_iBatis getInstance() {
		return instance;
	}

	public ArrayList<QnaVO> listQna(String id) throws SQLException {
		ArrayList<QnaVO> qnaList = new ArrayList<QnaVO>();
		qnaList = (ArrayList<QnaVO>) client.queryForList("listQna", id);
		return qnaList;
	}

	public QnaVO getQna(int seq) throws SQLException {
		QnaVO qnaVO=(QnaVO)client.queryForObject("getQna",seq);
		return qnaVO;
	}

	public void insertqna(QnaVO qnaVO, String session_id) throws SQLException{		
		qnaVO.setId(session_id);
		client.insert("insertqna",qnaVO);
	}

	/* *
	 * 愿�由ъ옄 紐⑤뱶�뿉�꽌 �븘�슂�븳 硫붿냼�뱶
	 */
	public ArrayList<QnaVO> listAllQna() throws SQLException {
		ArrayList<QnaVO> qnaList = new ArrayList<QnaVO>();
		
		qnaList=(ArrayList<QnaVO>)client.queryForList("listAllQna",null);
		return qnaList;
	}

	public void updateQna(QnaVO qnaVO) throws SQLException{
		client.update("updateQna",qnaVO);
	}
	@Override
	public int totalRecord(String product_name) throws SQLException {
		int total_pages = 0;
		if (product_name.equals("")) {
			product_name = "%";
		}
		total_pages = (Integer) client.queryForObject("TotalQna",product_name);
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
			str += "<a href='adminQnaList.do?tpage=1&key="
					+ name + "'>&lt;&lt;</a>&nbsp;&nbsp;";
			str += "<a href='adminQnaList.do?tpage="
					+ (start_page - 1);
			str += "&key=<%=product_name%>'>&lt;</a>&nbsp;&nbsp;";
		}

		for (int i = start_page; i <= end_page; i++) {
			if (i == tpage) {
				str += "<font color=red>[" + i + "]&nbsp;&nbsp;</font>";
			} else {
				str += "<a href='adminQnaList.do?tpage="
						+ i + "&key=" + name + "'>[" + i + "]</a>&nbsp;&nbsp;";
			}
		}

		if (page_count > end_page) {
			str += "<a href='adminQnaList.do?tpage="
					+ (end_page + 1) + "&key=" + name
					+ "'> &gt; </a>&nbsp;&nbsp;";
			str += "<a href='adminQnaList.do?tpage="
					+ page_count + "&key=" + name
					+ "'> &gt; &gt; </a>&nbsp;&nbsp;";
		}
		return str;
	}

	@Override
	public int newQnaSearch() throws SQLException {
        int result = (int) client.queryForObject("newQnaSearch", null);
		return result;
	}

	@Override
	public ArrayList<QnaVO> epistasisQnaList() throws SQLException {
		ArrayList<QnaVO> qnaList = (ArrayList<QnaVO>)client.queryForList("epistasisQnaList", null);
		return qnaList;
	}

	@Override
	public ArrayList<QnaVO> SearchQnaList(String id) throws SQLException {
		ArrayList<QnaVO> qnaList =(ArrayList<QnaVO>)client.queryForList("SearchQnaList", id);
		return qnaList;
	}
}
