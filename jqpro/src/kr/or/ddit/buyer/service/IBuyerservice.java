package kr.or.ddit.buyer.service;

import java.util.List;

import kr.or.ddit.buyer.vo.BuyerVo;

public interface IBuyerservice {
	public List<BuyerVo> selectByName();
	public BuyerVo selectByList(String name);
}
