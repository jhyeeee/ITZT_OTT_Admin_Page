package ITzy.admin.dao;

import java.util.List;

import ITzy.admin.dto.QnaDto;

public interface QnaDao {
	/*
	List<QnaDto> myQna(String id);
	int addQna(QnaDto dto);
	QnaDto findQna(int seq);
	QnaDto ansQna(int seq);
*/
	List<QnaDto> ilbanQ();
	List<QnaDto> hoewonQ();
	List<QnaDto> gongoQ();
	List<QnaDto> orewQ();
	List<QnaDto> ansComplete();
	
	int addAns(QnaDto dto);
}