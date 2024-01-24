package kr.or.ddit.buyer.service;

import java.util.List;

import kr.or.ddit.buyer.dao.BuyerDaoImpl;
import kr.or.ddit.buyer.dao.IBuyerDao;
import kr.or.ddit.buyer.vo.BuyerVo;

public class BuyerserviceImpl implements IBuyerservice {
	private static IBuyerservice service;
	private static IBuyerDao dao;
	
	private BuyerserviceImpl() {
		dao = BuyerDaoImpl.getInstance();
	}
	
	public static IBuyerservice getInstance() {
		if(service == null) {
			service = new BuyerserviceImpl();
		}
		return service;
	}
	
	@Override
	public List<BuyerVo> selectByName() {
		return dao.selectByName();
	}

	@Override
	public BuyerVo selectByList(String name) {
		return dao.selectByList(name);
	}

}
