package ITzy.admin.service;

import java.util.List;


import ITzy.admin.dto.MemberDto;
import ITzy.admin.dto.PpsDto;

public interface PpsService {
	List<PpsDto> ppsList();
	boolean delPps(PpsDto dto);
	boolean showPps(PpsDto dto);
	MemberDto viewInfo(String id);
}
