package com.nexwrms.mobweb.bbs.ctl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.nexwrms.cfo.com.cm.vo.PageVo;
import com.nexwrms.cfo.com.cm.vo.UsrVo;
import com.nexwrms.cfo.com.constants.WebConstants;
import com.nexwrms.cfo.com.member.svc.MemberSvc;
import com.nexwrms.core.session.SessionInfoUtil;
import com.nexwrms.core.util.SessionUtil;
import com.nexwrms.core.util.StringUtil;
import com.nexwrms.nextlevel.com.board.svc.NoticeSvc;
import com.nexwrms.nextlevel.com.board.svc.QnaListSvc;
import com.nexwrms.nextlevel.com.board.vo.NoticeSearchVo;
import com.nexwrms.nextlevel.com.board.vo.NoticeVo;
import com.nexwrms.nextlevel.com.board.vo.QnaListSearchVo;
import com.nexwrms.nextlevel.com.cm.svc.RentalFileService;
import com.nexwrms.nextlevel.com.cm.vo.AttfileVo;
import com.nexwrms.nextlevel.com.member.svc.RentalMemberSvc;
import com.nexwrms.nextlevel.com.mypage.svc.QuestionSvc;
import com.nexwrms.nextlevel.com.mypage.vo.QuestionVo;
import com.nexwrms.nextlevel.com.order.svc.RentalOrderSvc;
import com.nexwrms.nextlevel.com.order.vo.RentalOrderVo;
import com.nexwrms.nextlevel.com.support.svc.CounselSvc;
import com.nexwrms.nextlevel.com.support.vo.RentCounselVo;



@Controller
@RequestMapping("/bbs")
public class BbsCtl {
	private static final Logger logger = LoggerFactory.getLogger(BbsCtl.class);

	@Autowired
	@Qualifier("com.nexwrms.nextlevel.com.order.svc.RentalOrderSvc")
	RentalOrderSvc rentalOrderSvc;

	@Autowired
    private MemberSvc memberSvc;

	@Autowired
	private NoticeSvc noticeSvc;

	@Autowired
    private QnaListSvc qnaListSvc;

    @Autowired
    private RentalMemberSvc rentalMemberSvc;

    @Autowired
	@Qualifier("com.nexwrms.nextlevel.com.cm.svc.RentalFileService")
	private RentalFileService rentalFileService;

    @Autowired
    private QuestionSvc questionSvc;

    @Autowired
    private CounselSvc counselSvc;

    /**
	 * 공지사항
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/noticeList")
	public String questionList(HttpServletRequest request, Model model) throws Exception {
		String rUrl = "";

			model.addAttribute("headerCss" , "");
			model.addAttribute("viewGbn", "H");
			rUrl = "/bbs/noticeList";
			
			//10233006 GA title tag 동적 변경
			model.addAttribute("title", "공지사항 | NEXT LEVEL");

		return rUrl;
	}

	//공지사항 목록
			@RequestMapping("/selectNoticeList")
			@ResponseBody
			public Map<String, Object> selectNoticeList(HttpServletRequest request,@RequestBody NoticeSearchVo vo , Model model,
					@RequestParam(required = false, value="searchKeyword")String searchKeyword) throws Exception {


				PageVo pageVo = new PageVo();
				pageVo.setTotalCount(noticeSvc.selectNoticeListCnt(vo));
				pageVo.setPageNo(vo.getPageNo());
				pageVo.setPageSize(10);



				Map<String, Object> map = new HashMap<String, Object>();

				map.put("selectNoticeList", noticeSvc.selectNoticeList(vo));
				map.put("pageCommon", pageVo);

				//성공일 때 리턴 형식 - 질문 목록 조회는 무조건 성공응로 한다.
						// 이유 : 조회가 1건이든, 0건이든 성공이기 맞는 의미이기 때문.
				map.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_OK);
				map.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_OK);

				return map;

			}

			/**
			 * 공지사항 상세보기
			 * @param request
			 * @param model
			 * @return
			 * @throws Exception
			 */

