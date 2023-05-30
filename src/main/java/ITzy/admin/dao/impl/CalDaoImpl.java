package ITzy.admin.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ITzy.admin.dao.CalDao;
import ITzy.admin.dto.CalDto;

@Repository
public class CalDaoImpl implements CalDao{
	
	

	@Autowired
	SqlSession session;
	
	String ns = "Cal.";

	//일정쓰기
	@Override
	public boolean calWrite(CalDto dto) {
		int count = 0;
		count = session.insert(ns + "calWrite", dto);
		return count>0?true:false;
	}

	//일정목록
	@Override
	public List<CalDto> calList(String id, String yyyyMMdd) {
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("yyyyMMdd", yyyyMMdd);
		List<CalDto> list = session.selectList(ns + "calList", map);
		return list;
	}
	
	//상세보기
	public CalDto calDetail (int seq) {
		CalDto dto = session.selectOne(ns + "calDetail", seq);
		return dto;
	}
	
	//일정수정
	public boolean calUpdate(CalDto dto) {
		int count= session.update(ns + "calUpdate", dto);
		return count>0?true:false;
	}
	
	//일정삭제
	public boolean calDelete(int seq) {
		int count = session.delete(ns + "calDelete", seq);
		return count>0?true:false;
	}

	@Override
	public CalDto getDay(int seq) {
		CalDto dto = session.selectOne(ns + "getDay", seq);
		return dto;
	}
	
	// 달력에 일정 최대3개만 불러오기
	public List<CalDto> calView(String id, String yyyyMM){
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("yyyyMM", yyyyMM);
		
		return session.selectList(ns + "calView", map);
	}

	@Override
	public CalDto calModal(int seq) {
		CalDto dto = session.selectOne(ns + "calModal", seq);
		return dto;
	}
	
	

	
	
	
}
