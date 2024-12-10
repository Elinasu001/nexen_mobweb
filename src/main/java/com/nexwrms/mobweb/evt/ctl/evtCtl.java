package com.nexwrms.mobweb.evt.ctl;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nexwrms.cfo.com.cm.svc.AbstractCfoSvc;
import com.nexwrms.cfo.com.cm.vo.PageVo;
import com.nexwrms.cfo.com.cm.vo.UsrVo;
import com.nexwrms.cfo.com.constants.WebConstants;
import com.nexwrms.cfo.util.CookieUtil;
import com.nexwrms.cfo.util.SessionInfoUtil;
import com.nexwrms.core.util.SessionUtil;
import com.nexwrms.nextlevel.com.evt.svc.EvtSvc;
import com.nexwrms.nextlevel.com.evt.vo.EvtSearchVo;
import com.nexwrms.nextlevel.com.evt.vo.EvtVo;
import com.nexwrms.nextlevel.com.login.vo.ReRentalVo;



@Controller
@RequestMapping("/evt")
public class evtCtl extends AbstractCfoSvc{

private static final Logger logger = LoggerFactory.getLogger(evtCtl.class);

	@Autowired
	private EvtSvc evtSvc;

	@Autowired
	private CookieUtil cookieUtil;

	/**
	 * 타이어 팁
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/evtList")
	public String EvtList(HttpServletRequest request, Model model) throws Exception {
		String rUrl = "";

		model.addAttribute("headerCss" , "");
		model.addAttribute("viewGbn", "H");
		rUrl = "/evt/evtList";
		
		//10233006 GA title tag 동적 변경
		model.addAttribute("title", "이벤트 | NEXT LEVEL");

		return rUrl;
	}


	//이벤트 목록
	@RequestMapping("/selectEvtList")
	@ResponseBody
	public Map<String, Object> selectEvtList(HttpServletRequest request,@RequestBody EvtSearchVo vo , Model model
			,@RequestParam(required = false, value="searchTypeQna")String searchTypeQna) throws Exception {


		PageVo pageVo = new PageVo();
		pageVo.setTotalCount(evtSvc.selectEvtCnt(vo));
		pageVo.setPageNo(vo.getPageNo());
		pageVo.setPageSize(10);


		Map<String, Object> map = new HashMap<String, Object>();

		map.put("selectEvtList", evtSvc.selectEvtList(vo));
		map.put("pageCommon", pageVo);

		//성공일 때 리턴 형식 - 질문 목록 조회는 무조건 성공응로 한다.
				// 이유 : 조회가 1건이든, 0건이든 성공이기 맞는 의미이기 때문.
		map.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_OK);
		map.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_OK);

		return map;

	}



	@RequestMapping("/evtDetail")
	public String evtDetail(HttpServletRequest request, HttpServletResponse response, Model model
			, @RequestParam(required = true) String bdojSeq
			, @RequestParam(required = false) String utm_source
			)throws Exception {

		EvtSearchVo searchVo = new EvtSearchVo();
		searchVo.setBdojSeq(bdojSeq);

		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		Calendar cal = Calendar.getInstance();

		EvtVo evtDetailVo = evtSvc.selectEvtDetail(searchVo);
		Date endDate = sdf.parse(evtDetailVo.getEvent_end_dy());
		Date startDate = sdf.parse(evtDetailVo.getEvent_str_dy());
		
		cal.setTime(endDate);
		cal.add(Calendar.DATE, 1);
		endDate = cal.getTime();

		if(endDate.before(today) || startDate.after(today)){
			evtDetailVo.setEvtInProgress(false);
		}else{
			evtDetailVo.setEvtInProgress(true);
		}

		EvtVo evtPreVo = evtSvc.selectEvtPre(searchVo);
		EvtVo evtPostVo = evtSvc.selectEvtPost(searchVo);

		EvtVo evtWinPreVo = evtSvc.selectEvtWinPre(searchVo);
		EvtVo evtWinPostVo = evtSvc.selectEvtWinPost(searchVo);

		UsrVo userVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_USR_VO);
		ReRentalVo clientVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_CLIENT_VO);
		model.addAttribute("userVo"         , userVo);
		model.addAttribute("clientVo"       , clientVo);

		model.addAttribute("evtDetailVo", evtDetailVo);
		model.addAttribute("evtPreVo", evtPreVo);
		model.addAttribute("evtPostVo", evtPostVo);
		model.addAttribute("evtWinPreVo", evtWinPreVo);
		model.addAttribute("evtWinPostVo", evtWinPostVo);

		//Cookie 생성
		if(StringUtils.isNotEmpty(utm_source)){

			cookieUtil.newAddCookie(response, "ifwChnCookie", utm_source);
			/*
			//기존 cookie 존재시 삭제후 재입력
			Cookie cookieChnDel = new Cookie("ifwChnCookie",null);
			cookieChnDel.setMaxAge(0);
			response.addCookie(cookieChnDel);

			Cookie cookieChn = new Cookie("ifwChnCookie",utm_source);
			cookieChn.setPath("/order");
			response.addCookie(cookieChn);
			logger.debug("Cookie Name = "+cookieChn.getName() + " / Cookie Value = " + cookieChn.getValue() );
			*/
		}

		return "/evt/evtDetail";
	}

}
