package ITzy.admin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ITzy.admin.dao.BbsDao;

import ITzy.admin.dto.BbsDto;
import ITzy.admin.dto.BbsParam;
import ITzy.admin.dto.NbsDto;
import ITzy.admin.service.BbsService;
@Service
public class BbsServiceImpl implements BbsService{
	
	@Autowired
	BbsDao dao;
	@Override
	public List<BbsDto> bbsList() {
		return dao.bbsList();
	}

	@Override
	public boolean delBbs(BbsDto dto) {
		int count = dao.delBbs(dto);
		return count>0?true:false;
	}

	@Override
	public boolean showBbs(BbsDto dto) {
		int count = dao.showBbs(dto);
		return count>0?true:false;
	}
	
}
