package com.nexwrms.mobweb.com.message.svc;


import com.nexwrms.core.message.vo.MsgVo;
import com.nexwrms.mobweb.com.vo.TitleVo;

public interface MsgSvc {
	public MsgVo selectMsg(String msgKey, String locale);

	public TitleVo selectLabel(String lablKey, String locale);

}
