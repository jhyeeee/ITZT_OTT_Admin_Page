package ITzy.admin.dao;

import java.util.List;


import ITzy.admin.dto.MemberDto;
import ITzy.admin.dto.PpsDto;

public interface PpsDao {
	List<PpsDto> ppsList();
	int delPps(PpsDto dto);
	int showPps(PpsDto dto);
	MemberDto viewInfo(String id);
	
}
