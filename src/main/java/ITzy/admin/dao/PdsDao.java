package ITzy.admin.dao;

import java.util.List;

import ITzy.admin.dto.BbsParam;
import ITzy.admin.dto.PdsDto;

public interface PdsDao {
	List<PdsDto> pdslist(BbsParam pds);
	int getAllPds(BbsParam pds);
	int uploadPds(PdsDto dto);
	void downcount(int seq);
	PdsDto getPds(int seq);
	int updatePds(PdsDto dto);
	PdsDto deletePds(int seq);
}
