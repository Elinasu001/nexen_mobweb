package com.nexwrms.mobweb.mypage.ctl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nexwrms.cfo.com.cm.svc.AbstractCfoSvc;
import com.nexwrms.cfo.com.cm.vo.PageVo;
import com.nexwrms.cfo.com.constants.WebConstants;
import com.nexwrms.cfo.util.JsPrinter;
import com.nexwrms.core.session.SessionInfoUtil;
import com.nexwrms.core.util.SessionUtil;
import com.nexwrms.core.util.StringUtil;
import com.nexwrms.nextlevel.com.login.vo.ReRentalVo;
import com.nexwrms.nextlevel.com.mypage.svc.RentalMypageSvc1;
import com.nexwrms.nextlevel.com.mypage.vo.MypageOrderVO;
import com.nexwrms.nextlevel.com.mypage.vo.PayResultVO;
import com.nexwrms.nextlevel.com.mypage.vo.PtnInfVO;
import com.nexwrms.nextlevel.com.mypage.vo.RentalMypageVo1;
import com.nexwrms.nextlevel.com.order.svc.RentalOrderSvc;
import com.nexwrms.nextlevel.com.order.vo.RentalOrderVo;


/**
 * @class Name : MyPageCtl4.java
 * @Description : FO mypage
 * @RequestMapping
 * @Modification Informat ion
 * @
 * @ Date            Author       Description
 * @ -------------  -----------  -------------
 * @ 2019. 11. 20.    박믿음		  최초 생성
 *
 */
@RequestMapping("/mypage5")
@Controller
public class MyPageCtl5 extends AbstractCfoSvc {
	private static final Logger logger = LoggerFactory.getLogger(MyPageCtl5.class);

    @Autowired
    private RentalMypageSvc1 rentalMypageSvc1;


	@Autowired
	@Qualifier("com.nexwrms.nextlevel.com.order.svc.RentalOrderSvc")
	RentalOrderSvc rentalOrderSvc;



