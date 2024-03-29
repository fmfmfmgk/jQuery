package kr.or.ddit.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.config.MybatisUtil;
import kr.or.ddit.member.Vo.MemberVo;
import kr.or.ddit.member.Vo.ZipVo;
import kr.or.ddit.util.DBUtil3;

public class MemberDaoImpl implements IMemberDao {
	
	//db접근 실행 설정
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	//singleton
	private static IMemberDao dao;
	
	private MemberDaoImpl() {}
	
	public static IMemberDao getinstance() {
		if(dao == null) {
			dao = new MemberDaoImpl();
		}
		return dao;
	}
	
	@Override
	public List<MemberVo> getAllMember() {
		List<MemberVo> list = new ArrayList<MemberVo>();
		try {
			conn = DBUtil3.getConnection();
			String sql = "select * from member";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MemberVo vo = new MemberVo();
				vo.setMem_id(rs.getString("mem_id"));
				vo.setMem_pass(rs.getString("mem_pass"));
				vo.setMem_name(rs.getString("mem_name"));
				vo.setMem_bir(rs.getString("mem_bir"));
				vo.setMem_zip(rs.getString("mem_zip"));
				vo.setMem_add1(rs.getString("mem_add1"));
				vo.setMem_add2(rs.getString("mem_add2"));
				vo.setMem_hp(rs.getString("mem_hp"));
				vo.setMem_mail(rs.getString("mem_mail"));
				list.add(vo);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return list;
	}
	
	@Override
	public String selectById(String id) {
		SqlSession session = MybatisUtil.getSqlSession();
		String res = null;
		try {
			res = session.selectOne("Member.selectById",id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			if(session !=null) session.close();
		}
		return res;
	}
	
	@Override
	public List<ZipVo> selectByDong(String dong) {
		SqlSession session = MybatisUtil.getSqlSession();
		List<ZipVo> list = null;
		try {
			list = session.selectList("Member.selectByDong", dong);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session !=null) session.close();
		}
		return list;
	}
	
	@Override
	public int insertMember(MemberVo vo) {
		SqlSession session = MybatisUtil.getSqlSession();
		int cnt = 0;
		try {
			cnt = session.insert("Member.insertMember", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			if(session !=null) session.close();
		}
		return cnt;
	}
}













