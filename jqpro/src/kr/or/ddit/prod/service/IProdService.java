package kr.or.ddit.prod.service;

import java.util.List;

import kr.or.ddit.prod.vo.prodVO;

public interface IProdService {
	
	public List<prodVO> selectByLgu(String lprod_gu);
	public prodVO selectById(String lprod_id);
}
