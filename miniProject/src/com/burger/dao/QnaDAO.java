package com.burger.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.burger.dto.QnaVO;

public interface QnaDAO {  

  public ArrayList<QnaVO> listQna(String id) throws SQLException;

  public QnaVO getQna(int seq) throws SQLException;
  public void insertqna(QnaVO qnaVO, String session_id) throws SQLException;

  /* *
   * 愿?由ъ옄 紐⑤뱶?뿉?꽌 ?븘?슂?븳 硫붿냼?뱶
   */
  public ArrayList<QnaVO> listAllQna() throws SQLException;

  public void updateQna(QnaVO qnaVO) throws SQLException;
}