	/**
	 * 마이페이지 > 나의 렌탈 관리 리스트
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/myRentalList")
	public String myRentalList(HttpServletRequest request, Model model, RentalMypageVo1 vo
			, @RequestParam(value="pageNo", required=false) String pageNo) throws Exception {
		String rUrl = "";
		ReRentalVo clientVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_CLIENT_VO);

		if(clientVo == null || "".equals(clientVo)) {
			model.addAttribute("sendUrl", "/login/userLogin");
			rUrl = "/login/userLogin";
		} else {

			if(StringUtil.isEmpty(pageNo)) {
				pageNo = "1";
			}

			try {
				//연체금 및 연체 내역
				String safeKey = clientVo.getSafeKey();
				Map<String, Object> overdueListMap  = rentalMypageSvc1.select_p_sRtre0030ShopArreList(safeKey);
				model.addAttribute("myOverdueMap"	, overdueListMap.get("myOverdueMap"));
				model.addAttribute("myOverdueMapList"	, overdueListMap.get("myOverdueMapList"));


				//이번달 청구 금액
				Map<String,Object> payListMap = rentalMypageSvc1.select_payList(safeKey);
				model.addAttribute("payList"	, payListMap.get("payList"));
				model.addAttribute("totRentAmt"	, payListMap.get("totRentAmt"));


				//렌탈 관리 리스트
				Map<String,Object> myListMap = rentalMypageSvc1.select_p_sRtsd0108CustOrdInfoNew(clientVo, null);
				List<Map<String, Object>> rtnList = (List<Map<String, Object>>) myListMap.get("rentalList");
				int size = rtnList.size();

				List<Map<String, Object>> pageList = new ArrayList<Map<String, Object>>();

				//계약 종료 건수
				int endCnt = 0;
				int totSumAmt = 0;
				for(Map<String, Object> map : rtnList){
					if("N".equals(map.get("osYn"))){
						endCnt = endCnt + 1;
					} else {
						pageList.add(map);
					}

					if(map.get("MON_AMT") !=null) {
						totSumAmt = totSumAmt + Integer.parseInt(map.get("MON_AMT").toString());
					}
				}


				pageList = (List<Map<String, Object>>) page(rtnList , 10 , Integer.parseInt(pageNo));

				PageVo pageVo = new PageVo();
				pageVo.setTotalCount(size);
				pageVo.setPageNo(Integer.parseInt(pageNo));
				pageVo.setPageSize(10);

				model.addAttribute("pageCommon"	, pageVo);
				model.addAttribute("rentalList"	, pageList);
				model.addAttribute("endCnt"	, endCnt);
				model.addAttribute("totSumAmt"	, String.valueOf(totSumAmt));
				model.addAttribute(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_OK);
				model.addAttribute(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_OK);

				rUrl = "/mypage/myRentalList";
			} catch(Exception e) {
				System.err.println(e.toString());
				model.addAttribute(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_BIZ_ERROR);
				model.addAttribute(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_ERROR);

				rUrl = "/error/error";
			}
		}

		return rUrl;
	}

	/**
	 * 마이페이지 > 나의 렌탈 관리 상세
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/myRentalDetail")
	public String myRentalDetail(HttpServletRequest request, Model model, RentalMypageVo1 vo
			, @RequestParam(value="ordNo", required=false) String ordNo) throws Exception {
		String rUrl = "";
		ReRentalVo clientVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_CLIENT_VO);

		if(clientVo == null || "".equals(clientVo)) {
			model.addAttribute("sendUrl", "/login/userLogin");
			rUrl = "/login/userLogin";
		} else {
			try {
				//렌탈 관리 리스트
				Map<String,Object> myListMap = rentalMypageSvc1.select_p_sRtsd0108CustOrdInfoNew(clientVo, ordNo);
				List<Map<String, Object>> rtnList = (List<Map<String, Object>>) myListMap.get("rentalList");

				Map<String, Object> detailMap = new HashMap<String, Object>();
				for(Map<String, Object> map : rtnList){
					if(ordNo.equals(map.get("ordNo"))){
						detailMap = map;
					}
				}

				model.addAttribute("detailMap"	, detailMap);
				model.addAttribute("clientVo"	, clientVo);

				//서비스내역
				Map<String,Object> myServiceMap = rentalMypageSvc1.select_p_sRtsd0013OnlineListNew(clientVo);
				List<Map<String, Object>> rtnServiceList = (List<Map<String, Object>>) myServiceMap.get("serviceList");

				//기본 >> B0000(타이어)
				List<Map<String, Object>> tireList = new ArrayList<Map<String, Object>>();

				//케어 >> B00002(위치) , B00003(방문) , B00004(얼라이언트)
				List<Map<String, Object>> wichList = new ArrayList<Map<String, Object>>();
				List<Map<String, Object>> bangmun = new ArrayList<Map<String, Object>>();
				List<Map<String, Object>> alientList = new ArrayList<Map<String, Object>>();

				//스페셜 >> B00007(걱정) ,
				List<Map<String, Object>> primiumList = new ArrayList<Map<String, Object>>();
				List<Map<String, Object>> enginList = new ArrayList<Map<String, Object>>();

				for(Map<String, Object> map : rtnServiceList) {
					if(ordNo.equals(map.get("ORD_NO").toString())){
						String key = map.get("PRS_DCD").toString();
						//기본 - 타이어
						if("B00000".equals(key)) {
							tireList.add(map);
						}
						//케어 - 위치 교환
						else if("B00002".equals(key)) {
							wichList.add(map);
						}
						//케어 - 방문 점검
						else if("B00003".equals(key)) {
							bangmun.add(map);
						}
						//케어 - 얼라인먼트
						else if("B00008".equals(key)) {
							alientList.add(map);
						}
						//스폐셜 - 걱정재로 프리미엄(사계절보증제도)
						else if("B00007".equals(key)) {
							primiumList.add(map);
						}
						//스폐셜 - 엔진 오일
						if("B00001".equals(key)) {
							enginList.add(map);
						}
					}
				}

				List<Map<String, Object>> rsList1 = new ArrayList<Map<String, Object>>();
				rsList1.addAll(tireList);
				List<Map<String, Object>> rsList2 = new ArrayList<Map<String, Object>>();
				rsList2.addAll(wichList);
				rsList2.addAll(bangmun);
				rsList2.addAll(alientList);
				List<Map<String, Object>> rsList3 = new ArrayList<Map<String, Object>>();
				rsList3.addAll(primiumList);
				rsList3.addAll(enginList);

				List<Map<String, Object>> rsList11 = new ArrayList<Map<String, Object>>();
				List<Map<String, Object>> rsList22 = new ArrayList<Map<String, Object>>();
				List<Map<String, Object>> rsList33 = new ArrayList<Map<String, Object>>();
				try {
					for(int i=0; i<rsList1.size(); i++) {
						Map<String, Object> m = new HashMap<String, Object>();
						m.putAll(rsList1.get(i));
						if(i > 0) {
							m.put("pre"	, (rsList1.get(i-1).get("PRS_DCD").toString()));
						} else {
							m.put("pre"	, "");
						}
						if(i == rsList1.size()-1) {
							m.put("next"	, "");
						} else {
							m.put("next"	, (rsList1.get(i+1).get("PRS_DCD").toString()));
						}
						rsList11.add(m);
					}

					for(int i=0; i<rsList2.size(); i++) {
						Map<String, Object> m = new HashMap<String, Object>();
						m.putAll(rsList2.get(i));
						if(i > 0) {
							m.put("pre"	, (rsList2.get(i-1).get("PRS_DCD").toString()));
						} else {
							m.put("pre"	, "");
						}
						if(i == rsList2.size()-1) {
							m.put("next"	, "");
						} else {
							m.put("next"	, (rsList2.get(i+1).get("PRS_DCD").toString()));
						}
						rsList22.add(m);
					}

					for(int i=0; i<rsList3.size(); i++) {
						Map<String, Object> m = new HashMap<String, Object>();
						m.putAll(rsList3.get(i));
						if(i > 0) {
							m.put("pre"	, (rsList3.get(i-1).get("PRS_DCD").toString()));
						} else {
							m.put("pre"	, "");
						}
						if(i == rsList3.size()-1) {
							m.put("next"	, "");
						} else {
							m.put("next"	, (rsList3.get(i+1).get("PRS_DCD").toString()));
						}
						rsList33.add(m);
					}
				} catch(Exception e){
					e.toString();
				}

				model.addAttribute("rsList11"	, rsList11);
				model.addAttribute("rsList22"	, rsList22);
				model.addAttribute("rsList33"	, rsList33);
				model.addAttribute("ordNo", ordNo);

				//은행 목록 조회
				List<RentalOrderVo> bankCdList = rentalOrderSvc.selectComCdList("R001");
				model.addAttribute("bankCdList", bankCdList);

				//카드 목록 조회
				List<RentalOrderVo> cardCdList = rentalOrderSvc.selectComCdList("R002");
				model.addAttribute("cardCdList", cardCdList);

				//결제/신청 상세정보 조회
				Map<String , Object> payDetail = rentalMypageSvc1.payDetail(ordNo);
				model.addAttribute("payDetail", payDetail.get("payDetail"));

				// 중도선납 개월 목록 조회
				List<RentalMypageVo1> monthList = rentalMypageSvc1.prptMonList();
				model.addAttribute("monthList", monthList);

				model.addAttribute(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_OK);
				model.addAttribute(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_OK);

				rUrl = "/mypage/myRentalDetail";
			} catch(Exception e) {
				model.addAttribute(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_BIZ_ERROR);
				model.addAttribute(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_ERROR);

				rUrl = "/error/error";
			}
		}

		return rUrl;
	}


	/**
	 * 나의결제관리- 결제정보수정처리
	 * @param
	 * @return
	 * @exception Exception
	 */
	@RequestMapping("/updatemyPayMytd")
	@ResponseBody
	public Map<String, Object> updatemyPayMytd( HttpServletRequest request, RentalMypageVo1 vo ) throws Exception {

		ReRentalVo clientVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_CLIENT_VO);

