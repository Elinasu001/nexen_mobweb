package com.nexwrms.mobweb.com.svc;

import java.util.List;

import com.nexwrms.mobweb.com.vo.TitleVo;


/**
 * @Class Name : TitleSvc.java
 * @Description : 언어 별 타이틀
 * @Modification Information  
 * @
 * @ Date            Author       Description
 * @ -------------  -----------  -------------
 * @ 2018. 10. 02.    박유진		  최초 생성
 * 
 */
public interface TitleSvc {
	
	/**
	 * 언어별 타이틀 목록을 조회 한다.
	 * @author 박유진
	 * @param String
	 * @return List<TitleVo>
	 */
	public List<TitleVo> selectAllList(String usrLocale) throws Exception ;
	
	
	
}
