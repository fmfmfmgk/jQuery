package kr.or.ddit.member.service;

import java.util.List;

import kr.or.ddit.member.Vo.MemberVo;
import kr.or.ddit.member.dao.IMemberDao;
import kr.or.ddit.member.dao.MemberDaoImpl;

public class MemberServiceImpl implements IMemberService {
	//dao객체가 필요 - dao메소드 호출 -> 결과값을 받아서 controller로 넘김
	private IMemberDao dao;
	
	//싱글톤 자신의객체
	private static IMemberService service;
	
	//생성자 -> dao객체 얻어오기
	private MemberServiceImpl() {
		dao = MemberDaoImpl.getinstance();
	}
	
	public static IMemberService getinstance() {
		if(service == null) {
			service = new MemberServiceImpl();
		}
		return service;
	}
	
	
	@Override
	public List<MemberVo> getAllMember() {
		return dao.getAllMember();
	}
}
