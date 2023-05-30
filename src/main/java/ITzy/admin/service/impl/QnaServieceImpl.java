package ITzy.admin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ITzy.admin.dao.QnaDao;
import ITzy.admin.dto.QnaDto;
import ITzy.admin.service.QnaService;

@Service
public class QnaServieceImpl implements QnaService {

	@Autowired
	QnaDao dao;
/*	
	@Override
	public List<QnaDto> myQna(String id) {
		return dao.myQna(id);
	}

	@Override
	public boolean addQna(QnaDto dto) {
		int count = dao.addQna(dto);
		return count>0?true:false;
	}
	@Override
	public QnaDto ansQna(int seq) {
		return dao.ansQna(seq);
	}
	@Override
	public QnaDto findQna(int seq) {
		return dao.findQna(seq);
	}
*/
	
	@Override
	public boolean addAns(QnaDto dto) {
		int count = dao.addAns(dto);
		return count>0?true:false;
	}@Override
	public List<QnaDto> gongoQ() {
		return dao.gongoQ();
	}@Override
	public List<QnaDto> hoewonQ() {
		return dao.hoewonQ();
	}@Override
	public List<QnaDto> ilbanQ() {
		return dao.ilbanQ();
	}@Override
	public List<QnaDto> orewQ() {
		return dao.orewQ();
	}@Override
	public List<QnaDto> ansComplete() {
		return dao.ansComplete();
	}
}