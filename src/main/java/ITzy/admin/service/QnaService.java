package ITzy.admin.service;

import java.util.List;

import ITzy.admin.dto.QnaDto;

public interface QnaService {
	/*
	List<QnaDto> myQna(String id);
	boolean addQna(QnaDto dto);
	QnaDto findQna(int seq);
	QnaDto ansQna(int seq);
	*/
	List<QnaDto> ilbanQ();
	List<QnaDto> hoewonQ();
	List<QnaDto> gongoQ();
	List<QnaDto> orewQ();
	List<QnaDto> ansComplete();
	
	boolean addAns(QnaDto dto);
}