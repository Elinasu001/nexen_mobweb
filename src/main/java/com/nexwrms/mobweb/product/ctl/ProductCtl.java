package com.nexwrms.mobweb.product.ctl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.nexwrms.cfo.com.board.vo.BoardVo;
import com.nexwrms.cfo.com.cart.svc.CartSvc;
import com.nexwrms.cfo.com.cm.svc.AbstractCfoSvc;
import com.nexwrms.cfo.com.cm.svc.RestCallSvc;
import com.nexwrms.cfo.com.cm.vo.PageVo;
import com.nexwrms.cfo.com.cm.vo.UsrVo;
import com.nexwrms.cfo.com.constants.WebConstants;
import com.nexwrms.cfo.com.eai.svc.LogSaveSvc;
import com.nexwrms.cfo.com.member.svc.MemberSvc;
import com.nexwrms.cfo.com.order.vo.OrderVo;
import com.nexwrms.cfo.com.product.dao.ProductDao;
import com.nexwrms.cfo.com.product.svc.ProductSvc;
import com.nexwrms.cfo.com.product.vo.PrdOptSearchVo;
import com.nexwrms.cfo.com.product.vo.PrdRsVo;
import com.nexwrms.cfo.com.product.vo.PrdSearchVo;
import com.nexwrms.cfo.to.sd.dao.MbNoneCustPsnInfoAgreToDao;
import com.nexwrms.cfo.to.sd.vo.MbNoneCustPsnInfoAgreToVo;
import com.nexwrms.cfo.to.sd.vo.OdBasketToVo;
import com.nexwrms.cfo.to.sd.vo.OdOptDtlToVo;
import com.nexwrms.cfo.util.CookieUtil;
import com.nexwrms.core.constants.CoreConstants;
import com.nexwrms.core.context.AppContext;
import com.nexwrms.core.session.SessionInfoUtil;
import com.nexwrms.core.util.SessionUtil;
import com.nexwrms.core.util.StringUtil;
import com.nexwrms.nextlevel.com.cart.vo.RentalCartVo;
import com.nexwrms.nextlevel.com.cpn.dao.CpnDao;
import com.nexwrms.nextlevel.com.cpn.svc.CpnSvc;
import com.nexwrms.nextlevel.com.cpn.vo.CpnVo;
import com.nexwrms.nextlevel.com.login.vo.ReRentalVo;
import com.nexwrms.nextlevel.com.mypage.vo.MbCustIssInfoVo;
import com.nexwrms.nextlevel.com.product.svc.RentalProductSvc;
import com.nexwrms.nextlevel.com.product.vo.RentalPrdAttFileVO;
import com.nexwrms.nextlevel.com.product.vo.RentalPrdRsVo;
import com.nexwrms.nextlevel.com.product.vo.RentalPrdSearchVo;
import com.nexwrms.nextlevel.to.product.svc.RentalProductToSvc;

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
@RequestMapping("/product")
@Controller
public class ProductCtl extends AbstractCfoSvc {
	private static final Logger logger = LoggerFactory.getLogger(ProductCtl.class);

	@Autowired
    private ProductSvc productSvc;

    @Autowired
    private RentalProductSvc rentalProductSvc;

    @Autowired
	@Qualifier("com.nexwrms.cfo.com.cm.svc.RestCallSvc")
	private RestCallSvc restCallSvc;

    @Autowired
	@Qualifier("com.nexwrms.nextlevel.to.product.svc.RentalProductToSvc")
	private RentalProductToSvc rentalProductToSvc;

    @Autowired
	@Qualifier("com.nexwrms.cfo.com.cart.svc.CartSvc")
	private CartSvc cartSvc;

    @Autowired
    @Qualifier("com.nexwrms.cfo.com.member.svc.MemberSvc")
    private MemberSvc memberSvc;

    @Autowired
    @Qualifier("com.nexwrms.nextlevel.com.cpn.svc.CpnSvc")
    private CpnSvc cpnSvc;

    @Autowired
    @Qualifier("com.nexwrms.cfo.com.eai.svc.LogSaveSvc")
    private LogSaveSvc logSaveSvc;

    @Autowired
    private CookieUtil cookieUtil;

    /**
     * 상품 리스트 화면
     * @param request
     * @param model
     * @param viewGbn
     * @param vo
     * @return
     * @throws Exception
     */
	@RequestMapping("/prdList")
	public String prdList(HttpServletRequest request, Model model,@RequestParam(required = false) String viewGbn
							, PrdSearchVo vo) throws Exception {

		logger.debug("/prdList >>>>>>>>>>   호출");

		String[] fBrand = request.getParameterValues("fBrand");
		String[] fCarType = request.getParameterValues("fCarType");
		String[] fSeason = request.getParameterValues("fSeason");
		String[] fRentalYn = request.getParameterValues("fRentalYn");


		model.addAttribute("fBrand", fBrand);
		model.addAttribute("fCarType", fCarType);
		model.addAttribute("fSeason", fSeason);
		model.addAttribute("fRentalYn", fRentalYn);


		UsrVo userVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_USR_VO);
		if(userVo != null) {
			model.addAttribute("userVo", userVo);
		}

		// header Css 추가
		model.addAttribute("headerCss" , "");
		model.addAttribute("prdSearchVo" , vo);

		model.addAttribute("viewGbn", viewGbn);
		
		//10233006 GA title tag 동적 변경
		model.addAttribute("title", "상품 리스트 | NEXT LEVEL");
		
