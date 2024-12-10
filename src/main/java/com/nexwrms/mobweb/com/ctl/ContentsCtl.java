package com.nexwrms.mobweb.com.ctl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
@RequestMapping("/contents")
public class ContentsCtl {
	private static final Logger logger = LoggerFactory.getLogger(ContentsCtl.class);
	
	/** 
	 * O2O 서비스 정보 o2o_service_intro
	 * @param request 
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/o2oServiceIntro")
	public String o2oServiceIntro(HttpServletRequest request, HttpSession session, Model model) throws Exception {		
		
		//10233006 GA title tag 동적 변경
		model.addAttribute("title", "O2O 서비스 | NEXT LEVEL");
		
		return "/contents/o2oServiceIntro";
	}	
	
	/** 
	 * 렌탈 서비스 rental_service_intro
	 * @param request 
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/rentalServiceIntro")
	public String rentalServiceIntro(HttpServletRequest request, HttpSession session, Model model) throws Exception {		
		
		//10233006 GA title tag 동적 변경
		model.addAttribute("title", "렌탈 서비스 | NEXT LEVEL");
		
		return "/contents/rentalServiceIntro";
	}
	
	/** 
	 * 이용약관
	 * @param request 
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/termOfService")
	public String termOfService(HttpServletRequest request, HttpSession session, Model model) throws Exception {		
		
		return "/contents/termOfService";
	}
		
	/** 
	 * 개인정보처리방침
	 * @param request 
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/privacyPolicy")
	public String privacyPolicy(HttpServletRequest request, HttpSession session, Model model) throws Exception {		
		
		return "/contents/privacyPolicy";
	}
		
	/** 
	 * 보증제도
	 * @param request 
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/guaranteeSystem")
	public String guaranteeSystem(HttpServletRequest request, HttpSession session, Model model) throws Exception {
		
		//10233006 GA title tag 동적 변경
		model.addAttribute("title", "보증제도 안내 | NEXT LEVEL");
		
		return "/contents/guaranteeSystem";
	}
	
}
