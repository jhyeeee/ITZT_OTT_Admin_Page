package ITzy.admin.service;

import java.util.List;

import ITzy.admin.dto.BbsDto;
import ITzy.admin.dto.BbsParam;

public interface BbsService {
	List<BbsDto> bbsList();
	boolean delBbs(BbsDto dto);
	boolean showBbs(BbsDto dto);
}
