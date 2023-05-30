package ITzy.admin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ITzy.admin.dao.CalDao;
import ITzy.admin.dto.CalDto;
import ITzy.admin.service.CalService;

@Service
public class CalServiceImpl implements CalService{
	
	@Autowired
	CalDao dao;

	@Override
	public boolean calWrite(CalDto dto) {
		return dao.calWrite(dto);
	}

	@Override
	public List<CalDto> calList(String id, String yyyyMMdd) {
		return dao.calList(id, yyyyMMdd);
	}

	@Override
	public CalDto calDetail(int seq) {
		return dao.calDetail(seq);
	}

	@Override
	public boolean calUpdate(CalDto dto) {
		return dao.calUpdate(dto);
	}

	@Override
	public boolean calDelete(int seq) {
		return dao.calDelete(seq);
	}

	@Override
	public CalDto getDay(int seq) {
		return dao.getDay(seq);
	}

	@Override
	public List<CalDto> calView(String id, String yyyyMM) {
		return dao.calView(id, yyyyMM);
	}

	@Override
	public CalDto calModal(int seq) {
		return dao.calModal(seq);
	}

	
	
	

}
