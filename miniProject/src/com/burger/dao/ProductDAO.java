package com.burger.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.burger.dto.ProductVO;

public interface ProductDAO {

	// 占쎈뻿占쎄맒占쎈? ?귐딅뮞占쎈뱜 占쎈섯占쎈선占쎌궎疫뀐옙.
	public ArrayList<ProductVO> listNewProduct() throws SQLException;

	// 甕곗쥙?わ옙??占쎄맒占쎈? ?귐딅뮞占쎈뱜 占쎈섯占쎈선占쎌궎疫뀐옙
	public ArrayList<ProductVO> listBestProduct() throws SQLException;

	// 占쎄맒占쎈?甕곕뜇?뉑에占?占쎄맒占쎈?占쎌젟癰귨옙 占쎈립揶쏉옙 揶쏉옙占쎌죬占쎌궎疫뀐옙
	public ProductVO getProduct(String pseq) throws SQLException;

	// 占쎄맒占쎈??ル굝履잒퉪占?占쎄맒占쎈? ?귐딅뮞占쎈뱜 占쎈섯占쎈선占쎌궎疫뀐옙
	public ArrayList<ProductVO> listKindProduct(String kind)
			throws SQLException;

	/*
	 * ?울옙?귐딆쁽占쎈읂占쎌뵠筌욑옙占쎈퓠占쎄퐣 占쎄텢占쎌뒠占쎈┷占쎈뮉 筌롫뗄苑뚳옙諭?
	 */
	public int totalRecord(String product_name) throws SQLException;

	// 占쎈읂占쎌뵠筌욑옙 占쎌뵠占쎈짗占쎌뱽 占쎌맄占쎈립 筌롫뗄?쇽옙諭?
	public String pageNumber(int tpage, String name) throws SQLException;
	
	public ArrayList<ProductVO> listProduct(int tpage, String product_name) throws SQLException;
	
	public int insertProduct(ProductVO product) throws SQLException;
	
	public int updateProduct(ProductVO product) throws SQLException;
	
	public int deleteProduct(String pseq) throws SQLException;
}
