package kr.or.ddit.buyer.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.buyer.vo.BuyerVo;
import kr.or.ddit.config.MybatisUtil;

public class BuyerDaoImpl implements IBuyerDao{
	private static IBuyerDao dao;
	
	private BuyerDaoImpl() {}
	
	public static IBuyerDao getInstance() {
		if(dao == null) {
			dao = new BuyerDaoImpl();
		}
		return dao;
	}
	
	@Override
	public List<BuyerVo> selectByName() {
		SqlSession session = MybatisUtil.getSqlSession();
		List<BuyerVo> list = new ArrayList<BuyerVo>();
		try {
			list = session.selectList("Buyer.selectByName");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			if(session != null) session.close();
		}
		return list;
	}

	@Override
	public BuyerVo selectByList(String name) {
		SqlSession session = MybatisUtil.getSqlSession();
		BuyerVo vo = new BuyerVo();
		try {
			vo = session.selectOne("Buyer.selectByList",name);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			if(session != null) session.close();
		}
		
		return vo;
	}

}