		return "/product/prdList";
	}

	/**
	 * 제조사 검색
	 * @param request
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/selectMakerList")
	@ResponseBody
	public List<?> selectMakerList(HttpServletRequest request, Model model, @RequestBody RentalPrdSearchVo vo) throws Exception {
		if("R".equals(vo.getSystemGbn()) || "C".equals(vo.getSystemGbn())) {
			return rentalProductSvc.selectMakerList(vo);
		} else {
			PrdSearchVo pVo = new PrdSearchVo();
			copyVoToVo(pVo, vo);
			return productSvc.selectMakerList(pVo);
		}
	}

	/**
	 * 모델검색
	 * @param request
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/selectModelList")
	@ResponseBody
	public List<?> selectModelList(HttpServletRequest request, Model model, @RequestBody RentalPrdSearchVo vo) throws Exception {
		if("R".equals(vo.getSystemGbn()) || "C".equals(vo.getSystemGbn())) {
			return rentalProductSvc.selectModelList(vo);
		} else {
			PrdSearchVo pVo = new PrdSearchVo();
			copyVoToVo(pVo, vo);
			return productSvc.selectModelList(pVo);
		}
	}

	/**
	 * 사이즈검색
	 * @param request
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/selectTireSizeList")
	@ResponseBody
	public List<?> selectTireSizeList(HttpServletRequest request, Model model, @RequestBody RentalPrdSearchVo vo) throws Exception {
		if("R".equals(vo.getSystemGbn())) {
			return rentalProductSvc.selectTireSizeList(vo);
		} else if("O".equals(vo.getSystemGbn())) {
			PrdSearchVo pVo = new PrdSearchVo();
			copyVoToVo(pVo, vo);
			return productSvc.selectTireSizeList(pVo);
		} else if("CC".equals(vo.getSystemGbn())) {
			//렌탈
			List<RentalPrdSearchVo> rList = rentalProductSvc.selectTireSizeList(vo);
			//구매
			PrdSearchVo pVo = new PrdSearchVo();
			copyVoToVo(pVo, vo);
			List<PrdRsVo> oList = productSvc.selectTireSizeList(pVo);

			List<PrdRsVo> sumList = new ArrayList<PrdRsVo>();

			//중복제거
			String baseList = rList.size() >= oList.size() ? "rList" : "oList";

			if(baseList == "rList") {
				//중복제거
				for(int i=0; i<rList.size(); i++) {
					if(oList.contains(rList.get(i).getSearchCdNm())) {
						rList.remove(i);
					}
				}
			} else {
				//중복제거
				for(int i=0; i<oList.size(); i++) {
					if(rList.contains(oList.get(i).getSearchCdNm())) {
						oList.remove(i);
					}
				}
			}

			//렌탈List Add
			for(int i=0; i<rList.size(); i++) {
				PrdRsVo sumPrdRsVo = new PrdRsVo();
				sumPrdRsVo.setSearchCdNm(rList.get(i).getSearchCdNm());
				sumPrdRsVo.setSearchCd(rList.get(i).getSearchCd());
				sumPrdRsVo.setDescription(rList.get(i).getDescription());
				sumPrdRsVo.setSectionWidth(rList.get(i).getSectionWidth());
				sumPrdRsVo.setAspectRatio(rList.get(i).getAspectRatio());
				sumPrdRsVo.setPlyRating(rList.get(i).getPlyRating());
				sumList.add(sumPrdRsVo);
			}

			//구매List Add
			for(int j=0; j<oList.size(); j++) {
				sumList.add(oList.get(j));
			}

			return sumList;

		} else {
			PrdSearchVo pVo = new PrdSearchVo();
			copyVoToVo(pVo, vo);
			// 사이즈 GRADE_ID 검색 하여 pVo 추가
			List<PrdRsVo> gradeIdList = new ArrayList<PrdRsVo>();
			gradeIdList = productSvc.selectGradeIdList(pVo);
			List<String> arrList = new ArrayList<String>();
			for(int i=0; i< gradeIdList.size(); i++) {
				arrList.add(gradeIdList.get(i).getGradeId());
			}
			pVo.setGradeIdList(arrList);
			if (arrList.size() > 0) {
				return productSvc.selectTireSizeList(pVo);
			} else {
				return null;
			}
		}
	}

	/**
	 * 단면폭검색
	 * @param request
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/selectWidthList")
	@ResponseBody
	public List<?> selectWidthList(HttpServletRequest request, Model model, @RequestBody RentalPrdSearchVo vo) throws Exception {
		if("R".equals(vo.getSystemGbn())) {
			return rentalProductSvc.selectWidthList(vo);
		} else {
			PrdSearchVo pVo = new PrdSearchVo();
			copyVoToVo(pVo, vo);
			return productSvc.selectWidthList(pVo);
		}
	}

	/**
	 * 편평비 조회
	 * @param request
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/selectFlatnessList")
	@ResponseBody
	public List<?> selectFlatnessList(HttpServletRequest request, Model model, @RequestBody RentalPrdSearchVo vo) throws Exception {
		if("R".equals(vo.getSystemGbn())) {
			return rentalProductSvc.selectFlatnessList(vo);
		} else {
			PrdSearchVo pVo = new PrdSearchVo();
			copyVoToVo(pVo, vo);
			return productSvc.selectFlatnessList(pVo);
		}
	}

	/**
	 * 인치 조회
	 * @param request
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/selectInchList")
	@ResponseBody
	public List<?> selectInchList(HttpServletRequest request, Model model, @RequestBody RentalPrdSearchVo vo) throws Exception {
		if("R".equals(vo.getSystemGbn())) {
			return rentalProductSvc.selectInchList(vo);
		} else {
			PrdSearchVo pVo = new PrdSearchVo();
			copyVoToVo(pVo, vo);
			return productSvc.selectInchList(pVo);
		}
	}

	/**
	 * 상품리스트 조회
	 * @param request
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/selectPrdList")
	@ResponseBody
	public Map<String, Object> selectPrdList(HttpServletRequest request, Model model, @RequestBody PrdSearchVo vo) throws Exception {
		List<PrdRsVo> selectPrdList = productSvc.selectPrdList(vo);
		int size = selectPrdList.size();

		PageVo pageVo = new PageVo();
		pageVo.setTotalCount(size);
		pageVo.setPageNo(vo.getPageNo());
		if(!"".equals(vo.getPageSize())){
			pageVo.setPageSize(vo.getPageSize());
		}else{
			pageVo.setPageSize(20);
		}

		Map<String, Object> map = new HashMap<String, Object>();
		List<Map<String, Object>>  pageList = (List<Map<String, Object>>) page(selectPrdList , pageVo.getPageSize() , vo.getPageNo() );

		map.put("selectPrdList", pageList);
		map.put("pageCommon", pageVo);

		return map;
	}

	/**
	 * 나이스 디엔알 연동 조회
	 * @param request
	 * @param model
	 * @param carNo
	 * @param usrNm
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/niceDnrApi")
	//@PostMapping("/niceDnrApi") // spring version이 낮아서 안됨
	@ResponseBody
	public Map<String, Object> niceDnrApi(HttpServletRequest request, Model model
			, @RequestParam(required = false, value="carNo") String carNo
			, @RequestParam(required = false, value="usrNm") String usrNm) throws Exception {

		ResponseEntity<Map> response = null;
		String uri = AppContext.getString(WebConstants.NiceDnr.NICE_DNR_URL); // nice.dnr.url
		String newUri = AppContext.getString(WebConstants.NiceDnr.NICE_DNR_NEWURL);
		String apiKey = AppContext.getString(WebConstants.NiceDnr.NICE_DNR_APIKEY);
		String loginId = AppContext.getString(WebConstants.NiceDnr.NICE_DNL_LOGINID);
		logger.debug(newUri + "  >>  "+ apiKey + "  >> " + loginId);
		MultiValueMap<String, String> parameters =  new LinkedMultiValueMap<>();

		parameters.add("VHRNO", carNo);
		parameters.add("OWNER_NM", usrNm);
		//UsrVo userVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_USR_VO);
		//if(userVo != null) {

		//}
		// 약관동의 insert (TB_MB_NONE_CUST_PSN_INFO_AGRE)
		MbNoneCustPsnInfoAgreToVo noneCustVo = new MbNoneCustPsnInfoAgreToVo();
		noneCustVo.setCarNo(carNo);
		noneCustVo.setCustNm(usrNm);
		noneCustVo.setUseAgreYn("Y");
		noneCustVo.setProcArgeYn("Y");
		noneCustVo.setRegId("noneCust");
		noneCustVo.setUpdId("noneCust");
		cboCmDao.insert(MbNoneCustPsnInfoAgreToDao.insertCustInfoAgre , noneCustVo); // 고객정보를 저장하는 TB_MB_NONE_CUST_PSN_INFO_AGRE

		response = restCallSvc.getForEntity(uri, "", parameters);
		String code = (String)(((Map)response.getBody().get("INFO")).get("PROCESS_IMPRTY_RESN_CODE"));
		String codeNm = (String)(((Map)response.getBody().get("INFO")).get("PROCESS_IMPRTY_RESN_DTLS"));
		Map<String, Object> rsMap = new HashMap<String, Object>();
		rsMap.put("code"  ,code);
		rsMap.put("codeNm"  ,codeNm);

		logger.debug("code  >>>>>>>>>>>>>>>" + code);

		if("000".equals(code)) {
			rsMap.put("carInfo" , (Map)((Map)response.getBody().get("INFO")).get("CARINFO"));
			rsMap.put("gradeList" , (List)((Map)((Map)response.getBody().get("INFO")).get("CARINFO")).get("GRADE_LIST"));
		}
		return rsMap;
	}
	/**
	 * 나이스 디엔알 신규연동 조회
	 * @param Map
	 * @return Map
	 * @throws Exception
	 */
	@RequestMapping("/niceDnrVer2Api")
	@ResponseBody
	public Map<String, Object> niceDnrVer2Api(@RequestBody Map<String, String> param) throws Exception{
		logger.debug("niceDnrVer2Api start(controller)");
		Map<String, Object> rsMap = new HashMap<String, Object>();
		MultiValueMap<String, String> parameters =  new LinkedMultiValueMap<>();
		ResponseEntity<Map> response = null;
		String ifHstNo = "";

		String carNo = param.get("carNo");
		String usrNm = param.get("usrNm");
		logger.debug("carNo : "+param.get("carNo") + " /////  usrNm :"+param.get("usrNm"));
		parameters = productSvc.putNiceDnrParam(carNo, usrNm);
		String newUri = AppContext.getString(WebConstants.NiceDnr.NICE_DNR_NEWURL);
		logger.debug("newUri : "+newUri );
		//회원 약관 동의 insert
		MbNoneCustPsnInfoAgreToVo noneCustVo = new MbNoneCustPsnInfoAgreToVo();
		noneCustVo.setCarNo(carNo);
		noneCustVo.setCustNm(usrNm);
		noneCustVo.setUseAgreYn("Y");
		noneCustVo.setProcArgeYn("Y");
		noneCustVo.setRegId("noneCust");
		noneCustVo.setUpdId("noneCust");
		cboCmDao.insert(MbNoneCustPsnInfoAgreToDao.insertCustInfoAgre , noneCustVo);

		JSONObject json = new JSONObject((Map)parameters);
		String paramstring = json.toString();

		// 로그 쌓는걸 하지 않는다?
		ifHstNo = logSaveSvc.newInsert("NiceCarNumSnd", "nicednr-api", "10", paramstring, null);
		response = restCallSvc.getForEntity(newUri, "", parameters);
		//String code = (String)((Map)response.getBody().get("carParts")).get("processImprtyResnCode");
		String resultCode = (String)response.getBody().get("resultCode");
		String resultMsg = (String)response.getBody().get("resultMsg");
		logger.debug("getBody  >>>>>>>>>>>>>>>" + response.getBody().toString());
		logger.debug("resultCode  >>>>>>>>>>>>>>>" + resultCode);
		JSONObject resultJson = new JSONObject((Map)response.getBody());
		if("0000".equals(resultCode)) {
			rsMap.put("code"  ,resultCode);
			rsMap.put("carInfo" , (Map)((Map)((Map)response.getBody().get("carSise")).get("info")).get("carinfo"));
			rsMap.put("gradeList" , (List)( (Map)( (Map)( (Map)response.getBody().get("carSise") ).get("info") ).get("carinfo") ).get("gradeList"));

			//로그성 insert
			logSaveSvc.newNiceDnrLogInsert(rsMap);
			logSaveSvc.newUpdate(ifHstNo, "20", "NiceDnrApi success", null,null);
		}else {
			rsMap.put("code"  ,resultCode);
			rsMap.put("msg"  ,resultMsg);

			logSaveSvc.newUpdate(ifHstNo, "30", resultJson.toString(), "{\"RESULT_CODE\" : \""+resultCode + "\", \"RESULT_MSG\" : \""+resultMsg+"\" }",null);

		}
		logger.debug("response >>>>>>> "+response);
		return rsMap;
	}

	@RequestMapping("/prdDctDetail")
