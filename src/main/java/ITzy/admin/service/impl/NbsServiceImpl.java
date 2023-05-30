package ITzy.admin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ITzy.admin.dao.NbsDao;
import ITzy.admin.dto.NbsDto;
import ITzy.admin.service.NbsService;

@Service
public class NbsServiceImpl implements NbsService {
	
	@Autowired
	NbsDao dao;

	@Override
	public List<NbsDto> nbsList() {
		return dao.nbsList();
	}

	@Override
	public boolean delNbs(NbsDto dto) {
		int count = dao.delNbs(dto);
		return count>0?true:false;
	}

	@Override
	public boolean showNbs(NbsDto dto) {
		int count = dao.showNbs(dto);
		return count>0?true:false;
	}

}
