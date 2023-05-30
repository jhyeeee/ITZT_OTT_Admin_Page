package ITzy.admin.util;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class CalUtil {

	
	// 토요일 일요일 색 처리
	public static String fontColor(int dayOfWeek, int i){
		String color="";
		if((dayOfWeek-1+i)%7==0){//토요일 
			color="blue";
		}else if((dayOfWeek-1+i)%7==1){
			color="red";
		}else{
			color="#333";
		}
		return color;
	}
	
	public static String isTwo(String msg) {
		
		return msg.length()<2?"0"+msg:msg;
	
	}
	
	//날짜 바꾸기
	public static String toDates(String mdate) {
		
		// 날짜 형식
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 hh시 mm분");
		
		// 202302170942 -> yyyy-MM-dd hh:mm
		String s = mdate.substring(0, 4) + "-"		// yyyy
					+ mdate.substring(4, 6) + "-"	// MM
					+ mdate.substring(6, 8) + " "	// dd
					+ mdate.substring(8, 10) + ":"	// hh
					+ mdate.substring(10) + ":00";	// mm		
		Timestamp d = Timestamp.valueOf(s); 
		
		return sdf.format(d);
	}
	
	
	
}