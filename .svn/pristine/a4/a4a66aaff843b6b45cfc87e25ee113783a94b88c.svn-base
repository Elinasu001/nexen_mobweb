package com.nexwrms.mobweb.news.ctl;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
import com.nexwrms.cfo.com.constants.WebConstants;
import com.nexwrms.nextlevel.com.news.svc.NewsSvc;
import com.nexwrms.nextlevel.com.news.vo.NewsSearchVo;
import com.nexwrms.nextlevel.com.news.vo.NewsVo;


@Controller
@RequestMapping("/news")
public class newsCtl extends AbstractCfoSvc{

	private static final Logger logger = LoggerFactory.getLogger(newsCtl.class);
	
	
	
	@Autowired
	private NewsSvc newsSvc;
	
	
	
	/** 
	 * 타이어 팁
	 * @param request 
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/tireTipList")
	public String tireTipList(HttpServletRequest request, Model model) throws Exception {		
		String rUrl = "";

			model.addAttribute("headerCss" , "");
			model.addAttribute("viewGbn", "H");
			rUrl = "/news/newsList";
			
			//10233006 GA title tag 동적 변경
			model.addAttribute("title", "NEWS & TIP | NEXT LEVEL");
	
		return rUrl;
	}
	
	
	//공지사항 목록
	@RequestMapping("/selectTireTipList")
	@ResponseBody
	public Map<String, Object> selectTireTipList(HttpServletRequest request,@RequestBody NewsSearchVo vo , Model model
			,@RequestParam(required = false, value="searchTypeQna")String searchTypeQna) throws Exception {		
				
			
			PageVo pageVo = new PageVo();
			pageVo.setTotalCount(newsSvc.selectTireTipCnt(vo));
			pageVo.setPageNo(vo.getPageNo());
			pageVo.setPageSize(10);

				
			Map<String, Object> map = new HashMap<String, Object>();
				
			map.put("selectTireTipList", newsSvc.selectTireTipList(vo));
			map.put("pageCommon", pageVo);
				
			//성공일 때 리턴 형식 - 질문 목록 조회는 무조건 성공응로 한다.
					// 이유 : 조회가 1건이든, 0건이든 성공이기 맞는 의미이기 때문.
			map.put(WebConstants.Rtn.RETURN_CODE, WebConstants.Rtn.RETURN_CODE_OK);
			map.put(WebConstants.Rtn.RETURN_MESSEGE, WebConstants.Rtn.RETURN_MESSEGE_OK);
						
			return map;

			}
	
	
	
	@RequestMapping("/tireTipDetail")
	public String tireTipDetail(HttpServletRequest request, Model model, @RequestParam(required = true) String bdojSeq)throws Exception {
		
		NewsSearchVo searchVo = new NewsSearchVo();
		searchVo.setBdojSeq(bdojSeq);
	
		NewsVo tireTipDetailVo = newsSvc.selectTireTipDetail(searchVo);
		NewsVo tireTipPreVo = newsSvc.selectTireTipPre(searchVo);
		NewsVo tireTipPostVo = newsSvc.selectTireTipPost(searchVo);
		
		
		//tireTipDetailVo.setnCont(tireTipDetailVo.getnCont().replaceAll("(\r\n|\r|\n|\n\r)", "<br>"));
		
		model.addAttribute("tireTipDetailVo", tireTipDetailVo);
		model.addAttribute("tireTipPreVo", tireTipPreVo);
		model.addAttribute("tireTipPostVo", tireTipPostVo);
		
		return "/news/newsDetail";
	}
	
	
	
}
