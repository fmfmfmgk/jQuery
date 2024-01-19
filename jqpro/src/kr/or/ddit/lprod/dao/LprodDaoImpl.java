package kr.or.ddit.lprod.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.or.ddit.lprod.vo.LprodVo;
import kr.or.ddit.util.DBUtil3;

public class LprodDaoImpl implements ILprodDao {
	private static ILprodDao dao;
	
	private LprodDaoImpl(){}
	
	
	public static ILprodDao getinstance() {
		if(dao == null) {
			dao = new LprodDaoImpl();
		}
		return dao;
	}
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	@Override
	public List<LprodVo> selectLprod() {
		List<LprodVo> list = new ArrayList<LprodVo>();
		String sql = "SELECT * FROM LPROD";
		
		try {
			conn = DBUtil3.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				LprodVo vo = new LprodVo();
				vo.setLprod_id(rs.getInt("LPROD_ID"));
				vo.setLprod_nm(rs.getString("LPROD_NM"));
				vo.setLprod_gu(rs.getString("LPROD_GU"));
				list.add(vo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		
		return list;
	}

}
