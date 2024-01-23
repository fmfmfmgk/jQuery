package kr.or.ddit.member.dao;

import java.util.List;

import kr.or.ddit.member.Vo.MemberVo;
import kr.or.ddit.member.Vo.ZipVo;

public interface IMemberDao {
	
	//전체 리스트 가져오기
	public List<MemberVo> getAllMember();
	
	//아이디 중복검사
	public String selectById(String id);
	
	//우편번호 검색
	public List<ZipVo> selectByDong(String dong);
	
	//전송(가입신청)
	public int insertMember(MemberVo vo);
}
