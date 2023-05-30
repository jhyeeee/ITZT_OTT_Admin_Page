package ITzy.admin.dao;

import java.util.List;

import ITzy.admin.dto.NbsDto;

public interface NbsDao {
	List<NbsDto> nbsList();
	int delNbs(NbsDto dto);
	int showNbs(NbsDto dto);

}