//	public String selectDirectPrdDetail(HttpServletRequest request, Model model, PrdRsVo prv) throws Exception {
	public String selectDirectPrdDetail(HttpServletRequest request, HttpServletResponse response, Model model, PrdRsVo prv) throws Exception {

		SimpleDateFormat format = new SimpleDateFormat ( "yyyyMMdd");
		String tDt = format.format(new Date());

		String itemCd = prv.getItemCd();
		String dpPrNo = prv.getDpPrNo();
		String patternCd = prv.getPatternCd();
		String utmSource = prv.getUtm_source();

		UsrVo userVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_USR_VO);
		ReRentalVo clientVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_CLIENT_VO);
		logger.debug("itemCd="+itemCd + "/ dpPrNo="+dpPrNo+"/ utmSource="+utmSource + "/ patternCd=" + patternCd);

		if(!"".equals(itemCd) && !"".equals(dpPrNo)){

			//Cookie 생성
			if(StringUtils.isNotEmpty(utmSource)){

				cookieUtil.getInstance().newAddCookie(response, "ifwChnCookie", utmSource);
			}

			PrdSearchVo prdSearchVo = new PrdSearchVo();
			prdSearchVo.setDpPrNo(dpPrNo); //TODO[권기현] 패턴명에서  전시상품 번호로 조회
			prdSearchVo.setItemCd(itemCd);
			prdSearchVo.setPatternCd(patternCd);
			PrdRsVo pchsCont = productSvc.selectProdViewCont(prdSearchVo);

			if( pchsCont != null){
				PrdRsVo pchsTireInfo = productSvc.selectProdTireInfo(prdSearchVo);
				// 로그
				logGetRequestParameter(request);

				String labelType = pchsTireInfo.getLabelType();
				String searchSw = pchsTireInfo.getSearchSw();
				String searchAr = pchsTireInfo.getSearchAr();
				String searchWi = pchsTireInfo.getSearchWi();
				String driveFwd = pchsTireInfo.getDriveFwd();
				String TireSize = pchsTireInfo.getTireSize();
				String tireFrCd = pchsTireInfo.getTireFrCd();

				PrdRsVo pVo = new PrdRsVo();
				pVo.setSectionWidth(searchSw);
				pVo.setAspectRatio(searchAr);
				pVo.setWheelInches(searchWi);

				List<PrdRsVo> patternCdAll = productSvc.patternCdAll(pVo);

				// 옵션 로직 추가 2020-08-11
				if("C".equals(labelType) || "O".equals(labelType)){
					PrdOptSearchVo prdOptSearchVo = new PrdOptSearchVo();
					prdOptSearchVo.setDpPrNo(pchsCont.getDpPrNo());
					prdOptSearchVo.setOptPchsQy(1);
					//옵션 리스트 조회
					List<OdOptDtlToVo> optList = productSvc.selectSvcOrdOptDtlList(prdOptSearchVo);
					model.addAttribute("optList", optList);//얼라인먼트
				}

				pchsCont.setSearchSw(searchSw);//단면폭
				pchsCont.setSearchAr(searchAr); //편평비
				pchsCont.setSearchWi(searchWi);//인치
				pchsCont.setSearchAddSw(searchSw); //추가 타이어 단면폭
				pchsCont.setSearchAddAr(searchAr); //추가 타이어 편평비
				pchsCont.setSearchAddWi(searchWi); //추가 타이어 인치

				//추가 타이어 재조회 하기 위해 추가함.
				pchsCont.setSectionWidth(searchSw);//단면폭
				pchsCont.setAspectRatio(searchAr); //편평비
				pchsCont.setWheelInches(searchWi);//인치
				pchsCont.setSectionRwWidth(searchSw); //추가 타이어 단면폭
				pchsCont.setAspectRwRatio(searchAr); //추가 타이어 편평비
				pchsCont.setWheelRwInches(searchWi); //추가 타이어 인치

				pchsCont.setDriveFwd(driveFwd);
				pchsCont.setDriveRwd(driveFwd);
				pchsCont.setTireFrCd(tireFrCd);
				pchsCont.setTireSize(TireSize); //단면폭 + 편평비 + 인치
				pchsCont.setSystemGbn(labelType);
				pchsCont.setModelNm("");

				JSONObject carSearchParam = new JSONObject();
				carSearchParam.put("brandNbr"      , "");
				carSearchParam.put("repCarClassNbr", "");
				carSearchParam.put("carClassNm"    , "");
				carSearchParam.put("fuel"          , "");
				carSearchParam.put("driveFwd"      , driveFwd);
				carSearchParam.put("driveRwd"      , driveFwd);
				carSearchParam.put("driveDsp"      , driveFwd);
				carSearchParam.put("sectionWidth"  , searchSw);
				carSearchParam.put("aspectRatio"   , searchAr);
				carSearchParam.put("wheelInches"   , searchWi);
				carSearchParam.put("sectionRwWidth", searchSw);
				carSearchParam.put("aspectRwRatio" , searchAr);
				carSearchParam.put("wheelRwInches" , searchWi);
				carSearchParam.put("tireSizeYn"    , "Y");

				//TODO [권기현] 개선 첨부파일 노출 이미지 셋팅
				List<String> tireImgList = new ArrayList<String>();
				String prodDtlInfoImg   = pchsCont.getInfoDtlImgUrl(); //상품 상세 이미지
				String prodMainImg      = pchsCont.getReprsntImgUrl(); //상품 대표 이미지
				String o2oThumImg       = pchsCont.getThumbImgUrl();   //썸네일 이미지
				String thumImg          = pchsCont.getThumbImgUrl();   //썸네일 이미지
				String logoListImgUrl   = pchsCont.getLogoListImgUrl();
				String logoDtlImgUrl    = pchsCont.getLogoDtlImgUrl();

				//이미지 관련
				model.addAttribute("prodMainImg"     , prodMainImg);
				model.addAttribute("logoListImgUrl"  , logoListImgUrl); //로고 리스트  이미지
				model.addAttribute("logoDtlImgUrl"   , logoDtlImgUrl); //로고 상세 이미지
				model.addAttribute("prodDtlInfoImg"  , prodDtlInfoImg); //제품 상세 이미지
				//타이어 이미지 담기
				tireImgList.add(0,pchsCont.getDtlSubImg1Url());
				tireImgList.add(1,pchsCont.getDtlSubImg2Url());
				tireImgList.add(2,pchsCont.getDtlSubImg3Url());
				tireImgList.add(3,pchsCont.getDtlSubImg4Url());
				model.addAttribute("tireImgList"    , tireImgList);
				model.addAttribute("renThumImg"     , thumImg);
				model.addAttribute("o2oThumImg"     , o2oThumImg);

//				model.addAttribute("officerCd"      , officerCd	); /*임직원 코드*/
//				model.addAttribute("safeKey"        , safeKey	); /*safeKey*/
				model.addAttribute("userVo"         , userVo);
				model.addAttribute("clientVo"       , clientVo);
				model.addAttribute("reRentUseYN"    , SessionUtil.getAttribute("reRentUseYN"));	//재렌탈고객 여부
				model.addAttribute("carSearchParam" , carSearchParam);
				model.addAttribute("labelType"      , labelType);				//리스트에서 넘어온게 구매인지 렌탈인지 둘다인지.
				model.addAttribute("systemGbn"		, labelType);
				model.addAttribute("patternCdAll"		, patternCdAll);

				model.addAttribute("resultMapCom", pchsCont); //구매상세정보
				model.addAttribute("tDt", tDt); //오늘날짜
			}
		}
		return "/product/prdDetail";
	}

	/**
	 * 상품상세 화면
	 * @param request
	 * @param model
	 * @param prv
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/prdDetail")
	public String selectprdDetail(HttpServletRequest request, Model model, PrdRsVo prv) throws Exception {
		String rtnUrl = "/product/prdDetail";

		SimpleDateFormat format = new SimpleDateFormat ( "yyyyMMdd");
		String tDt = format.format(new Date());

		UsrVo userVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_USR_VO);
		ReRentalVo clientVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_CLIENT_VO);

		String[] fBrand = request.getParameterValues("fBrand");
		String[] fCarType = request.getParameterValues("fCarType");
		String[] fSeason = request.getParameterValues("fSeason");
		String[] fRentalYn = request.getParameterValues("fRentalYn");

		model.addAttribute("fBrand", fBrand);
		model.addAttribute("fCarType", fCarType);
		model.addAttribute("fSeason", fSeason);
		model.addAttribute("fRentalYn", fRentalYn);

		Map<String, ?> prvFlashMap = RequestContextUtils.getInputFlashMap(request);
		if(prv.getSectionWidth() == null){
			prv = (PrdRsVo)prvFlashMap.get("prv");
		}

		String officerCd	= "";
		String safeKey 	    = "";
		// #######################################################
		// 전후륜 로직 추가 PARAMETER
		// #######################################################

		String petternCd   = prv.getPetternCd();
		String classCd     = prv.getClassCd();
		String dpPrNo      = prv.getDpPrNo();
		String itemCd      = prv.getItemCd();
		String matCd       = prv.getMatCd();
		String labelType   = prv.getLabelType();
		String tireFrCd    = prv.getTireFrCd();
		String driveFwd    = prv.getDriveFwd();
		String driveRwd    = prv.getDriveRwd();
		String modelCd     = prv.getModelCd();
		String modelNm     = prv.getModelNm();
		String contentsCd  = prv.getContentsCd();
		String frCd        = prv.getFrCd();
		String addDpPrNo   = prv.getAddDpPrNo();
		String addItemCd   = prv.getAddItemCd();
		String addMatCd    = prv.getAddMatCd();
		String classCdNew  = prv.getClassCdNew();
		String carNo       = prv.getCarNo();
		String addTireInfo = prv.getAddTireInfo();

		String sectionWidth    = prv.getSectionWidth();
		String aspectRatio 	   = prv.getAspectRatio();
		String wheelInches 	   = prv.getWheelInches();
		String sectionRwWidth  = prv.getSectionRwWidth();
		String aspectRwRatio   = prv.getAspectRwRatio();
		String wheelRwInches   = prv.getWheelRwInches();
		String addTireYn       = prv.getAddTireYn();
 		// #######################################################

		List<String> niceGradeCd    = prv.getNiceGradeCd();
		//추가 타이어 구분하기 위해서 현재 선택한타이어 /추가 타이어
		String searchSw    = (tireFrCd.equals("F")) ? sectionWidth   : sectionRwWidth;  //단면폭 or sectionWidth
		String searchAr	   = (tireFrCd.equals("F")) ? aspectRatio    : aspectRwRatio ; //편평비 or aspectRatio
		String searchWi	   = (tireFrCd.equals("F")) ? wheelInches    : wheelRwInches ; //인치    or wheelInches
		String searchAddSw = (tireFrCd.equals("F")) ? sectionRwWidth : sectionWidth;   //추가 타이어 단면폭 or sectionWidth
		String searchAddAr = (tireFrCd.equals("F")) ? aspectRwRatio  : aspectRatio ;   //추가 타이어 편평비 or aspectRatio
		String searchAddWi = (tireFrCd.equals("F")) ? wheelRwInches  : wheelInches ;   //추가 타이어 인치    or wheelInches

		PrdSearchVo prdSearchVo = new PrdSearchVo();
		if(prv.getSectionWidth() != null && StringUtils.isNoneEmpty(dpPrNo) ) {
			//임직원 여부 체크
			if(clientVo != null){	// 임직원인지 아닌지
				if(!"".equals(clientVo.getOfficerCd()) && null != clientVo.getOfficerCd()){
					officerCd = clientVo.getOfficerCd().toString();
					safeKey = clientVo.getSafekey();
				}
				MbCustIssInfoVo mbCustIssInfoVo = memberSvc.selectIssCertInfo(clientVo.getCustId());
				if(mbCustIssInfoVo != null){
//					String serverMode = System.getProperty(CoreConstants.SERVER_MODE);
//					if(!serverMode.equalsIgnoreCase("prd")){
						prdSearchVo.setGrpPay("Y");
						prdSearchVo.setCustId(clientVo.getCustId());
//					}
				}
			}

			// 로그
			logGetRequestParameter(request);

			//내용 조회 (구매)
			prdSearchVo.setPatternCd(petternCd);
			prdSearchVo.setDpPrNo(dpPrNo); //TODO[권기현] 패턴명에서  전시상품 번호로 조회
			prdSearchVo.setItemCd(itemCd);
			prdSearchVo.setMatCd(matCd);
			prdSearchVo.setModelCd(modelCd);
			prdSearchVo.setContentsCd(contentsCd);
			PrdRsVo pchsCont = productSvc.selectProdViewCont(prdSearchVo);
			//회원이 그룹회원일경우 상품이 렌탈만 해당될때   품목의 상세 데이터를 가져오기 위해서 품목 상세 정보를 재조회한다.
			if(pchsCont == null && StringUtil.equals(prdSearchVo.getGrpPay(), "Y")){
				pchsCont = cboCmDao.selectOne(ProductDao.selectProdViewCont, prdSearchVo);
			}

			if(StringUtils.isBlank(pchsCont.getPlyRating())) {
				pchsCont.setPlyRating(prv.getPlyRating());
			}

			//TODO [권기현] 개선 첨부파일 노출 이미지 셋팅
			List<String> tireImgList = new ArrayList<String>();
			String prodDtlInfoImg   = pchsCont.getInfoDtlImgUrl(); //상품 상세 이미지
			String prodMainImg      = pchsCont.getReprsntImgUrl(); //상품 대표 이미지
			String o2oThumImg       = pchsCont.getThumbImgUrl();   //썸네일 이미지
			String thumImg          = pchsCont.getThumbImgUrl();   //썸네일 이미지
			String logoListImgUrl   = pchsCont.getLogoListImgUrl();
			String logoDtlImgUrl    = pchsCont.getLogoDtlImgUrl();

			model.addAttribute("systemGbn", labelType);

			pchsCont.setNiceGradeCd(niceGradeCd);
			pchsCont.setSearchSw(searchSw);//단면폭
			pchsCont.setSearchAr(searchAr); //편평비
			pchsCont.setSearchWi(searchWi);//인치
			pchsCont.setSearchAddSw(searchAddSw); //추가 타이어 단면폭
			pchsCont.setSearchAddAr(searchAddAr); //추가 타이어 편평비
			pchsCont.setSearchAddWi(searchAddWi); //추가 타이어 인치

			//추가 타이어 재조회 하기 위해 추가함.
			pchsCont.setSectionWidth(sectionWidth);//단면폭
			pchsCont.setAspectRatio(aspectRatio); //편평비
			pchsCont.setWheelInches(wheelInches);//인치
			pchsCont.setSectionRwWidth(sectionRwWidth); //추가 타이어 단면폭
			pchsCont.setAspectRwRatio(aspectRwRatio); //추가 타이어 편평비
			pchsCont.setWheelRwInches(wheelRwInches); //추가 타이어 인치

			pchsCont.setDriveFwd(driveFwd);
			pchsCont.setDriveRwd(driveRwd);
			pchsCont.setTireFrCd(tireFrCd);
			pchsCont.setFrCd(frCd);
			String TireSize = sectionWidth + '/' + aspectRatio + "R" + wheelInches + " " + pchsCont.getPlyRating() + "P";
			pchsCont.setTireSize(TireSize); //단면폭 + 편평비 + 인치
			pchsCont.setClassCdNew(classCdNew);
			pchsCont.setCarNo(carNo);
			pchsCont.setAddDpPrNo(addDpPrNo);
			pchsCont.setAddItemCd(addItemCd);
			pchsCont.setAddMatCd(addMatCd);
			pchsCont.setSystemGbn(labelType);
			pchsCont.setAddTireInfo(addTireInfo);
			pchsCont.setAddTireYn(addTireYn);
			pchsCont.setModelNm(modelNm);

			// 옵션 로직 추가 2020-08-11
			if("C".equals(labelType) || "O".equals(labelType)){
				PrdOptSearchVo prdOptSearchVo = new PrdOptSearchVo();
				prdOptSearchVo.setDpPrNo(pchsCont.getDpPrNo());
				prdOptSearchVo.setOptPchsQy(1);
				//옵션 리스트 조회
				List<OdOptDtlToVo> optList = productSvc.selectSvcOrdOptDtlList(prdOptSearchVo);
				model.addAttribute("optList", optList);//얼라인먼트
			}

			PrdRsVo pVo = new PrdRsVo();
			pVo.setSectionWidth(sectionWidth);
			pVo.setAspectRatio(aspectRatio);
			pVo.setWheelInches(wheelInches);

			List<PrdRsVo> patternCdAll = productSvc.patternCdAll(pVo);

			model.addAttribute("prodMainImg"     , prodMainImg);
			//이미지 관련
			model.addAttribute("logoListImgUrl"  , logoListImgUrl); //로고 리스트  이미지
			model.addAttribute("logoDtlImgUrl"   , logoDtlImgUrl); //로고 상세 이미지
			model.addAttribute("prodDtlInfoImg"  , prodDtlInfoImg); //제품 상세 이미지
			//타이어 이미지 담기
			tireImgList.add(0,pchsCont.getDtlSubImg1Url());
			tireImgList.add(1,pchsCont.getDtlSubImg2Url());
			tireImgList.add(2,pchsCont.getDtlSubImg3Url());
			tireImgList.add(3,pchsCont.getDtlSubImg4Url());
			model.addAttribute("tireImgList"    , tireImgList);
			model.addAttribute("renThumImg"     , thumImg);
			model.addAttribute("o2oThumImg"     , o2oThumImg);
			model.addAttribute("officerCd"      , officerCd	); /*임직원 코드*/
			model.addAttribute("safeKey"        , safeKey	); /*safeKey*/
			model.addAttribute("userVo"         , userVo);
			model.addAttribute("clientVo"       , clientVo);
			model.addAttribute("reRentUseYN"    , SessionUtil.getAttribute("reRentUseYN"));	//재렌탈고객 여부
			model.addAttribute("carSearchParam" , prv.getCarSearchParam());
			model.addAttribute("labelType"      , labelType);				//리스트에서 넘어온게 구매인지 렌탈인지 둘다인지.
			model.addAttribute("grpPay"			, prdSearchVo.getGrpPay()); //제휴코드 인증여부

			model.addAttribute("resultMapCom", pchsCont); //구매상세정보
			model.addAttribute("tDt", tDt); //오늘날짜
			model.addAttribute("patternCdAll", patternCdAll); //오늘날짜


		} else {
			logger.debug("########## prdDetail Direct Url Access ######## ");
			rtnUrl = "/main/main";
		}
		
		//10233006 GA title tag 동적 변경
		if(StringUtil.equals(rtnUrl, "/main/main")) {
			model.addAttribute("title", "메인 | NEXT LEVEL");
		}else if(StringUtil.equals(rtnUrl, "/product/prdDetail")) {
			model.addAttribute("title", "상품 상세페이지 | NEXT LEVEL");
		}
		
		return rtnUrl;
	}

	public String selectprdDetail_test(HttpServletRequest request, Model model, PrdRsVo prv) throws Exception {
		UsrVo userVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_USR_VO);
		ReRentalVo clientVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_CLIENT_VO);

		String[] fBrand = request.getParameterValues("fBrand");
		String[] fCarType = request.getParameterValues("fCarType");
		String[] fSeason = request.getParameterValues("fSeason");
		String[] fRentalYn = request.getParameterValues("fRentalYn");

		model.addAttribute("fBrand", fBrand);
		model.addAttribute("fCarType", fCarType);
		model.addAttribute("fSeason", fSeason);
		model.addAttribute("fRentalYn", fRentalYn);

		RentalPrdSearchVo vo = new RentalPrdSearchVo();
		PrdSearchVo pvo = new PrdSearchVo();
		String rtnUrl = "/product/prdDetail";

		if(prv.getSectionWidth() != null) {
			String searchGbn 	= prv.getSearchGbn();		//N : 차량번호 , C : 차종 , S : 사이즈
			String carNo	 	= prv.getCarNo(); 			//차량번호
			String makerCd	 	= prv.getMakerCd(); 		//제조사 코드
			String makerNm 		= prv.getMakerNm();			//제조사 명
			String modelCd 		= prv.getModelCd();			//차 모델 코드
			String modelNm 		= prv.getModelNm();			//차 모델  명
			String contentsCd 	= prv.getContentsCd();	 	//차 사양 코드
			String contentsNm 	= prv.getContentsNm();	 	//차 사양 명

			String sectionWidth = "";
			String aspectRatio 	= "";
			String wheelInches 	= "";

			if(prv.getSectionWidth().indexOf(",") >= 0){
				sectionWidth =prv.getSectionWidth().substring(prv.getSectionWidth().indexOf(",")+1);
			}else{
				sectionWidth = prv.getSectionWidth();	//단면폭 or sectionWidth
			}

			if(prv.getAspectRatio().indexOf(",") >= 0){
				aspectRatio =prv.getAspectRatio().substring(prv.getAspectRatio().indexOf(",")+1);
			}else{
				aspectRatio 	= prv.getAspectRatio();	 	//편평비 or aspectRatio
			}

			if(prv.getWheelInches().indexOf(",") >= 0){
				wheelInches =prv.getWheelInches().substring(prv.getWheelInches().indexOf(",")+1);
			}else{
				wheelInches 	= prv.getWheelInches();	 	//인치    or wheelInches
			}


			String dMakerCd 	= prv.getdMakerCd();		//제조사 코드
			String petternCd 	= prv.getPetternCd().replace("+", " ");		//패턴 코드
			String frCd 		= prv.getFrCd(); 			//앞뒤 구분
			String classCd  	= prv.getClassCd();			//치종 구분 > 승용차 / SUV
			String matCd 		= prv.getMatCd();			//상품코드
			String plyRating 	= prv.getPlyRating();		//강도
			String TireSizeCd 	= prv.getTireSizeCd();		//단면폭 + 편평비 + 인치
			String TireSizeNm 	= prv.getTireSizeNm();		//단면폭 + 편평비 + 인치
			String description 	= prv.getDescription();     // 순정 호환
			String seasonCd 	= prv.getSeasonCd();        // 계절
			String seasonCdNm 	= prv.getSeasonCdNm();      // 계절

			String classCdNew 	= prv.getClassCdNew();      // 20191231

			String minSaleFee 	= prv.getMinSaleFee();
			String maxSaleFee 	= prv.getMaxSaleFee();
			String otPay 	= prv.getOtPay();

			String labelType    = prv.getLabelType();

			List<String> niceGradeCd    = prv.getNiceGradeCd();

			String officerCd	= "";
			String TireSize 	= "";
			String safeKey 	= "";

			String o2oThumImg = ""; //구매용 썸네일 이미지

			if(clientVo != null){	// 임직원인지 아닌지
				if(!"".equals(clientVo.getOfficerCd()) && null != clientVo.getOfficerCd()){
					officerCd = clientVo.getOfficerCd().toString();
					safeKey = clientVo.getSafekey();
				}

				MbCustIssInfoVo mbCustIssInfoVo = memberSvc.selectIssCertInfo(clientVo.getCustId());

				if(mbCustIssInfoVo != null){
					String serverMode = System.getProperty(CoreConstants.SERVER_MODE);
					if(!serverMode.equalsIgnoreCase("prd")){
						pvo.setGrpPay("Y");
						pvo.setCustId(clientVo.getCustId());
					}
				}
			}

			if("C".equals(searchGbn) || "N".equals(searchGbn) || !"".equals(carNo)){
				TireSize = TireSizeNm + " " + plyRating + "P";;
			}else if("S".equals(searchGbn)){
				TireSize = sectionWidth + '/' + aspectRatio + "R" + wheelInches + " " + plyRating + "P";
			}

			vo.setPatternCd(petternCd);
			vo.setClassCd(classCd);
			pvo.setPatternCd(petternCd);


			// 로그
			logGetRequestParameter(request);

			//내용 조회 (렌탈)
			RentalPrdRsVo cont1 = rentalProductSvc.selectProdViewCont(vo);

			//내용 조회 (구매)
			PrdRsVo cont2 = productSvc.selectProdViewCont(pvo);

			//첨부파일 조회
			List<RentalPrdAttFileVO> attFileList = rentalProductSvc.selectPrdAttFileList(vo);

			//첨부파일 노출 이미지 셋팅
			int j=0;
			List atflPathNmList = new ArrayList();
			String prodViewImg = ""; //상품 상세 이미지
			String prodMainImg = ""; //상품 대표 이미지
			String thumImg = ""; 	 //썸네일 이미지

			if(attFileList.size() > 0){
				for(int i=0;i<attFileList.size();i++){
					String atflClassCd = attFileList.get(i).getAtflClassCd();

					if("2".equals(atflClassCd)){
						atflPathNmList.add(j,(String)attFileList.get(i).getAtflPathNm());
						j++;
					}else if("3".equals(atflClassCd)){
						prodViewImg = (String)attFileList.get(i).getAtflPathNm();
					}else if("0".equals(atflClassCd)){
						prodMainImg = (String)attFileList.get(i).getAtflPathNm();
					}else if("4".equals(atflClassCd)){
						thumImg = (String)attFileList.get(i).getAtflPathNm();
					}
				}
			}


			model.addAttribute("systemGbn",      labelType);

			//렌탈인지 구매인지 둘다인지 구분하기 위한 값
			if("C".equals(labelType)){//구매 렌탈 다 있을경우
				//구매의 상품 가격들은 담아준다.
				cont1.setBassSaleFee(cont2.getBassSaleFee());
				cont1.setSaleFee(cont2.getSaleFee());
				cont1.setStmemSaleAmt(cont2.getStmemSaleAmt());
				cont1.setDpPrNo(cont2.getDpPrNo());
				o2oThumImg = cont2.getThumbImgUrl();
				//구매의 상품 가격들은 담아준다.

				//상품List와 동일하게 구매의 정보를 담아준다.
				cont1.setBestYn(cont2.getRcmdYn());
				cont1.setHotYn(cont2.getHotYn());

				//렌탈 상세정보
				model.addAttribute("resultMapCom",      cont1);

			}else if("R".equals(labelType)){//렌탈만 있을경우
				model.addAttribute("resultMapCom",      cont1);

			}else if("O".equals(labelType)){//구매만 있을경우
				o2oThumImg = cont2.getThumbImgUrl();
				cont2.setSeasonCdNm(seasonCdNm);
				cont2.setSeasonCd(seasonCd);
				model.addAttribute("resultMapCom",      cont2); //구매상세정보
			}

			// 옵션 로직 추가 2020-08-11
			if("C".equals(labelType) || "O".equals(labelType)){
				PrdOptSearchVo prdOptSearchVo = new PrdOptSearchVo();
				prdOptSearchVo.setDpPrNo(cont2.getDpPrNo());
				prdOptSearchVo.setOptPchsQy(1);
				//옵션 리스트 조회
				List<OdOptDtlToVo> optList = productSvc.selectSvcOrdOptDtlList(prdOptSearchVo);
				model.addAttribute("optList", optList);//얼라인먼트

			}

			//렌탈인지 구매인지 둘다인지 구분하기 위한 값

			PrdRsVo pVo = new PrdRsVo();
			pVo.setSectionWidth(sectionWidth);
			pVo.setAspectRatio(aspectRatio);
			pVo.setWheelInches(wheelInches);

			List<PrdRsVo> patternCdAll = productSvc.patternCdAll(pVo);

			model.addAttribute("niceGradeCd", niceGradeCd);
			model.addAttribute("atflPathNmList", atflPathNmList);
			model.addAttribute("prodViewImg", prodViewImg);
			model.addAttribute("prodMainImg", prodMainImg);

			model.addAttribute("renThumImg", thumImg);
			model.addAttribute("o2oThumImg", o2oThumImg);

			model.addAttribute("officerCd",  	officerCd	); /*임직원 코드*/
			model.addAttribute("safeKey",  	safeKey	); /*safeKey*/

			model.addAttribute("searchGbn",  	searchGbn);
			model.addAttribute("description",  	StringUtil.nvl(description, ""));
			model.addAttribute("userVo",     	userVo);
			model.addAttribute("clientVo",     	clientVo);
			model.addAttribute("makerCd",    	makerCd);				/*제조사 코드*/
			model.addAttribute("makerNm",    	makerNm);				/*제조사 명*/
			model.addAttribute("modelNm",    	modelNm);				/*차 모델 코드*/
			model.addAttribute("modelCd",    	modelCd);				/*차 모델 명*/
			model.addAttribute("contentsCd", 	contentsCd);			/*차 사양 코드?*/
			model.addAttribute("contentsNm", 	contentsNm);			/*차 사양 명*/
			model.addAttribute("searchSw",   	sectionWidth);			/*단면폭*/
			model.addAttribute("searchAr",   	aspectRatio);			/*편평비*/
			model.addAttribute("searchWi",   	wheelInches);			/*인치*/
			model.addAttribute("dMakerCd",   	dMakerCd);				/*제조사 코드*/
			model.addAttribute("patternCd",  	petternCd);				/*패턴 코드*/
			model.addAttribute("matCd",    	 	matCd);					/*상품코드*/
			model.addAttribute("TireSize",   	TireSize);			    /*단면폭 + 편평비 + 인치*/
			model.addAttribute("carNo",      	carNo);					/*차량번호*/
			model.addAttribute("classCd",    	classCd);				/*차량분류*/
			model.addAttribute("frCd",    		frCd);					/*앞뒤구분*/
			model.addAttribute("plyRating",    	plyRating);				/*강도*/
			model.addAttribute("labelType",    	labelType);				/*리스트에서 넘어온게 구매인지 렌탈인지 둘다인지.*/
			model.addAttribute("reRentUseYN",    	SessionUtil.getAttribute("reRentUseYN"));	//재렌탈고객 여부
			model.addAttribute("classCdNew",    	classCdNew);
			model.addAttribute("minSaleFee",    	minSaleFee);
			model.addAttribute("maxSaleFee",    	maxSaleFee);
			model.addAttribute("otPay",    	otPay);
			model.addAttribute("carSearchParam",prv.getCarSearchParam());
			model.addAttribute("reviewGrdPt",prv.getReviewGrdPt());
			model.addAttribute("reviewCnt",prv.getReviewCnt());
			model.addAttribute("seasonCdNm",prv.getSeasonCdNm());
			model.addAttribute("patternCdAll", patternCdAll);
		} else {
			logger.debug("########## prdDetail Direct Url Access ######## ");
			rtnUrl = "/main/main";
		}
		return rtnUrl;
	}


	/**
	 * request값 로그 확인
	 * @param request
	 */
	public void logGetRequestParameter(HttpServletRequest request){
		Enumeration<String> paramNames = request.getParameterNames();
		while(paramNames.hasMoreElements()){
			String name = paramNames.nextElement();
			String [] data = request.getParameterValues(name);
			for(String eachData : data){
				logger.debug("########## parameter " + name + " : " + eachData);
			}
		}
	}

	/**
	 * 구매후기
	 * @param request
	 * @param model
	 * @param bvo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/selectOrderReviewList")
	@ResponseBody
	public Map<String, Object> selectOrderReviewList(HttpServletRequest request, Model model, @RequestBody BoardVo bvo) throws Exception {
		logger.debug("selectOrderReviewList controller ");
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> selectReviewMap = new HashMap<String, Object>();
//		selectReviewMap = productSvc.selectOrderReviewList(bvo);
		selectReviewMap = productSvc.orderReviewListNew(bvo);
		PageVo pageVo = new PageVo();
		pageVo.setTotalCount(Integer.parseInt(selectReviewMap.get("totalCnt").toString()));
		pageVo.setPageNo(bvo.getPageNo());
		pageVo.setPageSize(10);

		/*map.put("makerNm",    "현대자동차");*/
		map.put("resultList", selectReviewMap.get("selectReviewList"));
		map.put("resultAtflList", selectReviewMap.get("selectReviewAtflList"));
		map.put("totStars", selectReviewMap.get("totStars"));
		map.put("totStarImg", selectReviewMap.get("totStarImg"));
		//		map.put("atflListAll", productSvc.selectOrderReviewAtflList(bvo)); //// productSvc.selectOrderReviewAtflList(bvo) 무슨 차이이길래 ?? selectReviewMap.get("selectReviewAtflList") 값에 들어가 있는 것과 productSvc.selectOrderReviewAtflList(bvo)는 같다 변수와 쿼리가 같음
		map.put("totImgCnt", selectReviewMap.get("totImgCnt"));
		map.put("pageCommon", pageVo);
		return map;
	}

	/**
	 * 구매후기
	 * @param request
	 * @param model
	 * @param bvo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/selectReviewDtl")
	@ResponseBody
	public Map<String, Object> selectReviewDtl(HttpServletRequest request, Model model, @RequestBody BoardVo bvo) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();

		List<BoardVo> reviewDtl = productSvc.reviewDtl(bvo);

		if(bvo.getSearchType() != null && bvo.getSearchType() != "") {
			for(BoardVo vo : reviewDtl) {
				bvo.setUsePsNo(vo.getUsePsNo());
			}
		}

		List<BoardVo> reviewImg = productSvc.selectOrderReviewAtflList(bvo);

		map.put("reviewDtl", reviewDtl);
		map.put("reviewImg", reviewImg);
		return map;
	}

	/**
	 * 구매후기 추천수
	 * @param request
	 * @param model
	 * @param bvo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/reviewRcmdCheck")
	@ResponseBody
	public Map<String, Object> reviewRcmdCheck(HttpServletRequest request, Model model, @RequestBody BoardVo bvo) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> selectReviewMap = new HashMap<String, Object>();

		selectReviewMap = productSvc.reviewRcmdCheck(bvo);

		map.put("boardVO", bvo);
		map.put("rcmdChk", selectReviewMap.get("rcmdChk"));
		return map;
	}


	/**
	 * 렌탈 가격 불러오기
	 * @param request
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/selectRentalViewList")
	@ResponseBody
	public Map<String, Object> selectRentalViewList(HttpServletRequest request, Model model, @RequestBody RentalPrdRsVo vo) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		UsrVo userVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_USR_VO);
		ReRentalVo clientVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_CLIENT_VO);

		if(clientVo != null){
			// 임직원, 일반 추천렌탈상품 구분
			if(!"".equals(clientVo.getOfficerCd()) && null != clientVo.getOfficerCd()){
				// 해당 임직원 구매가능횟수 조회
				int purcAblCnt = rentalProductSvc.selectPurcAblCnt(clientVo);
				if(purcAblCnt > 0){
					// 임직원렌탈상품 리스트
					list = rentalProductSvc.selectSrtsd0005ShopEmployeesAmt(vo);
					// 240827 백인천 - 임직원상품 없으면 임직원도 추천렌탈상품으로 노출.
					if(list.size() < 1) {
						// 추천렌탈상품 리스트
						list = rentalProductSvc.selectSrtsd0005ShopTotAmt(vo);
					}
				}else{
					// 추천렌탈상품 리스트
					list = rentalProductSvc.selectSrtsd0005ShopTotAmt(vo);
				}
			}else{
				// 추천렌탈상품 리스트
				list = rentalProductSvc.selectSrtsd0005ShopTotAmt(vo);
			}
		}else{
			// 추천렌탈상품 리스트
			list = rentalProductSvc.selectSrtsd0005ShopTotAmt(vo);
		}

		//각 렌탈의 서비스 코드 가져오기
		List<Map> prodList = new ArrayList();

		// 상품별 서비스 리스트 저장
		for(Map<String, Object> tmpList : list){

			vo.setSaleCd(String.valueOf(tmpList.get("saleCd")));
			List<Map<String, Object>> svrList = rentalProductSvc.selectSRtsd0005ShopServiceList(vo);
			for(Map svrMap:svrList){

				if(("B00001").equals(svrMap.get("prsDcd"))){ //엔진오일
					tmpList.put("selEnginCd", svrMap.get("servCnt"));
				}else if(("B00002").equals(svrMap.get("prsDcd"))){ //위치교환
					tmpList.put("selLocCd", svrMap.get("servCnt"));
				}else if(("B00003").equals(svrMap.get("prsDcd"))){ //방문점검
					tmpList.put("selVisCd", svrMap.get("servCnt"));
				}else if(("B00004").equals(svrMap.get("prsDcd"))){ //보관
					tmpList.put("selSaveCd", svrMap.get("servCnt"));
				}else if(("B00006").equals(svrMap.get("prsDcd"))){ //교체
					tmpList.put("selEnginCd", svrMap.get("servCnt"));
				}else if(("B00007").equals(svrMap.get("prsDcd"))){ //프리미엄(사계절보증제도)
					tmpList.put("selPrCd", svrMap.get("servCnt"));
				}else if(("B00008").equals(svrMap.get("prsDcd"))){ //얼라인먼트
					tmpList.put("selArCd", svrMap.get("servCnt"));
				}else if(("B00010").equals(svrMap.get("prsDcd"))){ //얼라인먼트
					tmpList.put("selCheckCd", svrMap.get("servCnt"));
				}
			}
			prodList.add(tmpList);
		}


		// 추천렌탈 - 계약 개월 코드
		List<RentalPrdSearchVo> recomMonthList = rentalProductSvc.selectProdViewCdList42(vo);

		map.put("prodList",prodList);
		map.put("chkMonthCd",vo.getPeriodCd());
		map.put("recomMonthList",recomMonthList);

		return map;
	}

	/**
	 * 쿠폰 가격 불러오기
	 * @param request
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/selectCouponAmt")
	@ResponseBody
	public int selectCouponAmt(HttpServletRequest request, Model model, @RequestBody OrderVo orderVo) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		UsrVo userVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_USR_VO);

//		orderVo.setOrdPkgDcAmt(orderVo.getOrdPkgDcAmt()); // 결제 금액
//		orderVo.setDpPrNo(orderVo.getDpPrNo());            // 전시 상품 번호
//		orderVo.setItemCd(orderVo.getItemCd());            // 품목 코드
//		orderVo.setOrdQty(orderVo.getOrdQty());

		int cpnSaleFee = productSvc.getCouponAmt(orderVo);


		return cpnSaleFee;
	}

	/**
	 * 자유렌탈 서비스 리스트 불러오기
	 * @param request
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/selectFreeRentalServiceList")
	@ResponseBody
	public Map<String, Object> selectFreeRentalServiceList(HttpServletRequest request, Model model, @RequestBody RentalPrdRsVo vo) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();

		List<Map<String, Object>> list = rentalProductSvc.selectFreeRentalServiceList(vo);

		List<Map> getProdViewCdList51 = new ArrayList(); //엔진오일
		List<Map> getProdViewCdList52 = new ArrayList(); //위치교환
		List<Map> getProdViewCdList53 = new ArrayList(); //방문점검
		List<Map> getProdViewCdList54 = new ArrayList(); //보관
		List<Map> getProdViewCdList55 = new ArrayList(); //교체
		List<Map> getProdViewCdList56 = new ArrayList(); //프리미엄(사계절보증제도)
		List<Map> getProdViewCdList57 = new ArrayList(); //얼라인먼트
		List<Map> getProdViewCdList58 = new ArrayList(); //얼라인먼트

		for(int i=0; i<list.size(); i++){
			if(("B00001").equals(list.get(i).get("prsDcd"))){ //엔진오일
				getProdViewCdList51.add((Map) list.get(i));
			}else if(("B00002").equals(list.get(i).get("prsDcd"))){ //위치교환
				getProdViewCdList52.add((Map) list.get(i));
			}else if(("B00003").equals(list.get(i).get("prsDcd"))){ //방문점검
				getProdViewCdList53.add((Map) list.get(i));
			}else if(("B00004").equals(list.get(i).get("prsDcd"))){ //보관
				getProdViewCdList54.add((Map) list.get(i));
			}else if(("B00006").equals(list.get(i).get("prsDcd"))){ //교체
				getProdViewCdList55.add((Map) list.get(i));
			}else if(("B00007").equals(list.get(i).get("prsDcd"))){ //프리미엄(사계절보증제도)
				getProdViewCdList56.add((Map) list.get(i));
			}else if(("B00008").equals(list.get(i).get("prsDcd"))){ //얼라인먼트
				getProdViewCdList57.add((Map) list.get(i));
			}else if(("B00010").equals(list.get(i).get("prsDcd"))){ //체크서비스
				getProdViewCdList58.add((Map) list.get(i));
			}
		}

		map.put("getProdViewCdList51", getProdViewCdList51); //엔진오일 교체 서비스
		map.put("getProdViewCdList52", getProdViewCdList52); //위치교환서비스 무상 서비스
		map.put("getProdViewCdList53", getProdViewCdList53); //방문점검서비스
		map.put("getProdViewCdList54", getProdViewCdList54); //보관서비스
		map.put("getProdViewCdList55", getProdViewCdList55); //타이어 교체 서비스
		map.put("getProdViewCdList56", getProdViewCdList56); //타이어 무상 교체 서비스
		map.put("getProdViewCdList57", getProdViewCdList57); //얼라인먼트 무상 서비스
		map.put("getProdViewCdList58", getProdViewCdList58); //체크 서비스

		return map;
	}

	/**
	 * 렌탈 등록비를 조회해 온다
	 * @param request
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/selectRntalRegAmtList")
	@ResponseBody
	public Map<String, Object> selectRntalRegAmtList(HttpServletRequest request, Model model, @RequestBody RentalPrdRsVo vo) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();

		String reRentalOrdNo = StringUtil.nvl(SessionUtil.getAttribute("reRentUseYN"), "N");

		// 재렌탈이 아닐 경우에는 등록금 전체 리스트 조회
		if("N".equals(reRentalOrdNo) || "".equals(reRentalOrdNo)) {
			//vo.setCntCd("");
		}
		//렌탈 등록비
		List<RentalPrdSearchVo> regAmtList = rentalProductSvc.selectRntalRegAmtList(vo);
		//렌탈료 납부기간
		List<RentalPrdSearchVo> renNapbuList = rentalProductSvc.selectProdViewCdList42(vo);

		map.put("regAmtList",    regAmtList);
		map.put("renNapbuList",    renNapbuList);
		return map;
	}

	/**
	 * 자유렌탈 가격 불러오기
	 * @param request
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/selectCalculateSelfProdFee")
	@ResponseBody
	public Map<String, Object> selectCalculateSelfProdFee(HttpServletRequest request, Model model, @RequestBody RentalPrdRsVo vo) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();

		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		list = rentalProductSvc.selectCalculateSelfProdFee(vo);
		map.put("freeList",list);

		return map;
	}


	/**
	 * 구매 아이템 코드 가져오기
	 * @param request
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/selectGetItemCd")
	@ResponseBody
	public Map<String, Object> selectGetItemCd(HttpServletRequest request, Model model, PrdRsVo vo)  throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		PrdRsVo rvo = new PrdRsVo();
		rvo = productSvc.selectGetItemCd(vo);
		map.put("resulet", rvo);
		return map;
	}


	/**
	 * 렌탈 장바구니 저장
	 * @param request
	 * @param cvo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/insertRentalCart" , method={RequestMethod.POST})
	@ResponseBody
	public Map<String, Object> insertRentalCart(HttpServletRequest request, @RequestBody RentalCartVo cvo) throws Exception {
		ReRentalVo clientVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_CLIENT_VO);
		Map<String, Object> rtn = new HashMap<String, Object>();
		HttpSession session = request.getSession(true);
		//session.setAttribute("cartData", URLDecoder.decode(request.getQueryString(),"UTF-8"));


		cvo.setCustId(clientVo.getCustId().toString());

		try {
			//저장
			String rs = rentalProductSvc.insertRentalCart(cvo);

			if("S".equals(rs)) {
				//성공일 때 리턴 형식
				rtn.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_OK);
				rtn.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_OK);
			}else {
				rtn.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_BIZ_ERROR);
				rtn.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_ERROR);
			}
		} catch(Exception e) {
			//실패일 때 리턴 형식
			rtn.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_BIZ_ERROR);
			rtn.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_ERROR);
		}

		return rtn;
	}

	/**
	 * (구매)장바구니 저장
	 * @param request
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/insertO2oCart" , method={RequestMethod.POST})
	@ResponseBody
	public Map<String, Object> insertO2oCart(HttpServletRequest request, @RequestBody OdBasketToVo vo) throws Exception {
		Map<String, Object> rtn = new HashMap<String, Object>();
		ReRentalVo clientVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_CLIENT_VO);


		vo.setUserId(clientVo.getCustId());//고객 아이디 넣기

		if(clientVo != null){	// 임직원인지 아닌지
			if(!"".equals(clientVo.getOfficerCd()) && null != clientVo.getOfficerCd()){
				vo.setStmemDcYn("Y");
			}else{
				vo.setStmemDcYn("N");
			}
		}
		vo.setSaleSeCd("3000");
		/*	1000	렌탈판매
			2000	일시불판매
			3000	멤버십*/

		try {
			//저장
			String rs = cartSvc.insertO2oCart(vo);

			if("S".equals(rs)) {
				//성공일 때 리턴 형식
				rtn.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_OK);
				rtn.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_OK);
			}else {
				rtn.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_BIZ_ERROR);
				rtn.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_ERROR);
			}
		} catch(Exception e) {
			//실패일 때 리턴 형식
			rtn.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_BIZ_ERROR);
			rtn.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_ERROR);
		}

		return rtn;
	}

	/**
	 * 구매 가격 재조회
	 * @param request
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/selectO2oOrderAmt")
	@ResponseBody
	public Map<String, Object> selectO2oOrderAmt(HttpServletRequest request, @RequestBody PrdRsVo vo)  throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		List<PrdRsVo> list = new ArrayList<PrdRsVo>();
		list= productSvc.selectO2oOrderAmt(vo);
		map.put("result", list);

		UsrVo userVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_USR_VO);
		if(userVo == null){
			map.put("grpYn", "N");
		}else{
			MbCustIssInfoVo mbCustIssInfoVo = memberSvc.selectIssCertInfo(userVo.getLoginId());
			if(mbCustIssInfoVo != null){
				map.put("grpYn", "Y");
			}
		}

		return map;
	}

	/**
	 * 추천렌탈 등록비 불러오기
	 * @param request
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/selectNomalRentalAmt")
	@ResponseBody
	public Map<String, Object> selectNomalRentalAmt(HttpServletRequest request, Model model, @RequestBody RentalPrdRsVo vo) throws Exception {
			Map<String, Object> map = new HashMap<String, Object>();
			//렌탈 등록비
			List<RentalPrdSearchVo> regAmtList = rentalProductSvc.selectRntalRegAmtList(vo);
			map.put("regAmtList",regAmtList);
		return map;
	}

	/**

	 * 사이즈 찾기 팝업 등급 - 팝업
	 * @param request
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/selectSizeFinderGradeList")
	@ResponseBody
	public List<?> selectSizeFinderGradeList(HttpServletRequest request, Model model, @RequestBody PrdSearchVo vo) throws Exception {
		List<PrdRsVo> resultList = productSvc.selectSizeFinderGradeList(vo);
		return resultList;
	}

	/**
	 * 사이즈 찾기 목록 - 팝업
	 * @param request
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/selectSizeFinderList")
	@ResponseBody
	public List<?> selectSizeFinderList(HttpServletRequest request, Model model, @RequestBody PrdSearchVo vo) throws Exception {
		List<PrdRsVo> resultList = productSvc.selectSizeFinderList(vo);
		return resultList;
	}

	/**
	 * 사이즈 찾기 - 팝업 (브랜드)
	 * @param request
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/selectSizeFinderBrandList")
	@ResponseBody
	public List<?> selectSizeFinderBrandList(HttpServletRequest request, Model model, @RequestBody PrdSearchVo vo) throws Exception {
		List<PrdRsVo> resultList = productSvc.selectSizeFinderBrandList(vo);
		return resultList;
	}

	/**
	 * 사이즈 찾기 - 팝업 (차종)
	 * @param request
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/selectSizeFinderCarTypeList")
	@ResponseBody
	public List<?> selectSizeFinderCarTypeList(HttpServletRequest request, Model model, @RequestBody PrdSearchVo vo) throws Exception {
		List<PrdRsVo> resultList = productSvc.selectSizeFinderCarTypeList(vo);
		return resultList;
	}

	/**
	 * 사이즈 찾기 - 팝업 (모델)
	 * @param request
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/selectSizeFinderModelList")
	@ResponseBody
	public List<?> selectSizeFinderModelList(HttpServletRequest request, Model model, @RequestBody PrdSearchVo vo) throws Exception {
		List<PrdRsVo> resultList = productSvc.selectSizeFinderModelList(vo);
		return resultList;
	}

	/**
	 * 사이즈 찾기 - 팝업 (연료)
	 * @param request
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/selectSizeFinderFuelList")
	@ResponseBody
	public List<?> selectSizeFinderFuelList(HttpServletRequest request, Model model, @RequestBody PrdSearchVo vo) throws Exception {
		List<PrdRsVo> resultList = productSvc.selectSizeFinderFuelList(vo);
		return resultList;
	}

	/**
	 * 사이즈 찾기 - 팝업 (사이즈)
	 * @param request
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/selectSizeFinderSize")
	@ResponseBody
	public Map<String, Object> selectSizeFinderSize(HttpServletRequest request, Model model, @RequestBody PrdSearchVo vo) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();

		//풀네임 - 하나만 나와야 하지만 나머지와 통일성 있게 일단 List로 구현.
		List<PrdRsVo> fullNameList = productSvc.selectSizeFinderFullNameList(vo);

		//연식
		List<PrdRsVo> yearList = productSvc.selectSizeFinderYearList(vo);

		//등급
		List<PrdRsVo> gradList = productSvc.selectSizeFinderGradeList(vo);

		//사이즈
		List<PrdRsVo> sizeList = productSvc.selectSizeFinderList(vo);

		map.put("fullNameList", fullNameList);
		map.put("yearList", yearList);
		map.put("gradList", gradList);
		map.put("sizeList", sizeList);

		return map;
	}

	/**
	 * 사이즈 찾기 - 팝업 (연식)
	 * @param request
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/selectSizeFinderYearList")
	@ResponseBody
	public List<?> selectSizeFinderYearList(HttpServletRequest request, Model model, @RequestBody PrdSearchVo vo) throws Exception {
		List<PrdRsVo> resultList = productSvc.selectSizeFinderYearList(vo);
		return resultList;
	}

	/**
	 * 사이즈 찾기 - 팝업 (등급코드)
	 * @param request
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/selectSizeFinderFormInfo")
	@ResponseBody
	public Map<String, Object> selectSizeFinderFormInfo(HttpServletRequest request, Model model, @RequestBody PrdSearchVo vo) throws Exception {
		List<PrdRsVo> formInfoList = productSvc.selectSizeFinderFormInfo(vo);
		List<PrdRsVo> gradeList = productSvc.selectSizeFinderGrdCdList(vo);

		Map<String, Object> rtnMap = new HashMap<String, Object>();
		rtnMap.put("formInfoList", formInfoList);
		rtnMap.put("gradeList", gradeList);

		return rtnMap;
	}

	 /*
	 * 사이즈 찾기 팝업 - 끝
	**/

	/**
	 * 미지정 정책 회원 쿠폰 발급
	 * @param request
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/saveFoCpnMst" , method={RequestMethod.POST})
	@ResponseBody
	public Map<String, Object> saveFoCpnMst(HttpServletRequest request, @RequestBody CpnVo vo) throws Exception {
		Map<String, Object> rtn = new HashMap<String, Object>();

		try {
			int rs = cpnSvc.saveFoCpnMst(vo);

			if(rs == 1) {
				//성공일 때 리턴 형식
				rtn.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_OK);
				rtn.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_OK);
			}else if(rs == 2) {
				//이미 쿠폰 다 받을 시
				rtn.put(WebConstants.Rtn.RETURN_CODE, "2");
				rtn.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_OK);
			}else {
				rtn.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_BIZ_ERROR);
				rtn.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_ERROR);
			}
		} catch(Exception e) {
			//실패일 때 리턴 형식
			rtn.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_BIZ_ERROR);
			rtn.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_ERROR);
		}

		return rtn;
	}

	/**
	 * 미지정 정책 쿠폰 유무 조회
	 * @param request
	 * @param vo
	 * @return
	 * @throws Exception
	 */

	@RequestMapping("/selectCpnPlcPtrnYnChk")
	@ResponseBody
	public List<?> selectCpnPlcPtrnYnChk(HttpServletRequest request, Model model, @RequestBody CpnVo vo) throws Exception {
		List<CpnVo> cpnPlcList = cboCmDao.selectList(CpnDao.selectCpnPlcList, vo);

		return cpnPlcList;
	}

	/**
	 * 옵션가격설정
	 * @param request
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/selectCalcSvcPrc")
	@ResponseBody
	public Map<String, Object> selectCalcSvcPrc(HttpServletRequest request, Model model, @RequestBody PrdOptSearchVo searchVo) throws Exception {

		UsrVo userVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_USR_VO);
		//옵션가격조회
		Map<String, Object> map = new HashMap<String, Object>();

		String loginId = "";
		if(userVo != null){
			loginId = userVo.getLoginId();
		}
		searchVo.setUserId(loginId);

		List<OdOptDtlToVo> optDtlList = productSvc.selectSvcOrdOptDtlList(searchVo);

		map.put("optDtlList", optDtlList);

		return map;
	}

	/**
	 * 상품상세 화면(외부유입용 URL)
	 * @param request
	 * @param model
	 * @param prv
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/prdDetail/{patternCd}/{sectionWidth}/{aspectRatio}/{wheelInches}")
	public String selectPrdDetail(@PathVariable String patternCd
									, @PathVariable String sectionWidth
									, @PathVariable String aspectRatio
									, @PathVariable String wheelInches
								    , RedirectAttributes redirectAttributes
								  ) throws Exception {

		PrdRsVo prv = new PrdRsVo();

		prv.setPetternCd(patternCd);
		prv.setSectionWidth(sectionWidth);
		prv.setAspectRatio(aspectRatio);
		prv.setWheelInches(wheelInches);

		PrdSearchVo vo = new PrdSearchVo();
		vo.setSectionWidth(sectionWidth);
		vo.setAspectRatio(aspectRatio);
		vo.setWheelInches(wheelInches);
		String[] fCarType = {"P1", "S1", "V1"};
		ArrayList arrFCarType = new ArrayList(Arrays.asList(fCarType));
		vo.setfCarType(arrFCarType);
		vo.setBuyMinFee("0");
		vo.setBuyMaxFee("400000");
		vo.setRentMinFee("0");
		vo.setRentMaxFee("400000");

		List<PrdRsVo> selectPrdList = productSvc.selectPrdList(vo);

		for(int i=0; i < selectPrdList.size(); i++){
			if(patternCd.equals(selectPrdList.get(i).getPetternCd())){
				prv.setClassCd(selectPrdList.get(i).getClassCd());
				prv.setPlyRating(selectPrdList.get(i).getPlyRating());
				prv.setSeasonCd(selectPrdList.get(i).getSeasonCd());
				prv.setSeasonCdNm(selectPrdList.get(i).getSeasonCdNm());
				prv.setLabelType("O");
				prv.setOtPay(selectPrdList.get(i).getOtPay());
				prv.setMinSaleFee(selectPrdList.get(i).getMinSaleFee());
				prv.setMaxSaleFee(selectPrdList.get(i).getMaxSaleFee());
				prv.setReviewCnt(selectPrdList.get(i).getReviewCnt());
				prv.setReviewGrdPt(selectPrdList.get(i).getReviewGrdPt());
			}
		}

		JSONObject jsonCarSearchParam = new JSONObject();
		String carSearchParam = sectionWidth + "/" + aspectRatio + "R" + wheelInches;
		jsonCarSearchParam.put("brandNbr","");
		jsonCarSearchParam.put("repCarClassNbr","");
		jsonCarSearchParam.put("carClassNm","");
		jsonCarSearchParam.put("fuel","");
		jsonCarSearchParam.put("driveFwd",carSearchParam);
		jsonCarSearchParam.put("driveRwd",carSearchParam);
		jsonCarSearchParam.put("driveDsp",carSearchParam);
		prv.setCarSearchParam(jsonCarSearchParam.toString());

		redirectAttributes.addFlashAttribute("prv", prv);

		return "redirect:/product/prdDetail";
	}

	/**
	 * 이마트매대 상품
	 * @param request
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/selectEmartItemList")
	@ResponseBody
	public List<?> selectEmartItemList(HttpServletRequest request, Model model, @RequestBody PrdSearchVo vo) throws Exception {
		List<PrdRsVo> resultList = productSvc.selectEmartItemList(vo);
		return resultList;
	}
	
	/**
	 * 이마트매대 상품(신규)
	 * @param request
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/selectEmartItemListNew")
	@ResponseBody
	public List<?> selectEmartItemListNew(HttpServletRequest request, Model model, @RequestBody PrdSearchVo vo) throws Exception {
		List<PrdRsVo> resultList = productSvc.selectEmartItemListNew(vo);
		return resultList;
	}
}