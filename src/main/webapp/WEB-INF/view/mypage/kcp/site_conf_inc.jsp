<%@ page import="com.nexwrms.cfo.com.constants.WebConstants" %>
<%@ page import="com.nexwrms.core.context.AppContext" %>

<%
    /* ============================================================================== */
    /* =   PAGE : 결제 정보 환경 설정 PAGE                                          = */
    /* =----------------------------------------------------------------------------= */
    /* =   연동시 오류가 발생하는 경우 아래의 주소로 접속하셔서 확인하시기 바랍니다.= */
    /* =   접속 주소 : http://kcp.co.kr/technique.requestcode.do			        = */
    /* =----------------------------------------------------------------------------= */
    /* =   Copyright (c)  2013   KCP Inc.   All Rights Reserverd.                   = */
    /* ============================================================================== */

    /* ============================================================================== */
    /* = ※ 주의 ※                                                                 = */
    /* = * 지불 데이터 설정                                                         = */
    /* =----------------------------------------------------------------------------= */
    /* = ※ 주의 ※                                                                 = */
	/* = * g_conf_home_dir 변수 설정                                                = */
    /* =   BIN 절대 경로 입력 (bin전까지 설정)                                      = */
    /* =                                                                            = */
    /* = * g_conf_key_dir 변수 설정                                                 = */
    /* =   pub.key 파일의 절대 경로 설정(파일명을 포함한 경로로 설정)               = */
    /* =                                                                            = */
    /* = * g_conf_log_dir 변수 설정                                                 = */
    /* =   log 디렉토리 설정                                                        = */
    /* ============================================================================== */

    String sUrl = request.getRequestURL().toString();
    sUrl = sUrl.toLowerCase();

    String g_conf_home_dir  = AppContext.getString(WebConstants.KCP_RENTAL_KEY_FILE);// BIN 절대경로 입력 (bin전까지)

    /* if(sUrl.indexOf("dev.tirerental.co.kr")!=-1){
   		//개발
    	g_conf_home_dir  = "C:\\WebApps\\NEXEN_EBIZ\\ROOT\\KCP";
    }else if(sUrl.indexOf("localhost")!=-1){
		//로컬호스트
   		g_conf_home_dir  = "E:\\backup\\04_Eclipse\\Projects_NEXTNTIRE\\nexen_ebiz\\src\\main\\webapp\\KCP";
	}else if(sUrl.indexOf("192.168.1.2")!=-1){
		//로컬호스트
   		g_conf_home_dir  = "E:\\backup\\04_Eclipse\\Projects_NEXTNTIRE\\nexen_ebiz\\src\\main\\webapp\\KCP";
	}else{
		//운영
		g_conf_home_dir  = "C:\\WebApps\\NEXEN_EBIZ\\ROOT\\KCP";
	} */

    String g_conf_key_dir   = g_conf_home_dir + "\\pub.key";                                  // 공개키 파일 절대경로
    String g_conf_log_dir   = g_conf_home_dir + "\\log";                                           // LOG 디렉토리 절대경로 입력

    System.out.println("@@@ g_conf_home_dir >>>>" + g_conf_home_dir);
    System.out.println("@@@ g_conf_key_dir >>>>" + g_conf_key_dir);
    System.out.println("@@@ g_conf_log_dir >>>>" + g_conf_log_dir);


   	/* ============================================================================== */
    /* = ※ 주의 ※                                                                 = */
    /* = * g_conf_gw_url 설정                                                       = */
    /* =----------------------------------------------------------------------------= */
    /* = 테스트 시 : testpaygw.kcp.co.kr로 설정해 주십시오.                         = */
    /* = 실결제 시 : paygw.kcp.co.kr로 설정해 주십시오.                             = */
    /* ============================================================================== */

    String g_conf_gw_url = AppContext.getString(WebConstants.KCP_RENTAL_CANCEL_GW_URL);

    System.out.println("@@@ g_conf_gw_url >>>>" + g_conf_gw_url);

/*
	if(sUrl.indexOf("dev.tirerental.co.kr")!=-1){
		//개발
		g_conf_gw_url = "testpaygw.kcp.co.kr";
	}else if(sUrl.indexOf("localhost")!=-1){
		//로컬
		g_conf_gw_url = "testpaygw.kcp.co.kr";
	}else if(sUrl.indexOf("192.168.1.2")!=-1){
		//로컬
		g_conf_gw_url = "testpaygw.kcp.co.kr";
	}else{
		//운영
		g_conf_gw_url = "paygw.kcp.co.kr";
	}
 */
    //운영
    //String g_conf_gw_url    = "paygw.kcp.co.kr";
    /* ============================================================================== */
    /* = ※ 주의 ※                                                                 = */
    /* = * g_conf_js_url 설정                                                       = */
    /* =----------------------------------------------------------------------------= */
	/* = 테스트 시 : src="http://pay.kcp.co.kr/plugin/payplus_test.js"              = */
	/* =             src="https://pay.kcp.co.kr/plugin/payplus_test.js"             = */
    /* = 실결제 시 : src="http://pay.kcp.co.kr/plugin/payplus.js"                   = */
	/* =             src="https://pay.kcp.co.kr/plugin/payplus.js"                  = */
    /* =                                                                            = */
	/* = 테스트 시(UTF-8) : src="http://pay.kcp.co.kr/plugin/payplus_test_un.js"    = */
	/* =                    src="https://pay.kcp.co.kr/plugin/payplus_test_un.js"   = */
    /* = 실결제 시(UTF-8) : src="http://pay.kcp.co.kr/plugin/payplus_un.js"         = */
	/* =                    src="https://pay.kcp.co.kr/plugin/payplus_un.js"        = */
    /* ============================================================================== */

    String g_conf_js_url = AppContext.getString(WebConstants.KCP_RENTAL_CONF_JS_URL);

    System.out.println("@@@ g_conf_js_url >>>>" + g_conf_js_url);

