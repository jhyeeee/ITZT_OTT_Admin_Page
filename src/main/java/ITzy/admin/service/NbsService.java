package ITzy.admin.service;

import java.util.List;

import ITzy.admin.dto.NbsDto;

public interface NbsService {
	List<NbsDto> nbsList();
	boolean delNbs(NbsDto dto);
	boolean showNbs(NbsDto dto);
}
