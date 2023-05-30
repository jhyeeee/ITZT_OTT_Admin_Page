package ITzy.admin.controller;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ITzy.admin.dto.PpsDto;
import ITzy.admin.dto.QnaDto;
import ITzy.admin.service.PpsService;


@Controller
public class PpsController {
		@Autowired
		//PdsService service;
		PpsService service;
		
		
		@RequestMapping(value = "pps.do", method = RequestMethod.GET)
		public String pps(Model model) {
			String go = "pps";
			model.addAttribute("go",go);
	
			String type = "프로필 관리";
			model.addAttribute("type",type);
			
			List<PpsDto> pps = service.ppsList();
			model.addAttribute("pps", pps);
			
			return "pps";
		}
		
		@RequestMapping(value = "delPps.do", method = RequestMethod.POST)
		public String delPps(Model model,PpsDto dto) {
			String msg ="";
			boolean isS = service.delPps(dto);
			if(isS) {
				msg = "YES";		// 숨김성공
			}else {
				msg = "NO"; 		// 숨김실패
			}

			model.addAttribute("delPps",msg);
			
			return "message";		
		}
		@RequestMapping(value = "showPps.do", method = RequestMethod.POST)
		public String showPps(Model model,PpsDto dto) {
			String msg ="";
			boolean isS = service.showPps(dto);
			if(isS) {
				msg = "YES";		// 노출성공
			}else {
				msg = "NO"; 		// 노출실패
			}
			
			model.addAttribute("showPps",msg);
			
			return "message";		
		}
	
		
}