package ITzy.admin.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ITzy.admin.dao.NbsDao;
import ITzy.admin.dto.NbsDto;

@Repository
public class NbsDaoImpl implements NbsDao {
	
	@Autowired
	SqlSessionTemplate session;
	
	String ns = "Nbs.";

	@Override
	public List<NbsDto> nbsList() {
		return session.selectList(ns + "nbsList");
	}

	@Override
	public int delNbs(NbsDto dto) {
		return session.update(ns + "delNbs", dto);
	}

	@Override
	public int showNbs(NbsDto dto) {
		return session.update(ns + "showNbs", dto);
	}

}