			@RequestMapping("/noticeDetail")
			public String noticeDetail(HttpServletRequest request, Model model, @RequestParam(required = true) String bdojSeq)throws Exception {

				NoticeSearchVo searchVo = new NoticeSearchVo();
				searchVo.setBdojSeq(bdojSeq);

				NoticeVo noticeDetailVo = noticeSvc.selectNoticeDetail(searchVo);
				NoticeVo noticePreVo = noticeSvc.selectNoticePre(searchVo);
				NoticeVo noticePostVo = noticeSvc.selectNoticePost(searchVo);


				noticeDetailVo.setnCont(noticeDetailVo.getnCont().replaceAll("(\r\n|\r|\n|\n\r)", "<br>"));

				model.addAttribute("noticeDetailVo", noticeDetailVo);
				model.addAttribute("noticePreVo", noticePreVo);
				model.addAttribute("noticePostVo", noticePostVo);

				return "/bbs/noticeDetail";
			}

	/**
	 * 자주묻는질문 목록
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/qnaList")
	public String qnaList(HttpServletRequest request, HttpSession session, Model model) throws Exception {

		String rUrl = "";
		model.addAttribute("headerCss" , "");
		model.addAttribute("viewGbn", "H");

		rUrl = "/bbs/qnaList";
		
		//10233006 GA title tag 동적 변경
		model.addAttribute("title", "자주 묻는 질문 | NEXT LEVEL");

		return rUrl;

	}

	@RequestMapping("/selectQnaList")
	@ResponseBody
	public Map<String, Object> selectQnaList(HttpServletRequest request, Model model, @RequestBody QnaListSearchVo vo
			,@RequestParam(required = false, value="searchTypeQna")String searchTypeQna) throws Exception{

		PageVo pageVo = new PageVo();
		pageVo.setTotalCount(qnaListSvc.selectQnaListCnt(vo));
		pageVo.setPageNo(vo.getPageNo());
		pageVo.setPageSize(5);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("selectQnaList", qnaListSvc.selectQnaList(vo));
		map.put("pageCommon", pageVo);

		map.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_OK);
		map.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_OK);



		return map;
	}

	/**
	 * 렌탈 전문점 찾기 메인
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/specialDealerList")
	public String specialDealerList(HttpServletRequest request, HttpSession session, Model model) throws Exception {

		//시도 조회
		List<RentalOrderVo> selectSiDoList = rentalOrderSvc.selectSiDo();

		model.addAttribute("selectSiDoList"		, selectSiDoList);
		
		//10233006 GA title tag 동적 변경
		model.addAttribute("title", "렌탈 전문점 찾기 | NEXT LEVEL");

		return "/bbs/specialDealerList";
	}

	/**
	 * 렌탈 전문점 찾기 화면
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/specialDealerSearchList")
	public String specialDealerSearchList(HttpServletRequest request, HttpSession session, Model model) throws Exception {

		//시도 조회
		List<RentalOrderVo> selectSiDoList = rentalOrderSvc.selectSiDo();

		model.addAttribute("selectSiDoList"		, selectSiDoList);
		
		//10233006 GA title tag 동적 변경
		model.addAttribute("title", "렌탈 전문점 찾기 | NEXT LEVEL");
		
		return "/bbs/specialDealerSearchList";
	}

	/**
	 * 직영점 찾기 화면(O2O거점만 조회)
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/o2oSearchList")
	public String o2oSearchList(HttpServletRequest request, HttpSession session, Model model) throws Exception {

		//시도 조회
		List<RentalOrderVo> selectSiDoList = rentalOrderSvc.selectSiDo();

		model.addAttribute("selectSiDoList"		, selectSiDoList);
		
		//10233006 GA title tag 동적 변경
		model.addAttribute("title", "넥센 직영점 찾기 | NEXT LEVEL");

		return "/bbs/o2oSearchList";
	}

	/**
	 * 고객지원 > 상담하기 화면조회
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/counselRegister")
	public String counselRegister(HttpServletRequest request, Model model) throws Exception {
		UsrVo userVo = SessionUtil.getAttribute(SessionInfoUtil.SESSION_INFO_USR_VO);
		String gbn = request.getParameter("gbn");

		if(userVo != null) {
			model.addAttribute("userVo", userVo);
		}
		model.addAttribute("gbn", gbn);
		
		//10233006 GA title tag 동적 변경
		if(StringUtil.equals(gbn, "o2o")) {
			model.addAttribute("title", "구매상담하기 | NEXT LEVEL");
		}else if(StringUtil.equals(gbn, "rental")) {
			model.addAttribute("title", "렌탈상담하기 | NEXT LEVEL");
		}else {
			model.addAttribute("title", "상담하기 | NEXT LEVEL");
		}
		
		return "/bbs/counselRegister";
	}

	@RequestMapping(value="/insertRentCounsel" , method={RequestMethod.POST})
	@ResponseBody
	public Map<String, Object> insertRentCounsel(MultipartHttpServletRequest mRequest, Model model) throws Exception {
		Map<String, Object> rtn = new HashMap<String, Object>();
		RentCounselVo rentCounselVo = new RentCounselVo();

		String custNm = mRequest.getParameter("custNm");
		custNm = new String(custNm.getBytes("8859_1"),"utf-8");

		String addr = "";

		if(!StringUtils.isEmpty(mRequest.getParameter("addr"))) {
			addr = mRequest.getParameter("addr");
			addr = new String(addr.getBytes("8859_1"),"utf-8");
		}

		String mobNo = mRequest.getParameter("mobNo");
		mobNo = new String(mobNo.getBytes("8859_1"),"utf-8");

		String mcNm = mRequest.getParameter("mcNm");
		mcNm = new String(mcNm.getBytes("8859_1"),"utf-8");

		String specNm = mRequest.getParameter("specNm");
		specNm = new String(specNm.getBytes("8859_1"),"utf-8");

		String cnt = mRequest.getParameter("cnt");
		cnt = new String(cnt.getBytes("8859_1"),"utf-8");

		String zipCd = mRequest.getParameter("zipCd");
		zipCd = new String(zipCd.getBytes("8859_1"),"utf-8");

		rentCounselVo.setCustNm(custNm);
		rentCounselVo.setAddr(addr);
		rentCounselVo.setMobNo(mobNo);
		rentCounselVo.setMcNm(mcNm);
		rentCounselVo.setSpecNm(specNm);
		rentCounselVo.setCnt(cnt);
		rentCounselVo.setZipCd(zipCd);
		rentCounselVo.setContactGet("");
		if(!StringUtils.isEmpty(mRequest.getParameter("gbn")))
			rentCounselVo.setGbn(mRequest.getParameter("gbn"));
		if(!StringUtils.isEmpty(mRequest.getParameter("gubun")))
			rentCounselVo.setGubun(mRequest.getParameter("gubun"));
		if(!StringUtils.isEmpty(mRequest.getParameter("flag")))
			rentCounselVo.setJoinReq(mRequest.getParameter("flag"));
		String rs = counselSvc.insertRentCounsel(rentCounselVo);
		if("S".equals(rs)) {
			//성공일 때 리턴 형식
			rtn.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_OK);
			rtn.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_OK);
		}else {
			rtn.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_BIZ_ERROR);
			rtn.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_ERROR);
		}
		return rtn;
	}

	@RequestMapping(value="/insertRentEventCounsel" , method={RequestMethod.POST})
	@ResponseBody
	public Map<String, Object> insertRentEventCounsel(MultipartHttpServletRequest mRequest, Model model) throws Exception {
		Map<String, Object> rtn = new HashMap<String, Object>();
		RentCounselVo rentCounselVo = new RentCounselVo();

		String custNm = mRequest.getParameter("custNm");
		custNm = new String(custNm.getBytes("8859_1"),"utf-8");

		String addr = "";

		if(!StringUtils.isEmpty(mRequest.getParameter("addr"))) {
			addr = mRequest.getParameter("addr");
			addr = new String(addr.getBytes("8859_1"),"utf-8");
		}

		String mobNo = mRequest.getParameter("mobNo");
		mobNo = new String(mobNo.getBytes("8859_1"),"utf-8");

		String mcNm = mRequest.getParameter("mcNm");
		mcNm = new String(mcNm.getBytes("8859_1"),"utf-8");

		String specNm = mRequest.getParameter("specNm");
		specNm = new String(specNm.getBytes("8859_1"),"utf-8");

		String cnt = mRequest.getParameter("cnt");
		cnt = new String(cnt.getBytes("8859_1"),"utf-8");

		String zipCd = mRequest.getParameter("zipCd");
		zipCd = new String(zipCd.getBytes("8859_1"),"utf-8");

		rentCounselVo.setCustNm(custNm);
		rentCounselVo.setAddr(addr);
		rentCounselVo.setMobNo(mobNo);
		rentCounselVo.setMcNm(mcNm);
		rentCounselVo.setSpecNm(specNm);
		rentCounselVo.setCnt(cnt);
		rentCounselVo.setZipCd(zipCd);
		if(!StringUtils.isEmpty(mRequest.getParameter("gbn")))
			rentCounselVo.setGbn(mRequest.getParameter("gbn"));
		if(!StringUtils.isEmpty(mRequest.getParameter("gubun")))
			rentCounselVo.setGubun(mRequest.getParameter("gubun"));
		if(!StringUtils.isEmpty(mRequest.getParameter("flag")))
			rentCounselVo.setContactGet(mRequest.getParameter("flag"));
			//rentCounselVo.setJoinReq(mRequest.getParameter("flag"));
		String rs = counselSvc.insertRentEventCounsel(rentCounselVo);
		if("S".equals(rs)) {
			//성공일 때 리턴 형식
			rtn.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_OK);
			rtn.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_OK);
		}else {
			rtn.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_BIZ_ERROR);
			rtn.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_ERROR);
		}
		return rtn;
	}

	/**
	 * 고객지원 > 구매상담 등록
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/insertPurcCounsel" , method={RequestMethod.POST})
	@ResponseBody
	public Map<String, Object> insertPurcCounsel(MultipartHttpServletRequest mRequest, Model model) throws Exception {
		Map<String, Object> rtn = new HashMap<String, Object>();
		mRequest.setCharacterEncoding("UTF-8");

		try {
			QuestionVo questionVo = new QuestionVo();
			String title = mRequest.getParameter("title");
			title = new String(title.getBytes("8859_1"),"utf-8");

			String cont = mRequest.getParameter("cont");
			cont = new String(cont.getBytes("8859_1"),"utf-8");

			String mobNo = mRequest.getParameter("mobNo");
			mobNo = new String(mobNo.getBytes("8859_1"),"utf-8");

			String writNm = mRequest.getParameter("writNm");
			writNm = new String(writNm.getBytes("8859_1"),"utf-8");

			questionVo.setTitle(title);
			questionVo.setqCont(cont);
			questionVo.setMobNo(mobNo);
			questionVo.setWritNm(writNm);
			questionVo.setQustClsCd(mRequest.getParameter("qustClsCd"));

			//첨부이미지
			List<MultipartFile> mfl = mRequest.getFiles("bizFiles");
			List<AttfileVo> list = new ArrayList<AttfileVo>();

			try {
				list = rentalFileService.upload(mfl, WebConstants.RENTAL_FILE_PATH_ATFILE);
			} catch (Exception e) {
				rtn.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_BIZ_ERROR);
				rtn.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_ERROR);
				return rtn;
			}

			String rs = questionSvc.insertQuestion(list, questionVo);
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

}
