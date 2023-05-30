package ITzy.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ITzy.admin.dto.NbsDto;
import ITzy.admin.service.NbsService;

@Controller
public class NbsController {

	@Autowired
	NbsService service;
	
	
	@RequestMapping(value = "nbs.do", method = RequestMethod.GET)
	public String nbs(Model model) {
		String go = "nbs";
		model.addAttribute("go",go);

		String type = "공고 게시판";
		model.addAttribute("type",type);
		
		List<NbsDto> nbs = service.nbsList();
		model.addAttribute("nbs", nbs);
		
		return "nbs";
	}
	
	@RequestMapping(value = "delNbs.do", method = RequestMethod.POST)
	public String delNbs(Model model,NbsDto dto) {
		String msg ="";
		boolean isS =service.delNbs(dto);
		if(isS) {
			msg = "YES";		// 숨김성공
		}else {
			msg = "NO"; 		// 숨김실패
		}

		model.addAttribute("delNbs",msg);
		
		return "message";		
	}
	@RequestMapping(value = "showNbs.do", method = RequestMethod.POST)
	public String showPps(Model model,NbsDto dto) {
		String msg ="";
		boolean isS = service.showNbs(dto);
		if(isS) {
			msg = "YES";		// 노출성공
		}else {
			msg = "NO"; 		// 노출실패
		}
		
		model.addAttribute("showNbs",msg);
		
		return "message";		
	}
	
}