/*     if(sUrl.indexOf("dev.tirerental.co.kr")!=-1){
    	g_conf_js_url = "https://pay.kcp.co.kr/plugin/payplus_test_un.js";
    }else if(sUrl.indexOf("localhost")!=-1){
		g_conf_js_url = "http://pay.kcp.co.kr/plugin/payplus_test_un.js";
	}else if(sUrl.indexOf("192.168.1.2")!=-1){
		g_conf_js_url = "http://pay.kcp.co.kr/plugin/payplus_test_un.js";
	}else{
    	//운영
    	g_conf_js_url = "https://pay.kcp.co.kr/plugin/payplus_un.js";
	}
 */




    /* ============================================================================== */
    /* = 스마트폰 SOAP 통신 설정                                                    = */
    /* =----------------------------------------------------------------------------= */
    /* = 테스트 시 : false                                                          = */
    /* = 실결제 시 : true                                                           = */
    /* ============================================================================== */
    //개발
    boolean g_conf_server    = false;

  	//운영
    //boolean g_conf_server    = false;

    /* ============================================================================== */
    /* = g_conf_site_cd, g_conf_site_key 설정                                       = */
    /* = 실결제시 KCP에서 발급한 사이트코드(site_cd), 사이트키(site_key)를 반드시   = */
    /* = 변경해 주셔야 결제가 정상적으로 진행됩니다.                                = */
    /* =----------------------------------------------------------------------------= */
    /* = 테스트 시 : 사이트코드(T0000)와 사이트키(3grptw1.zW0GSo4PQdaGvsF__)로      = */
    /* =            설정해 주십시오.                                                = */
	/* = 에스크로 테스트 시: 사이트코드(T0007)와 사이트키(4Ho4YsuOZlLXUZUdOxM1Q7X__)= */
    /* =            설정해 주십시오.                                                = */
    /* = 실결제 시 : 반드시 KCP에서 발급한 사이트코드(site_cd)와 사이트키(site_key) = */
    /* =            로 설정해 주십시오.                                             = */
    /* ============================================================================== */
    //개발
    //String g_conf_site_cd   = "T0007";
    //String g_conf_site_key  = "4Ho4YsuOZlLXUZUdOxM1Q7X__";
    //운영
    //String g_conf_site_cd   = "V3770";
    //String g_conf_site_key  = "4Ho4YsuOZlLXUZUdOxM1Q7X__";


    String g_conf_site_cd   = AppContext.getString(WebConstants.KCP_RENTAL_SITE_CD);
    String g_conf_site_key  = AppContext.getString(WebConstants.KCP_RENTAL_SITE_KEY);

    System.out.println("@@@ g_conf_site_cd >>>>" + g_conf_site_cd);
    System.out.println("@@@ g_conf_site_key >>>>" + g_conf_site_key);

/*
    if(sUrl.indexOf("dev.tirerental.co.kr")!=-1){
    	//테스트
    	g_conf_site_cd   = "T0007";
  		g_conf_site_key  = "4Ho4YsuOZlLXUZUdOxM1Q7X__";
    }else if(sUrl.indexOf("localhost")!=-1){
    	//테스트
    	g_conf_site_cd   = "T0007";
  		g_conf_site_key  = "4Ho4YsuOZlLXUZUdOxM1Q7X__";
	}else if(sUrl.indexOf("192.168.1.2")!=-1){
		//테스트
    	g_conf_site_cd   = "T0000";
  		g_conf_site_key  = "3grptw1.zW0GSo4PQdaGvsF__";
	}else{
		//운영
    	//g_conf_site_cd   = "V3770";
        //g_conf_site_key  = "3FM2ZnwqwDyearbFl8-ns6F__";
	} */





    /* ============================================================================== */
    /* = g_conf_site_name 설정                                                      = */
    /* =----------------------------------------------------------------------------= */
    /* = 사이트명 설정(한글 불가) : 반드시 영문자로 설정하여 주시기 바랍니다.       = */
    /* ============================================================================== */
    //개발
    //String g_conf_site_name = "";
  	//운영
    //String g_conf_site_name = "KCP TEST SHOP";

  	String g_conf_site_name = AppContext.getString(WebConstants.KCP_RENTAL_SITE_NAME);

  	/* if(sUrl.indexOf("dev.tirerental.co.kr")!=-1){
        //테스트
		g_conf_site_name = "KCP TEST SHOP";
  	}else if(sUrl.indexOf("localhost")!=-1){
        //테스트
		g_conf_site_name = "KCP TEST SHOP";
	}else if(sUrl.indexOf("192.168.1.2")!=-1){
		//테스트
		g_conf_site_name = "KCP TEST SHOP";
	}else{
		g_conf_site_name = "NEXT LEVEL";
	} */


	System.out.println("@@@ g_conf_site_name >>>>" + g_conf_site_name);




    /* ============================================================================== */
    /* = 지불 데이터 셋업 (변경 불가)                                               = */
    /* ============================================================================== */
    String g_conf_log_level = "3";
    String g_conf_gw_port   = "8090";        // 포트번호(변경불가)
	String module_type      = "01";          // 변경불가
    int    g_conf_tx_mode   = 0;             // 변경불가
%>