		//영업 고객 존재 여부 확인 및 신규생성
		String custNo = rentalOrderSvc.selectSrhCustId(clientVo.getCustId());

		Map<String ,Object> paraMap = new HashMap<String ,Object>();
		paraMap.put("ordNo",  vo.getRdoOrdNo());
		paraMap.put("custNo", custNo);

		//결제 정보 조회
		Map<String,Object> payMap = rentalMypageSvc1.select_p_sRtre0050List(paraMap); // new ArrayList();
		List<Map<String, Object>> rtnServiceList = (List<Map<String, Object>>) payMap.get("serviceList");
		paraMap.putAll(rtnServiceList.get(0));
logger.debug("###### >>> payMap   :::       " + payMap);
		Map<String,Object> sMap = new HashMap<String, Object>();
		if(rtnServiceList.size() > 0 ){
			//결제 방법 수정
			sMap = rentalMypageSvc1.paymentPIUDRtre0050(paraMap, vo, clientVo);


			logger.debug("###### >>> sMap   :::       " + sMap);
		}

	 	return sMap;
	}

	/**
	 * 선납 할인 계산
	 * @param
	 * @return
	 * @throws IOException
	 * @exception Exception
	 */
	@RequestMapping("/calPay")
	@ResponseBody
	public Map<String , Object> calPay(HttpServletRequest request,  RentalMypageVo1 vo) throws Exception {

		Map <String , Object> rsMap = new HashMap<String, Object>();
		try {
			List<Map<String, Object>> calPayMytd  = rentalMypageSvc1.calPayMytd(vo);

			String totRecpAmt 	= calPayMytd.get(0).get("totRecpAmt").toString(); 	//총 납부금액
			String totDcAmt 	= calPayMytd.get(0).get("totDcAmt").toString(); 	//총 할인금액
			String remainAmt 	= calPayMytd.get(0).get("remainAmt").toString(); 	//선납 후 잔액

			if(!StringUtil.isEmpty(totRecpAmt) && !StringUtil.isEmpty(totDcAmt) && !StringUtil.isEmpty(remainAmt)) {
				rsMap.put("totRecpAmt", totRecpAmt);
				rsMap.put("totDcAmt", totDcAmt);
				rsMap.put("remainAmt", remainAmt);
				rsMap.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_OK);
				rsMap.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_OK);
			} else {

			}

		} catch(Exception e) {
			rsMap.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_BIZ_ERROR);
			rsMap.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_ERROR);
		}

		return rsMap;
	}

	/**
	 * 중도 완납 계산
	 * @param
	 * @return
	 * @throws IOException
	 * @exception Exception
	 */
	@RequestMapping("/calFullPay")
	@ResponseBody
	public Map <String , Object> calFullPayMytd( @RequestParam(value="ordNo", required=false) String ordNo
			                                   , HttpServletResponse response) throws Exception {

		Map <String , Object> rsMap = new HashMap<String, Object>();
		try {
			Map <String , Object> jsonResult = new HashMap<String, Object>();
			List<Map<String, Object>> calPayMytd  = rentalMypageSvc1.calFullPayMytd(ordNo);
			String planAmt 	= calPayMytd.get(0).get("planAmt").toString(); 	//중도 완납 금액

			if(!StringUtil.isEmpty(planAmt)) {
				rsMap.put("planAmt", planAmt);
				rsMap.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_OK);
				rsMap.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_OK);
			} else {

			}

		} catch(Exception e) {
			rsMap.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_BIZ_ERROR);
			rsMap.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_ERROR);
		}

		return rsMap;
	}

	/**
	 * 내 결제 내역 KCP 주문처리 - 선납 완납
	 * @param
	 * @return
	 * @exception Exception
	 */
	@RequestMapping("/pp_cli_hub_my")
	public ModelAndView pp_cli_hub_my( HttpServletRequest req, HttpServletResponse response, MypageOrderVO orderVO, PayResultVO payResultVO) {
		ModelAndView mav = new ModelAndView("/mypage/kcp/pp_cli_hub_my");
		mav.addObject("orderVO", orderVO);
		mav.addObject("payResultVO", payResultVO);
		return mav;
	}

	/**
	 * 나의결제관리- 중도 완납 결제
	 * @param
	 * @return
	 * @exception Exception
	 */
	@RequestMapping("/fullPayMytd")
	public void fullPayMytd( HttpServletRequest request, HttpServletResponse res,  PayResultVO payResultVO , Model model) throws Exception {

		ReRentalVo clientVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_CLIENT_VO);
		String message = "";
		int successCode = 0;
		String returnUrl= "";

		try {
			logger.info("fullPayMytd - [" + clientVo.getCustId() + "][선납 결제 결과][" + payResultVO.getResCd() + "-" + payResultVO.getResMsg() + "]");


			logger.debug("$$$$$$  payResultVO.getResCd() >>>>> " + payResultVO.getResCd());

			if("0000".equals(payResultVO.getResCd())){
				successCode = (int) rentalMypageSvc1.fullPayMytd(payResultVO, clientVo.getCustId());


				logger.debug("$$$$$$  successCode >>>>> " + successCode);

				if(successCode < 0){
					message = "처리중 오류가 발생하였습니다.";
					returnUrl = "/error/error";

					logger.debug("$$$$$$  returnUrl1111 >>>>> " + returnUrl);
				} else if("3001".equals(payResultVO.getResCd())) {
					message = "주문/결제가 취소 되었습니다.";
					returnUrl = "/error/error";

					logger.debug("$$$$$$  returnUr2222 >>>>> " + returnUrl);
				}	else {
					message = "정상처리되었습니다.";
					returnUrl = "/mypage/myRentalList";

					logger.debug("$$$$$$  returnUr333 >>>>> " + returnUrl);
				}
			} else {
				message = "주문/결제 진행 중 오류가 발생하였습니다. \n 주문화면 바로가기’ 버튼을 클릭 후 이동하여 다시 진행해 주시기 바랍니다.";
				message += "관련 문의사항은 고객센터(1855-0100 상담시간 : 평일 오전 9:00 ~ 오후 6:00)로 \n";
				message += "문의주시면 친절하게 안내해 드리겠습니다. \n";
				message += "감사합니다.";

				returnUrl = "/error/error";

				logger.debug("$$$$$$  returnUr444 >>>>> " + returnUrl);
			}
		} catch(Exception e) {
			message = "주문/결제 진행 중 오류가 발생하였습니다. \n 주문화면 바로가기’ 버튼을 클릭 후 이동하여 다시 진행해 주시기 바랍니다.";
			message += "관련 문의사항은 고객센터(1855-0100 상담시간 : 평일 오전 9:00 ~ 오후 6:00)로 \n";
			message += "문의주시면 친절하게 안내해 드리겠습니다. \n";
			message += "감사합니다.";

			returnUrl = "/error/error";
			logger.debug("$$$$$$  returnUr555 >>>>> " + returnUrl);
		}

		logger.debug("$$$$$$  returnUr6666 >>>>> " + returnUrl);

		JsPrinter.replace(res, returnUrl , message);
	}

	/**
	 * 나의결제관리- 선납 결제
	 * @param
	 * @return
	 * @exception Exception
	 */
	@RequestMapping("/prepaymentPayMytd")
	public void prepaymentPayMytd( HttpServletRequest request, HttpServletResponse res, PayResultVO payResultVO , Model model) throws Exception {

		ReRentalVo clientVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_CLIENT_VO);
		String message = "";
		int successCode = 0;
		String returnUrl= "";

		try {
			logger.info("prepaymentPayMytd - [" + clientVo.getCustId() + "][선납 결제 결과][" + payResultVO.getResCd() + "-" + payResultVO.getResMsg() + "]");


			logger.debug("$$$$$$  payResultVO.getResCd() >>>>> " + payResultVO.getResCd());

			if("0000".equals(payResultVO.getResCd())){
				successCode = (int) rentalMypageSvc1.prepaymentPayMytd(payResultVO, clientVo.getCustId());


				logger.debug("$$$$$$  successCode >>>>> " + successCode);

				if(successCode < 0){
					message = "처리중 오류가 발생하였습니다.";
					returnUrl = "/error/error";

					logger.debug("$$$$$$  returnUrl1111 >>>>> " + returnUrl);
				} else if("3001".equals(payResultVO.getResCd())) {
					message = "주문/결제가 취소 되었습니다.";
					returnUrl = "/error/error";

					logger.debug("$$$$$$  returnUr2222 >>>>> " + returnUrl);
				}	else {
					message = "정상처리되었습니다.";
					returnUrl = "/mypage/myRentalList";

					logger.debug("$$$$$$  returnUr333 >>>>> " + returnUrl);
				}
			} else {
				message = "주문/결제 진행 중 오류가 발생하였습니다. \n 주문화면 바로가기’ 버튼을 클릭 후 이동하여 다시 진행해 주시기 바랍니다.";
				message += "관련 문의사항은 고객센터(1855-0100 상담시간 : 평일 오전 9:00 ~ 오후 6:00)로 \n";
				message += "문의주시면 친절하게 안내해 드리겠습니다. \n";
				message += "감사합니다.";

				returnUrl = "/error/error";

				logger.debug("$$$$$$  returnUr444 >>>>> " + returnUrl);
			}
		} catch(Exception e) {
			message = "주문/결제 진행 중 오류가 발생하였습니다. \n 주문화면 바로가기’ 버튼을 클릭 후 이동하여 다시 진행해 주시기 바랍니다.";
			message += "관련 문의사항은 고객센터(1855-0100 상담시간 : 평일 오전 9:00 ~ 오후 6:00)로 \n";
			message += "문의주시면 친절하게 안내해 드리겠습니다. \n";
			message += "감사합니다.";

			returnUrl = "/error/error";
			logger.debug("$$$$$$  returnUr555 >>>>> " + returnUrl);
		}

		logger.debug("$$$$$$  returnUr6666 >>>>> " + returnUrl);

		JsPrinter.replace(res, returnUrl , message);

	}

	/**
	 * 수납내역
	 * @param request
	 * @param orderVo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/myPayMonthListPage")
	@ResponseBody
	public Map<String, Object> myPayMonthListPage(HttpServletRequest request, @RequestBody RentalMypageVo1 vo)  throws Exception {
		String rUrl = "";
		ReRentalVo clientVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_CLIENT_VO);

		Map<String, Object> rsMap = new HashMap<String, Object>();

		if(clientVo == null || "".equals(clientVo)) {
			rsMap.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_BIZ_ERROR);
			rsMap.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_ERROR);
			return rsMap;
		} else {
			try {
				//렌탈 관리 리스트
				Map<String,Object> myListMap = rentalMypageSvc1.select_p_sRtre0041ArreDtlListNew(vo);
				List<Map<String, Object>> rtnList = (List<Map<String, Object>>) myListMap.get("serviceList");

				int size = rtnList.size();

				List<Map<String, Object>> pageList = (List<Map<String, Object>>) page(rtnList , 10 , Integer.parseInt(vo.getPageNo()));

				PageVo pageVo = new PageVo();
				pageVo.setTotalCount(size);
				pageVo.setPageNo(Integer.parseInt(vo.getPageNo()));
				pageVo.setPageSize(10);

				rsMap.put("pageCommon", pageVo);
				rsMap.put("rtnList", rtnList);
				rsMap.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_OK);
				rsMap.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_OK);
			} catch(Exception e) {
				rsMap.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_BIZ_ERROR);
				rsMap.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_ERROR);
			}
		}
		return rsMap;
	}


	/**
	 * 내 결제 내역 KCP 주문처리 - 연체금
	 * @param
	 * @return
	 * @exception Exception
	 */
	@RequestMapping("/arre_pp_cli_hub")
	public ModelAndView arre_pp_cli_hub( HttpServletRequest req, HttpServletResponse response, MypageOrderVO orderVO, PayResultVO payResultVO) {
		ModelAndView mav = new ModelAndView("/mypage/kcp/pp_cli_hub");
		mav.addObject("orderVO", orderVO);
		mav.addObject("payResultVO", payResultVO);
		return mav;
	}

	/**
	 * 나의결제관리- 연체금 결제
	 * @param
	 * @return
	 * @exception Exception
	 */
	@RequestMapping("/updatemyOverduePayMytd")
	public void updatemyOverduePayMytd(RedirectAttributes redirectAttributes, HttpServletRequest request, HttpServletResponse res, PayResultVO payResultVO , Model model) throws Exception {

		ReRentalVo clientVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_CLIENT_VO);
		String message = "정상처리되었습니다.";
		int successCode = 0;
		String rtnUrl = "";

		try {
			if("0000".equals(payResultVO.getResCd())){
				successCode = (int) rentalMypageSvc1.saveOverdueCancel(payResultVO, clientVo.getCustId());

				if(successCode < 0){
					message = "주문/결제 진행 중 오류가 발생하였습니다.";
					rtnUrl = "/error/error";
				} else {
					rtnUrl = "/mypage/myRentalList";
					model.addAttribute("returnUrl", "/mypage/myRentalList");
					model.addAttribute("message",   message);
				}
			} else if("3001".equals(payResultVO.getResCd())) {
				message = "주문/결제가 취소 되었습니다.";
				rtnUrl = "/error/error";
			}	else {
				rtnUrl = "/error/error";
				message = "주문/결제 진행 중 오류가 발생하였습니다.";
			}
		} catch(Exception e) {
			rtnUrl = "/error/error";

			message = "주문/결제 진행 중 오류가 발생하였습니다.";
		}

		JsPrinter.replace(res, rtnUrl, message);
	}

	/**
	 * 렌탈전문점 상세조회
	 * @param HttpServletRequest
	 * @return list
	 * @exception Exception
	 */
	@RequestMapping("/searchAgencyInfo")
	@ResponseBody
    public Map<String , Object> searchAgencyInfo(@RequestParam(value="agencyCd", required=false) String agencyCd ,
    							      HttpServletRequest request, Model model) throws Exception{

		//검색코드 목록2
		PtnInfVO rentalInfo = rentalMypageSvc1.searchAgencyInf(agencyCd);
		List<PtnInfVO> acyFileList = rentalMypageSvc1.getAcyFile(agencyCd);

		// 리스트
		Map<String , Object> rsMap = new HashMap<String, Object>();
		rsMap.put("resultMap", rentalInfo);
		rsMap.put("acyFileList", acyFileList);

		return rsMap;
    }

	/**
	 *	모바일 결제
	 *  kcp_AJAX()에서 호출
	 *
	 */
	@RequestMapping("/orderApproval")
	public ModelAndView orderApproval(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("/mypage/kcp/orderApproval");

		return mav;
	}
}

