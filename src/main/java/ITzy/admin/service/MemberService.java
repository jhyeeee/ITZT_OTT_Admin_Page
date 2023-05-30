package ITzy.admin.service;

import java.util.List;

import ITzy.admin.dto.MemberDto;

public interface MemberService {
	List<MemberDto> allMember();
	MemberDto login(MemberDto dto);
	boolean idCheck(String id);
	boolean addMember(MemberDto dto);
	boolean modifyName(MemberDto dto);
	boolean modifyEmail(MemberDto dto);
	boolean modifyContact(MemberDto dto);
	boolean modifyAuth(MemberDto dto);
	
	List<MemberDto> BizMems();
	List<MemberDto> NomalMems();
	List<MemberDto> BanMems();
	List<MemberDto> Managers();
}
