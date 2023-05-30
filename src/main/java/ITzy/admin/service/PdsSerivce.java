package ITzy.admin.service;

import java.util.List;

import ITzy.admin.dto.BbsParam;
import ITzy.admin.dto.PdsDto;

public interface PdsSerivce {
	public List<PdsDto> pdslist(BbsParam pds);
	int getAllPds(BbsParam pds);
	boolean uploadPds(PdsDto dto);
	void downcount(int seq);	
	PdsDto getPds(int seq);
	boolean updatePds(PdsDto dto);
	PdsDto deletePds(int seq);
}
