package ITzy.admin.service;

import java.util.List;

import ITzy.admin.dto.CalDto;

public interface CalService {

		//일정추가
		boolean calWrite(CalDto dto);
		
		//일정목록조회
		List<CalDto> calList(String id, String yyyyMMdd);
		
		//일정상세
		public CalDto calDetail (int seq);
		public CalDto calModal (int seq);
		//일정수정
		public boolean calUpdate(CalDto dto);
		
		//일정삭제
		public boolean calDelete(int seq);
		
		public CalDto getDay(int seq);
		
		public List<CalDto> calView(String id, String yyyyMM);
}
