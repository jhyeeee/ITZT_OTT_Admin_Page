 package ITzy.admin.controller;



import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


import ITzy.admin.dto.CalDto;
import ITzy.admin.dto.MemberDto;
import ITzy.admin.service.CalService;
import ITzy.admin.util.CalUtil;




@Controller
public class CalController {
	
	
	@Autowired
	CalService service;
	
//	@RequestMapping("/calendar.do")
//    public ModelAndView showCalendar() {
//        ModelAndView mav = new ModelAndView();
//        mav.setViewName("calendar");
//        return mav;
//    }
	
	@RequestMapping(value="calendar.do", method= RequestMethod.GET)
    public String calendar(HttpServletRequest req, Model model, String year, String month) {	
		
		HttpSession session = req.getSession();
		String id = ((MemberDto) session.getAttribute("login")).getId();
		
		if(year == null || month == null) {
			Calendar cal = Calendar.getInstance();
			year = cal.get(Calendar.YEAR)+ "";
			month = cal.get(Calendar.MONTH)+1+ "";
		}else {
			int yearInt = Integer.parseInt(year);
			int monthInt = Integer.parseInt(month);
			
			if(monthInt>12){
				monthInt=1;
				yearInt++;
			}
			if(monthInt<1){
				monthInt=12;
				yearInt--;
			}
			
			// int를 String으로 변환
			year=yearInt+"";
			month=String.valueOf(monthInt);
		}
		
		String yyyyMM = year+ CalUtil.isTwo(month);
		List<CalDto> vlist = service.calView(id, yyyyMM);
		System.out.println("/////"+id);
		System.out.println("/////"+yyyyMM);
		model.addAttribute("vlist", vlist);
		
		return "calendar";
    }
	
	@RequestMapping(value="callist.do", method= RequestMethod.GET)
    public String calList(HttpServletRequest req, Model model, @RequestParam Map<String, String> map) {
        
		// 년월일을 8자리로 만들기위해 1자리값은 2자리로 만들어서 8자리로 만든다
//		String yyyyMMdd = year  +(month.length()<2?"0"+month:month)
//									+(day.length()<2?"0"+day:day);
		
		String yyyyMMdd = map.get("year")  
							+CalUtil.isTwo(map.get("month"))
							+CalUtil.isTwo(map.get("day"));
		System.out.println("/////////// 확인"+yyyyMMdd);
		
		HttpSession session = req.getSession();
		String id = ((MemberDto) session.getAttribute("login")).getId();
		//String id="aaaa";
		System.out.println("/////////// 확인"+ id);
		
		List<CalDto> list = service.calList(id, yyyyMMdd);
		model.addAttribute("list",list);
		
		return "callist";
    }
	
	@RequestMapping(value="/calwrite.do", method= RequestMethod.GET)
    public String calwrite(Model model) {

		return "calwrite";
    }
	
	@PostMapping(value = "calwriteAf.do")
	public String calWriteAf(Model model, CalDto dto,String date, String time) {
		
				
		
		String datesplit[] = date.split("-");
		String year = datesplit[0];
		String month = datesplit[1];
		String day = datesplit[2];

		String timesplit[] = time.split(":");
		String hour = timesplit[0];
		String min = timesplit[1];
		
		
		String rdate = year + month + day + hour + min;
		
		boolean isS = service.calWrite(new CalDto(0, dto.getId(), dto.getTitle(), dto.getContent(), rdate, null));
		
		
		String calWrite = "";		
		if(isS) {
			
			calWrite = "Cal_ADD_OK";
		}else {
			
			calWrite = "Cal_ADD_NG";
		}
		model.addAttribute("calWrite", calWrite);
		
		// return "message";
		return "message";	
		
	}
	
	@GetMapping(value = "caldetail.do")
	public String calDetail(int seq, Model model) {
		CalDto dto = service.calDetail(seq);
		model.addAttribute("caldetail",dto);
		
		return "caldetail";
	}
	
	
	@GetMapping(value = "calmodal.do")
	public String calmodal(int seq, Model model) {
		CalDto dto = service.calModal(seq);
		model.addAttribute("calmodal",dto);
		
		return "calmodal";
	}

	
	@GetMapping(value = "calupdate.do")
	public String calUpdate(Model model, int seq) {
		CalDto dto = service.calDetail(seq);
		model.addAttribute("dto", dto);
		
		return "calupdate";
	}
	
	@PostMapping(value = "calupdateAf.do")
	public String calupdateAf(Model model, CalDto dto, String date, String time) {
		System.out.println(dto.toString());
		
		String datesplit[] = date.split("-");
		String year = datesplit[0];
		String month = datesplit[1];
		String day = datesplit[2];

		String timesplit[] = time.split(":");
		String hour = timesplit[0];
		String min = timesplit[1];
		
		
		String rdate = year + month + day + hour + min;
		
		
		boolean isS = service.calUpdate(new CalDto(dto.getSeq(), null, dto.getTitle(), dto.getContent(), rdate, null));
		
		String calupdate = "";
		if(isS) {			
		    calupdate = "Cal_UPDATE_OK";
		} else {
		    calupdate = "Cal_UPDATE_NG";
		}
		model.addAttribute("calupdate", calupdate);
		//model.addAttribute("seq", dto.getSeq());
		
		return "message";
	}
	
	
	@GetMapping("caldelete.do")
    public String calDelete(int seq, Model model) {
        boolean isS = service.calDelete(seq);
        
        String caldelete = "";
        
		if(isS) {			
			caldelete = "Cal_DELETE_OK";
		} else {
			caldelete = "Cal_DELETE_NG";
		}
		
		model.addAttribute("caldelete", caldelete);
        return "message";
    }
    
    
	
}
