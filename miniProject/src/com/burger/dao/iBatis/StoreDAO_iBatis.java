package com.burger.dao.iBatis;

import java.sql.SQLException;

import java.util.ArrayList;

import com.burger.dao.StoreDAO;
import com.burger.db.sqlconfig.IBatisDBConnector;
import com.burger.dto.StoreVO;
import com.ibatis.sqlmap.client.SqlMapClient;

public class StoreDAO_iBatis implements StoreDAO {
	private SqlMapClient client = IBatisDBConnector.getSqlMapInstance();
	private static StoreDAO_iBatis instance = new StoreDAO_iBatis();

	private StoreDAO_iBatis() {
	}

	public static StoreDAO_iBatis getInstance() {
		return instance;
	}
	
	@Override
	public ArrayList<StoreVO> searchStore(String dong, String key)throws SQLException {
		ArrayList<StoreVO> searchList = (ArrayList<StoreVO>)client.queryForList("searchStore", key);
		return searchList;
	}

	@Override
	public ArrayList<StoreVO> selectAllStore() throws SQLException {
		ArrayList<StoreVO> allList = (ArrayList<StoreVO>) client.queryForList("selectAllStore",null);
		return allList;
	}
	
	@Override
	public int storeTotalRecord(String name) throws SQLException {
		int total_pages = 0;
		if (name.equals("")) {
			name = "%";
		}
		total_pages = (Integer)client.queryForObject("storeTotalRecord",name);
		return total_pages;
	}

	static int view_rows = 20; // 페이지의 개수
	static int counts = 20; // 한 페이지에 나타낼 상품의 개수
	
	
	@Override
	public ArrayList<StoreVO> listStore(int tpage, String name)
			throws SQLException {
		ArrayList<StoreVO> storeList = new ArrayList<StoreVO>();
		int startRow = -1;
		int endRow = -1;

		if (name.equals("")) {
			name = "%";
		}

		int totalRecord = storeTotalRecord(name);

		startRow = (tpage - 1) * counts ;
		endRow = startRow + counts - 1;
		if (endRow > totalRecord)
			endRow = totalRecord;
		
		storeList=(ArrayList<StoreVO>)client.queryForList("listStore",name,startRow,counts);
		return storeList;
	}
	
	
	@Override
	public String pageNumber(int tpage, String name) throws SQLException {
		String str = "";

		int total_pages = storeTotalRecord(name);
		int page_count = total_pages / counts + 1;

		if (total_pages % counts == 0) {
			page_count--;
		}
		if (tpage < 1) {
			tpage = 1;
		}

		int start_page = tpage - (tpage % view_rows) + 1;
		int end_page = start_page + (counts - 1);

		if (end_page > page_count) {
			end_page = page_count;
		}
		if (start_page > view_rows) {
			str += "<a href='storeForm.do?tpage=1&key="+ name + "'>&lt;&lt;</a>&nbsp;&nbsp;";
			str += "<a href='storeForm.do?tpage="+ (start_page - 1);
			str += "&key=<%=name%>'>&lt;</a>&nbsp;&nbsp;";
		}

		for (int i = start_page; i <= end_page; i++) {
			if (i == tpage) {
				str += "<font color=red>[" + i + "]&nbsp;&nbsp;</font>";
			} else {
				str += "<a href='storeForm.do?tpage="+ i + "&key=" + name + "'>[" + i + "]</a>&nbsp;&nbsp;";
			}
		}

		if (page_count > end_page) {
			str += "<a href='storeForm.do?tpage="+ (end_page + 1) + "&key=" + name
					+ "'> &gt; </a>&nbsp;&nbsp;";
			str += "<a href='storeForm.do?tpage="+ page_count + "&key=" + name+ "'> &gt; &gt; </a>&nbsp;&nbsp;";
		}
		return str;
	}

}
