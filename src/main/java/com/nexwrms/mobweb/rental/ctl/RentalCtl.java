package com.nexwrms.mobweb.rental.ctl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nexwrms.cfo.com.cm.svc.AbstractCfoSvc;
import com.nexwrms.cfo.com.constants.WebConstants;
import com.nexwrms.nextlevel.com.mypage.svc.RentalMypageSvc1;
import com.nexwrms.nextlevel.com.mypage.vo.RentalVo;

/**
 * @class Name : MainCtl.java
 * @Description : FO main & terms of use
 * @RequestMapping ('/main'), ('terms')
 * @Modification Information
 * @
 * @ Date            Author       Description
 * @ -------------  -----------  -------------
 * @ 2018. 10. 03.    이시은		  최초 생성
 *
 */
@RequestMapping("/rental")
@Controller
public class RentalCtl extends AbstractCfoSvc {
	private static final Logger logger = LoggerFactory.getLogger(RentalCtl.class);
	
	@Autowired
    private RentalMypageSvc1 rentalMypageSvc1;
	
	/**
	 * 판매인용 렌탈료 조회
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/selectOrdAgentRentalAmt")
	@ResponseBody
	public Map<String, Object> selectOrdAgentRentalAmt(HttpServletRequest request, @RequestBody RentalVo vo) throws Exception {
		Map<String, Object> rsMap = new HashMap<String, Object>();
		Map<String, Object> rqMap = new HashMap<String, Object>();
		
		rqMap.put("classCd", vo.getClassCd());
		rqMap.put("cntCd", vo.getCntCd());
		rqMap.put("periodCd", vo.getPeriodCd());
		rqMap.put("gradeCd", vo.getGradeCd());
		rqMap.put("inch", vo.getInch());
		
		Map<String,Object> myListMap = rentalMypageSvc1.select_p_sRtsd0410List(rqMap);
		List<Map<String, Object>> rtnList = (List<Map<String, Object>>) myListMap.get("list");

		rsMap.put("rtnList", rtnList);
		rsMap.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_OK);
		rsMap.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_OK);
		
		return rsMap;
	}
	
	/**
	 * 판매인용 제휴카드 금액 조회
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/selectOrdAgentCardAmt")
	@ResponseBody
	public Map<String, Object> selectOrdAgentCardAmt(HttpServletRequest request, @RequestBody RentalVo vo) throws Exception {
		Map<String, Object> rsMap = new HashMap<String, Object>();
		Map<String, Object> rqMap = new HashMap<String, Object>();
		
		rqMap.put("cardCd", vo.getCardCd());
		
		Map<String,Object> myListMap = rentalMypageSvc1.select_p_sRtsd0411List(rqMap);
		List<Map<String, Object>> rtnList = (List<Map<String, Object>>) myListMap.get("list");

		rsMap.put("rtnList", rtnList);
		rsMap.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_OK);
		rsMap.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_OK);
		
		return rsMap;
	}
	
	/**
	 * 판매인용 서비스 금액 조회
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/selectOrdAgentServiceAmt")
	@ResponseBody
	public Map<String, Object> selectOrdAgentServiceAmt(HttpServletRequest request, @RequestBody RentalVo vo) throws Exception {
		Map<String, Object> rsMap = new HashMap<String, Object>();
		Map<String, Object> rqMap = new HashMap<String, Object>();
		
		rqMap.put("serviceCd", vo.getServiceCd());
		rqMap.put("periodCd", vo.getPeriodCd());
		rqMap.put("apprCnt", vo.getApprCnt());
		
		Map<String,Object> myListMap = rentalMypageSvc1.select_p_sRtsd0412List(rqMap);
		List<Map<String, Object>> rtnList = (List<Map<String, Object>>) myListMap.get("list");

		rsMap.put("rtnList", rtnList);
		rsMap.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_OK);
		rsMap.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_OK);
		
		return rsMap;
	}
	
	/**
	 * 판매인용 렌탈료 조회
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/selectOrdAgentCommCd")
	@ResponseBody
	public Map<String, Object> selectOrdAgentCommCd(HttpServletRequest request, @RequestBody RentalVo vo) throws Exception {
		Map<String, Object> rsMap = new HashMap<String, Object>();
		Map<String, Object> rqMap = new HashMap<String, Object>();
		
		rqMap.put("classCd", vo.getClassCd());
		
		Map<String,Object> gradeCdList = rentalMypageSvc1.select_p_sRtsd0410GradeCd(rqMap);
		List<Map<String, Object>> _gradeCdList = (List<Map<String, Object>>) gradeCdList.get("list");
		
		Map<String,Object> inchList = rentalMypageSvc1.select_p_sRtsd0410Inch(rqMap);
		List<Map<String, Object>> _inchList = (List<Map<String, Object>>) inchList.get("list");

		rsMap.put("gradeCdList", _gradeCdList);
		rsMap.put("inchList", _inchList);
		rsMap.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_OK);
		rsMap.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_OK);
		
		return rsMap;
	}
	
	/**
	 * 판매인용 인치 정보 조회
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/selectOrdAgentInch")
	@ResponseBody
	public Map<String, Object> selectOrdAgentInch(HttpServletRequest request, @RequestBody RentalVo vo) throws Exception {
		Map<String, Object> rsMap = new HashMap<String, Object>();
		Map<String, Object> rqMap = new HashMap<String, Object>();
		
		rqMap.put("classCd", vo.getClassCd());
		rqMap.put("periodCd", vo.getPeriodCd());
		rqMap.put("cntCd",  vo.getCntCd());
		rqMap.put("gradeCd", vo.getGradeCd());
		
		Map<String,Object> inchList = rentalMypageSvc1.select_p_sRtsd0410Inch(rqMap);
		List<Map<String, Object>> _inchList = (List<Map<String, Object>>) inchList.get("list");

		rsMap.put("inchList", _inchList);
		rsMap.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_OK);
		rsMap.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_OK);
		
		return rsMap;
	}
}
