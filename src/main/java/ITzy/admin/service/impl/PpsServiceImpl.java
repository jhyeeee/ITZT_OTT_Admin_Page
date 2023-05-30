package ITzy.admin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ITzy.admin.dao.PpsDao;
import ITzy.admin.dto.MemberDto;
import ITzy.admin.dto.PpsDto;
import ITzy.admin.service.PpsService;

@Service
public class PpsServiceImpl implements PpsService{
	@Autowired
	PpsDao dao;
	
	@Override
	public boolean delPps(PpsDto dto) {
		int count = dao.delPps(dto);
		return count>0?true:false;
	}
	@Override
	public boolean showPps(PpsDto dto) {
		int count = dao.showPps(dto);
		return count>0?true:false;
	}@Override
	public List<PpsDto> ppsList() {
		return dao.ppsList();
	}@Override
	public MemberDto viewInfo(String id) {
		return dao.viewInfo(id);
	}
	
}
