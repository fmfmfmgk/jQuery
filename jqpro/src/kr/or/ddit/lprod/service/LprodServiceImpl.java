package kr.or.ddit.lprod.service;

import java.util.List;

import kr.or.ddit.lprod.dao.ILprodDao;
import kr.or.ddit.lprod.dao.LprodDaoImpl;
import kr.or.ddit.lprod.vo.LprodVo;

public class LprodServiceImpl implements ILprodservice {
	private static ILprodservice service;
	ILprodDao dao;
	
	
	private LprodServiceImpl() {
		dao = LprodDaoImpl.getinstance();
	}
	
	public static ILprodservice getinstance() {
		if(service == null) {
			service = new LprodServiceImpl();
		}
		return service;
	}
	
	@Override
	public List<LprodVo> selectLprod() {
		return dao.selectLprod();
	}
	
}
