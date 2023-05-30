package ITzy.admin.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ITzy.admin.dao.QnaDao;
import ITzy.admin.dto.QnaDto;

@Repository
public class QnaDaoImpl implements QnaDao {

	@Autowired
	SqlSession session;

	String ns = "Qna.";
/*
	@Override
	public List<QnaDto> myQna(String id) {
		return session.selectList("Qna.myQna",id);
	}

	@Override
	public int addQna(QnaDto dto) {
		return session.insert(ns+"addQna",dto);
	}
	
	@Override
	public QnaDto ansQna(int seq) {
		return session.selectOne(ns+"ansQna",seq);
	}
	
	@Override
	public QnaDto findQna(int seq) {
		return session.selectOne(ns+"findQna",seq);
	}
	*/
	@Override
	public int addAns(QnaDto dto) {
		return session.insert(ns+"addAns",dto);
	}@Override
	public List<QnaDto> gongoQ() {
		return session.selectList(ns+"gongoQ");
	}@Override
	public List<QnaDto> hoewonQ() {
		return session.selectList(ns+"hoewonQ");
	}@Override
	public List<QnaDto> ilbanQ() {
		return session.selectList(ns+"ilbanQ");
	}@Override
	public List<QnaDto> orewQ() {
		return session.selectList(ns+"orewQ");
	}@Override
	public List<QnaDto> ansComplete() {
		return session.selectList(ns+"ansComplete");
	}
}
