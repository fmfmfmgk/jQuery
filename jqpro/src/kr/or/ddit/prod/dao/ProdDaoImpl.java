package kr.or.ddit.prod.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.or.ddit.prod.vo.prodVO;
import kr.or.ddit.util.DBUtil3;

public class ProdDaoImpl implements IProdDao {

	//DB관련 변수 선언
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	//싱글톤
	private static IProdDao dao;
	
	//생성자
	private ProdDaoImpl(){}
	
	public static IProdDao getInstance() {
		if(dao == null) {
			dao = new ProdDaoImpl();
		}
		return dao;
	}
	
	@Override
	public List<prodVO> selectByLgu(String lprod_gu) {
		List<prodVO> list = new ArrayList<prodVO>();
		
		//DB연결
		String sql = "select prod_id, prod_name from prod where prod_lgu=?";
		
		try {
			conn = DBUtil3.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, lprod_gu);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				prodVO vo = new prodVO();
				vo.setProd_id(rs.getString("prod_id"));
				vo.setProd_name(rs.getString("prod_name"));
				list.add(vo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
				try {
					if(rs !=null)rs.close();
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		
		return list;
	}

	@Override
	public prodVO selectById(String lprod_id) {
		// TODO Auto-generated method stub
		return null;
	}

}
