package ITzy.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


import ITzy.admin.dto.BbsDto;
import ITzy.admin.dto.BbsParam;
import ITzy.admin.dto.BbsDto;
import ITzy.admin.service.BbsService;

@Controller
public class BbsController {

	@Autowired
	BbsService service;


	@RequestMapping(value = "bbs.do", method = RequestMethod.GET)
	public String bbs(Model model) {
		String go = "bbs";
		model.addAttribute("go",go);

		String type = "자유 게시판";
		model.addAttribute("type",type);
		
		List<BbsDto> bbs = service.bbsList();
		model.addAttribute("bbs", bbs);
		
		return "bbs";
	}
	
	@RequestMapping(value = "delBbs.do", method = RequestMethod.POST)
	public String delBbs(Model model,BbsDto dto) {
		String msg ="";
		boolean isS =service.delBbs(dto);
		if(isS) {
			msg = "YES";		// 숨김성공
		}else {
			msg = "NO"; 		// 숨김실패
		}

		model.addAttribute("delBbs",msg);
		
		return "message";		
	}
	@RequestMapping(value = "showBbs.do", method = RequestMethod.POST)
	public String showPps(Model model,BbsDto dto) {
		String msg ="";
		boolean isS = service.showBbs(dto);
		if(isS) {
			msg = "YES";		// 노출성공
		}else {
			msg = "NO"; 		// 노출실패
		}
		
		model.addAttribute("showBbs",msg);
		
		return "message";		
	}
	
}
