package ITzy.admin.dao;

import java.util.List;

import ITzy.admin.dto.MemberDto;

public interface MemberDao {
	List<MemberDto> allMember();
	int idCheck(String id);
	int addMember(MemberDto dto);
	MemberDto login(MemberDto dto);
	int modifyName(MemberDto dto);
	int modifyEmail(MemberDto dto);
	int modifyContact(MemberDto dto);
	int modifyAuth(MemberDto dto);
	
	List<MemberDto> BizMems();
	List<MemberDto> NomalMems();
	List<MemberDto> BanMems();
	List<MemberDto> Managers();
	
}
