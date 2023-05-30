package ITzy.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ITzy.admin.dto.MemberDto;
import ITzy.admin.dto.QnaDto;
import ITzy.admin.service.QnaService;

@Controller
public class QnaController {

	@Autowired
	QnaService service;
	
	@RequestMapping(value = "qnalist.do",method = RequestMethod.GET)
	public String qnalist(Model model) {
		
		
		String go = "qnalist";
		model.addAttribute("go",go);
		
		String type = "일반질문";
		model.addAttribute("type",type);
		
		List<QnaDto> qna = service.ilbanQ();
		model.addAttribute("qna", qna);
		
		return "qnalist";
	}
	
	@RequestMapping(value = "addAns.do", method = RequestMethod.POST)
	public String modifyName(QnaDto dto,Model model,@RequestParam String go) {
//		System.out.println("MemberController modifyName " + new Date());
		String msg ="";
		boolean isS = service.addAns(dto);
		if(isS) {
			msg = "YES";		// 답변성공
		}else {
			msg = "NO"; 		// 답변실패
		}
		model.addAttribute("go",go);
		model.addAttribute("addAns",msg);
		
		return "message";		
	}	
	
	
	@RequestMapping(value = "hoewonQ.do",method = RequestMethod.GET)
	public String hoewonQ(Model model) {
		
		
		String go = "hoewonQ";
		model.addAttribute("go",go);
		
		String type = "회원문의";
		model.addAttribute("type",type);
		
		List<QnaDto> qna = service.hoewonQ();
		model.addAttribute("qna", qna);
		
		return "hoewonQ";
	}
	
	
	@RequestMapping(value = "gongoQ.do",method = RequestMethod.GET)
	public String gongoQ(Model model) {
		
		
		String go = "gongoQ";
		model.addAttribute("go",go);
		
		String type = "공고문의";
		model.addAttribute("type",type);
		
		List<QnaDto> qna = service.gongoQ();
		model.addAttribute("qna", qna);
		
		return "gongoQ";
	}
	

	
	@RequestMapping(value = "orewQ.do",method = RequestMethod.GET)
	public String orewQ(Model model) {
		
		
		String go = "orewQ";
		model.addAttribute("go",go);
		
		String type = "오류신고";
		model.addAttribute("type",type);
		
		List<QnaDto> qna = service.orewQ();
		model.addAttribute("qna", qna);
		
		return "orewQ";
	}
	
	
	@RequestMapping(value = "ansComplete.do",method = RequestMethod.GET)
	public String ansComplete(Model model) {
		
		
		String go = "ansComplete";
		model.addAttribute("go",go);
		
		String type = "답변완료글[최신답변순 정렬/수정가능]";
		model.addAttribute("type",type);
		
		List<QnaDto> qna = service.ansComplete();
		model.addAttribute("qna", qna);
		
		return "ansComplete";
	}
	

	
	
}