package ITzy.admin.dao;

import java.util.List;

import ITzy.admin.dto.BbsDto;
import ITzy.admin.dto.BbsParam;
import ITzy.admin.dto.NbsDto;

public interface BbsDao {
	
	List<BbsDto> bbsList();
	int delBbs(BbsDto dto);
	int showBbs(BbsDto dto);
}
