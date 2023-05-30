package ITzy.admin.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ITzy.admin.dao.BbsDao;

import ITzy.admin.dto.BbsDto;
import ITzy.admin.dto.BbsParam;
import ITzy.admin.dto.NbsDto;
@Repository
public class BbsDaoImpl implements BbsDao{
	
	@Autowired
	SqlSession session;
	
	String ns = "Bbs.";	
	
	@Override
	public List<BbsDto> bbsList() {
		return session.selectList(ns + "bbsList");
	}

	@Override
	public int delBbs(BbsDto dto) {
		return session.update(ns + "delBbs", dto);
	}

	@Override
	public int showBbs(BbsDto dto) {
		return session.update(ns + "showBbs", dto);
	}



}
