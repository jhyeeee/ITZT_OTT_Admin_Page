package ITzy.admin.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ITzy.admin.dao.PpsDao;
import ITzy.admin.dto.MemberDto;
import ITzy.admin.dto.PpsDto;
@Repository
public class PpsDaoImpl implements PpsDao{
	@Autowired
	SqlSessionTemplate session;
	
	String ns = "Pps.";

	@Override
	public int delPps(PpsDto dto) {
		return session.update(ns + "delPps", dto);
	}
	@Override
	public int showPps(PpsDto dto) {
		return session.update(ns + "showPps", dto);
	}@Override
	public List<PpsDto> ppsList() {
		return session.selectList(ns + "ppsList");
	}
	@Override
	public MemberDto viewInfo(String id) {
		return session.selectOne(ns + "viewInfo", id);
	}
}
