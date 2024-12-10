package com.nexwrms.mobweb.ib.ctl;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nexwrms.cfo.com.cm.vo.UsrVo;
import com.nexwrms.core.session.SessionInfoUtil;
import com.nexwrms.core.util.SessionUtil;



@Controller
@RequestMapping("/ib")
public class IbCtl {
	private static final Logger logger = LoggerFactory.getLogger(IbCtl.class);
		
	/**
	 * 외부에서 렌탈 상담 신청받기
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/counselRegOut")
	public String counselRegOut(HttpServletRequest request, Model model) throws Exception {		
		UsrVo userVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_USR_VO);
		String gbn = request.getParameter("gbn");
		String gubun = request.getParameter("gubun");
		String flag = request.getParameter("flag");
		/*
		if(userVo != null) {
			model.addAttribute("userVo", userVo);
		}
		*/
		model.addAttribute("gbn", gbn);
		model.addAttribute("gubun", gubun);
		model.addAttribute("flag", flag);
		return "/ib/counselRegOut";
	}
		
	
}
