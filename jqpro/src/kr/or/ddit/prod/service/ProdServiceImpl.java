package kr.or.ddit.prod.service;

import java.util.List;

import kr.or.ddit.prod.dao.IProdDao;
import kr.or.ddit.prod.dao.ProdDaoImpl;
import kr.or.ddit.prod.vo.prodVO;

public class ProdServiceImpl implements IProdService {
	private static IProdService service;
	
	private IProdDao dao;
	
	private ProdServiceImpl() {
		dao = ProdDaoImpl.getInstance();
	}
	
	//자신의 객체 생성리턴
	public static IProdService getInstance() {
		if(service ==null) {
			service = new ProdServiceImpl();
		}
		return service;
	}
	
	@Override
	public List<prodVO> selectByLgu(String lprod_gu) {
		return dao.selectByLgu(lprod_gu);
	}

	@Override
	public prodVO selectById(String lprod_id) {
		return dao.selectById(lprod_id);
	}

}
