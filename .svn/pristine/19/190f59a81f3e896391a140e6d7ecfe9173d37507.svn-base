<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

    <link rel="stylesheet" type="text/css" href="/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="/css/fontawesome_all.css">
        <link rel="stylesheet" type="text/css" href="/css/calc_style.css">

    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900" rel="stylesheet">
    
    <link rel="stylesheet" href="/css/calc_common.css" media="all">
    <link rel="stylesheet" href="/css/calc_common.s.css" media="all and (max-width:768px)">
    <link rel="stylesheet" href="/css/calc_custom.css" media="all">
    <link rel="stylesheet" href="/css/calc_custom.m.css" media="all and (max-width:1199px)">
    <link rel="stylesheet" href="/css/calc_custom.s.css" media="all and (max-width:991px)">
    <link rel="stylesheet" href="/css/calc_custom.xs.css" media="all and (max-width:767px)">
    

    <script type="text/javascript" src="/js/lib/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="/js/lib/bootstrap.js"></script>
    <script type="text/javascript" src="/js/lib/vue.js"></script>
    





    <div class="wrapper" id="rentalCalc">
        
        <!-- main start -->
        
        <!-- 본문 시작 -->
        
        <div class="banner rental-banner">
            <div class="container">
                <div class="contents">
                    <p>국내 최초 신개념 타이어 렌탈 서비스</p>
                    <h1>
                        내 차에 맞는 타이어 렌탈료를 <br>
                        간편하게 확인하세요.
                    </h1>
                </div>
            </div>
        </div>
        
        <section  id="step01" class="default rental-section" v-if="now_step == 1">
            <div class="container" >
                
                
                <div class="default-title">
                    <h2>차종선택</h2>
                </div>
                <div class="contents" >
                    
                    <div class="row">
                        <div class="col-sm-offset-2 col-sm-8">
                            <div class="row">
                                
                                <div class="col-xs-4" v-for="car in pool.cartype_table">
                                    <div class="cards" v-on:click="setCarType">
                                        <label>
                                            <div class="row">
                                                <p class="col-sm-12">
                                                    <input type="radio" name="car_type" v-bind:value="'type'+car.id" v-model="pick.cartype">
                                                    <span>{{ car.label }}</span>
                                                </p>
                                                <div class="col-sm-12">
                                                    <img v-bind:src="'/img/calc/car_type'+car.id+'.png'" class="img-responsive mg-auto">
                                                </div>
                                            </div>
                                        </label>
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12">
                            <button type="submit" class="btn default-btn">확인</button>
                        </div>
                    </div>
                    
                </div> 
            </div>
        </section> <!-- STEP01 -->
        
        <section  id="step02" v-if="now_step == 2" class="default rental-form-section" >
            <div class="container" >
                
                <div class="contents">
                    <%-- 
                    <div class="form-group">
                        <div class="clearfix">
                            <label for="rental_count" class="col-sm-2  control-label">차종</label>
                            <div class="col-sm-10 ">
                                <label v-for="car in pool.cartype_table" class="radio-inline custom-radio" v-on:click="pick.rental_inch=''">
                                    <input type="radio" name="rental_car_type" v-bind:value="'type'+car.id" v-model="pick.cartype">
                                    <span>{{ car.label }}</span>
                                </label>
                            </div>
                        </div>
                    </div> --%>
                    
                    
                    <div class="form-group">
                        <div class="clearfix">
                            <label for="rental_count" class="col-sm-2  control-label">렌탈수량</label>
                            <div class="col-sm-10 ">
                                <label v-for="item in pool.rental_count "   class="radio-inline custom-radio"  >
                                    <input type="radio" name="rental_count" v-bind:value="item.id" v-model="pick.rental_count" >
                                    <span>{{item.label}}</span>
                                </label>
                            </div>
                        </div>
                    </div>
                    
                    
                    <div class="form-group">
                        <div class="clearfix">
                            <label for="rental_month" class="col-sm-2  control-label">렌탈기간</label>
                            <div class="col-sm-10 ">
                                
                                <label v-for="(item, index) in pool.price_table[ pick.rental_count ] "   class="radio-inline custom-radio">
                                    <input type="radio" name="rental_month" v-bind:value="index" v-model="pick.rental_month">
                                    <span>{{index}}개월</span>
                                </label>
                                
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="clearfix">
                            <label for="rental_amount" class="col-sm-2  control-label">렌탈등록비</label>
                            <div class="col-sm-10 ">
                                <div class="rental_amount_show_box"><span id="rental_amount_show">{{pool.rental_amount_table[pick.rental_count] | formatNumber}}</span>원 <span class="text-black">(등록비면제 프로모션 진행중)</span></div>
                                
                                <div class="hidden">
                                    <label class="radio-inline custom-radio">
                                        <input type="radio" name="rental_amount" value="0">
                                        <span>분납(<span class="rental_amount_month">36</span>개월)</span>
                                    </label>
                                    <label class="radio-inline custom-radio">
                                        <input type="radio" name="rental_amount" value="1" checked="">
                                        <span>일시납(익월 청구)</span>
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="clearfix">
                            <label for="rental_grade" class="col-sm-2  control-label">
                                타이어 등급
                                <span>
                                    <i class="fas fa-question-circle"></i>
                                    <img src="/img/calc/rental-form-img2.png" alt="">
                                </span>
                            </label>
                            <div class="col-sm-10 ">
                                
                                <label v-for="(item, index) in pool.inch_table[pick.cartype]"   class="radio-inline custom-radio" v-on:click="pick.rental_inch=''">
                                    <input type="radio" name="rental_grade" v-bind:value="index" v-model="pick.rental_grade">
                                    <span>{{index}}</span>
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="clearfix">
                            <label for="rental_inch" class="col-sm-2  control-label">
                                타이어 규격
                                <span>
                                    <i class="fas fa-question-circle"></i>
                                    <img src="/img/calc/rental-form-img1.png" alt="">
                                </span>
                            </label>
                            <div class="col-sm-10 ">
                                <div id="rental_inch_contents">
                                    
                                    <label v-for="item in pool.inch_labels"   class="radio-inline custom-radio">
                                        <input type="radio" name="rental_inch" v-bind:value="item" v-model="pick.rental_inch"   v-bind:disabled=" !in_array( item , pool.inch_table[pick.cartype][pick.rental_grade] )">
                                        <span>{{item}}</span>
                                    </label>
                                    <!-- 
                                        <label v-for="item in pool.inch_table[pick.cartype][pick.rental_grade]"   class="radio-inline custom-radio">
                                            <input type="radio" name="rental_inch" v-bind:value="item" v-model="pick.rental_inch">
                                            <span>{{item}}</span>
                                        </label> 
                                    -->
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="clearfix">
                            <label for="card_type" class="col-sm-2  control-label">제휴카드</label>
                            <div class="col-sm-10 ">
                                <div class="select-inline">
                                    <select name="card_type" id="card_type" class="form-control" v-model="pick.card_type" v-on:change="pick.month_amount=''">
                                        <option value="" selected>카드 종류 선택</option>
                                        <option value="">제휴카드 사용 안함</option>
                                        <option  v-for="(item, index) in pool.card_type"   v-bind:value="index"   >{{item}}</option>
                                    </select>
                                </div>
                                <div class="select-inline">
                                    <select name="month_amount" id="month_amount" class="form-control" v-model="pick.month_amount">
                                        <option value="">월 사용액 선택</option>
                                        <option  v-for="(item, index) in pool.card_data[pick.card_type]"   v-bind:value="item[1]"   >{{item[0]}}</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group mt">
                        <div class="clearfix">
                            <label for="rental_type2" class="rental-type-contents">
                                <input type="radio" id="rental_type2" name="rental_type" value="discount" class="hidden" v-model="pick.rental_type" v-on:click="setRentalType('discount')">
                                <div>
                                    <span>알뜰<br class="visible-xs">케어</span>
                                </div>
                            </label>
                            <label for="rental_type3" class="rental-type-contents">
                                <input type="radio" id="rental_type3" name="rental_type" value="basic" class="hidden" v-model="pick.rental_type" v-on:click="setRentalType('basic')">
                                <div>
                                    <span>안심<br class="visible-xs">케어 <img src="/img/calc/recom_icon.png"> </span>
                                </div>
                            </label>
                            <label for="rental_type1" class="rental-type-contents">
                                <input type="radio" id="rental_type1" name="rental_type" value="free" class="hidden" v-model="pick.rental_type"  v-on:click="setRentalType('free')">
                                <div>
                                    <span>자유<br class="visible-xs">렌탈</span>
                                </div>
                            </label>
                            <!--
                                <label for="rental_type4" class="rental-type-contents">
                                    <input type="radio" id="rental_type4" name="rental_type" value="normal" class="hidden">
                                    <div>
                                        <span>표준<br class="visible-xs">렌탈</span>
                                    </div>
                                </label>
                                <label for="rental_type5" class="rental-type-contents">
                                    <input type="radio" id="rental_type5" name="rental_type" value="double" class="hidden">
                                    <div>
                                        <span>더블<br class="visible-xs">렌탈</span>
                                    </div>
                                </label>
                                <label for="rental_type6" class="rental-type-contents">
                                    <input type="radio" id="rental_type6" name="rental_type" value="super" class="hidden">
                                    <div>
                                        <span>슈퍼<br class="visible-xs">렌탈</span>
                                    </div>
                                </label>
                            -->
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="clearfix">
                            <div class="result-contents">
                                <div class="row">
                                    <div class="col-sm-7">
                                        
                                        <h1> {{pool.rental_type_table[pick.rental_type]['label']}} </h1>
                                        
                                        <!-- <h1 id="rental-type-obj">알뜰케어</h1> -->
                                        <div id="rental-tag">
                                            <span>타이어수량 <span id="rental-tag-count">{{pick.rental_count}}</span>본</span>
                                            <span>렌탈기간 <span id="rental-tag-month">{{pick.rental_month}}</span>개월</span>
                                        </div>
                                        <div id="default-service-tag">
                                            
                                            <p>기본 제공 서비스 <span style="color: #802a8f; font-size: 14px;">(※ 윈터, 경트럭용 타이어는 보증에서 제외됨)</span></p>
                                            
                                            <div class="inner" v-if="pick.rental_type=='free'">    <span>무상 위치 교환 1회</span><span>넥스트레벨 체크 서비스</span><span>파손 보증</span><span>조기마모보증(휠얼라인먼트1회 이상 추가시)</span></div>
                                            <div class="inner" v-if="pick.rental_type=='basic'">   <span>무상 위치 교환 1회</span><span>넥스트레벨 체크 서비스</span><span>파손 보증</span><span>무상 휠얼라인먼트 1회</span><span>조기마모 보증</span></div>
                                            <div class="inner" v-if="pick.rental_type=='discount'"><span>무상 위치 교환 1회</span><span>넥스트레벨 체크 서비스</span><span>파손 보증</span></div>
                                            
                                        </div>
                                    </div>
                                    <div class="col-sm-5">
                                        <div class="calc-chart">
                                            <dl>
                                                <dt>렌탈료</dt>
                                                <dd>
                                                    월 <span id="month_price" class="chart-price">{{price.month_price  | formatNumber}}</span>원
                                                    <p id="month_price_disc">{{price.month_price_disc}}</p>
                                                </dd>
                                            </dl>
                                            <dl>
                                                <dt>제휴카드가</dt>
                                                <dd>
                                                    <div class="n-card" v-if="pick.month_amount == '' ">제휴카드 사용 안함</div>
                                                    <div class="y-card" v-if=" !(pick.month_amount == '') " style="display: block;">
                                                        월 <span id="month_discount" class="chart-price text-danger">{{ price.month_discount | formatNumber }}</span>원
                                                        <p id="month_discount_disc">월 {{ pick.month_amount | formatNumber }}원 청구 할인 혜택</p>
                                                    </div>
                                                </dd>
                                            </dl>
                                        </div>
                                        <!--<dl>
                                            <dt>추가 렌탈료</dt>
                                            <dd>￦<span id="add_price">0</span></dd>
                                        </dl>-->
                                        <div class="calc-chart no-bg">
                                            <dl>
                                                <dt>총 납입금액</dt>
                                                <dd>
                                                    <s id="total_price_not_sale">{{ price.show_total_price | formatNumber }}원</s>
                                                    <span id="total_price" class="chart-price text-danger">{{ price.total_price | formatNumber }}</span>원
                                                    
                                                    {{ calcPrice()  }}
                                                </dd>
                                            </dl>
                                        </div>
                                        <dl class="hidden">
                                            <dt></dt>
                                            <dd>
                                                <span id="show_month">0개월</span>동안 납입하실 월 렌탈료는 <span id="show_price">0원</span>이며, <br>
                                                <span id="show_card">카드</span> 사용시 매월 <span id="show_card_discount">0원</span> 할인 받아<br>
                                                타이어 <span id="show_count">0</span>본 총 납입금액은 <span id="show_total_price">0원</span>입니다.
                                            </dd>
                                        </dl>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group add-service">
                        <h4><span>부가 서비스 추가 (자유렌탈 설계 시 선택 사항)</span></h4>
                        <div class="clearfix">
                            <div class="add-contents">
                                <div class="inner">
                                    <a href="javascript:void(0);" class="tip-contents">
                                        <img src="/img/calc/rental-tip.png" class="normal">
                                        <img src="/img/calc/rental-tip-hover.png" class="hover">
                                        <div class="hover-contents">
                                            <h1>타이어 무상 교체 서비스</h1>
                                            <h2>
                                                고객님께서 렌탈 계약하신 타이어와 <br>
                                                동일한 규격의 타이어로 무상교체해드립니다.
                                            </h2>
                                            <ul>
                                                <li><span>01</span> <div>렌탈중인 제품이 단종 될 경우 동급의 제품으로 변경되어 제공될 수 있습니다.</div></li>
                                                <li><span>02</span> <div>TPMS, 런플랫 타이어의 경우 장착점에서 추가 비용이 과금될 수 있습니다.</div></li>
                                                <li>
                                                    <span>03</span>
                                                    <div>
                                                        계약기간 내 렌탈 타이어가 마모한계선 이하의 마모진행, 주행불가능한 파손의 경우는<br>언제나 신청하실 수 있으며, 계약 종료 6개월 전 ~ 계약 만료일까지는 조건없이 신청이 가능합니다.
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                    </a>
                                    <div class="dropdown">
                                        <button class="btn btn-default btn-block dropdown-toggle" type="button" id="tire_exchange_obj" data-toggle="dropdown" aria-expanded="true" v-bind:disabled="pool.rental_type_table[pick.rental_type]['tire'] == false " >
                                            
                                            타이어 무상 교체
                                            <div class="count-box">
                                                <span>{{pick.tire_exchange}}</span>회
                                            </div>
                                            <i class="fas fa-chevron-down"></i>
                                        </button>
                                        <ul class="dropdown-menu" role="menu" aria-labelledby="tire_exchange_obj">
                                            <li role="presentation" v-for="(item, index) in range(0, pool.rental_type_table[pick.rental_type]['tire'] )"  >
                                                <label v-bind:for="'tire_exchange'+index" class="radio-inline custom-radio">
                                                    <input type="radio" v-bind:id="'tire_exchange'+index" name="tire_exchange" v-bind:value="item" v-model="pick.tire_exchange">
                                                    <span v-if="index == 0 ">해당 없음</span>
                                                    <span v-if="index != 0 ">{{item}}회 (월 {{ pool.tire_exchange_table[pick.rental_month] * item | formatNumber }}원)</span>
                                                </label>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <!--<div class="add-contents">
                                <div class="inner">
                                    <a href="javascript:void(0);" class="tip-contents">
                                        <img src="/img/rental-tip.png" class="normal">
                                        <img src="/img/rental-tip-hover.png" class="hover">
                                        <div class="hover-contents">
                                            <h1>엔진오일 교체 서비스</h1>
                                            <h2>
                                                고객님께서 렌탈 계약하신 차종에 맞는 <br>
                                                엔진오일 교체 서비스를 제공해드립니다.
                                            </h2>
                                            <ul>
                                                <li><span>01</span> <div>제공되는 엔진오일 부품(엔진오일, 오일크리너, 에어필터)는 순정이 아닌 고객님의 차종에 맞는 부품이 제공됩니다.</div></li>
                                                <li><span>02</span> <div>수입차량의 경우 부품만 제공되며 교체 공임은 교체점에서 납부하셔야 합니다. (수입차 가능 교체점 확인 필요)</div></li>
                                            </ul>
                                        </div>
                                    </a>
                                    <div class="dropdown">
                                        <button class="btn btn-default btn-block dropdown-toggle" type="button" id="engine_exchange_obj" data-toggle="dropdown" aria-expanded="true" v-bind:disabled="pool.rental_type_table[pick.rental_type]['engine'] == false ">
                                            엔진오일 교체
                                            <div class="count-box">
                                                <span>0</span>회
                                            </div>
                                            <i class="fas fa-chevron-down"></i>
                                        </button>
                                        <ul class="dropdown-menu" role="menu" aria-labelledby="engine_exchange_obj">
                                            
                                            <ul class="dropdown-menu" role="menu" aria-labelledby="engine_exchange_obj">
                                                <li role="presentation" v-for="(item, index) in range(0, pool.rental_type_table[pick.rental_type]['engine'] )"  >
                                                    <label v-bind:for="'engine_exchange'+index" class="radio-inline custom-radio">
                                                        <input type="radio" v-bind:id="'engine_exchange'+index" name="engine_exchange" v-bind:value="item" v-model="pick.engine_exchange">
                                                        <span v-if="index == 0 ">해당 없음</span>
                                                        <span v-if="index != 0 ">{{item}}회 (월 {{ pool.engine_exchange_table[pick.rental_month] * item }}원)</span>
                                                    </label>
                                                    
                                                </li>
                                            </ul>
                                            
                                        </ul>
                                    </div>
                                </div>
                            </div>-->
                            <div class="add-contents">
                                <div class="inner">
                                    <a href="javascript:void(0);" class="tip-contents">
                                        <img src="/img/calc/rental-tip.png" class="normal">
                                        <img src="/img/calc/rental-tip-hover.png" class="hover">
                                        <div class="hover-contents hover1">
                                            <h1>무상 얼라이먼트 서비스</h1>
                                            <img src="/img/calc/add-contetns3.jpg" class="img-responsive mg-auto">
                                        </div>
                                    </a>
                                    
                                    
                                    <div class="dropdown">
                                        <button class="btn btn-default btn-block dropdown-toggle" type="button" id="ali_exchange_obj" data-toggle="dropdown" aria-expanded="true" v-bind:disabled="pool.rental_type_table[pick.rental_type]['ali'] == false " >
                                            무상 얼라이먼트
                                            <div class="count-box">
                                                <span>{{pick.ali_exchange}}</span>회
                                            </div>
                                            <i class="fas fa-chevron-down"></i>
                                        </button>
                                        <ul class="dropdown-menu" role="menu" aria-labelledby="ali_exchange_obj">
                                            <li role="presentation" v-for="(item, index) in range(0, pool.rental_type_table[pick.rental_type]['ali'] )"  >
                                                
                                                <label v-bind:for="'ali_exchange'+index" class="radio-inline custom-radio">
                                                    <input type="radio" v-bind:id="'ali_exchange'+index" name="ali_exchange" v-bind:value="item" v-model="pick.ali_exchange">
                                                    <span v-if="index == 0 ">해당 없음</span>
                                                    <span v-if="index != 0 ">{{item}}회 (월 {{ pool.ali_exchange_table[pick.rental_month] * item | formatNumber }}원)</span>
                                                </label>
                                                
                                            </li>
                                        </ul>
                                    </div>
                                    
                                    
                                </div>
                            </div>
                            <div class="add-contents">
                                <div class="inner">
                                    <a href="javascript:void(0);" class="tip-contents">
                                        <img src="/img/calc/rental-tip.png" class="normal">
                                        <img src="/img/calc/rental-tip-hover.png" class="hover">
                                        <div class="hover-contents hover2">
                                            <h1>무상 위치교환 서비스</h1>
                                            <img src="/img/calc/add-contetns4.jpg" class="img-responsive mg-auto">
                                        </div>
                                    </a>
                                    <div class="dropdown">
                                        <button class="btn btn-default btn-block dropdown-toggle" type="button" id="where_exchange_obj" data-toggle="dropdown" aria-expanded="true" v-bind:disabled="pool.rental_type_table[pick.rental_type]['where'] == false " >
                                            
                                            무상 위치교환 추가
                                            <div class="count-box">
                                                <span>{{pick.where_exchange}}</span>회
                                            </div>
                                            <i class="fas fa-chevron-down"></i>
                                        </button>
                                        <ul class="dropdown-menu" role="menu" aria-labelledby="where_exchange_obj">
                                            <li role="presentation" v-for="(item, index) in range(0, pool.rental_type_table[pick.rental_type]['where'] )"  >
                                                <label v-bind:for="'where_exchange'+index" class="radio-inline custom-radio">
                                                    <input type="radio" v-bind:id="'where_exchange'+index" name="where_exchange" v-bind:value="item" v-model="pick.where_exchange">
                                                    <span v-if="index == 0 ">해당 없음</span>
                                                    <span v-if="index != 0 ">{{item}}회 (월 {{ pool.where_exchange_table[pick.rental_month] * item | formatNumber }}원)</span>
                                                </label>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="add-contents">
                                <div class="inner">
                                    <a href="javascript:void(0);" class="tip-contents">
                                        <img src="/img/calc/rental-tip.png" class="normal">
                                        <img src="/img/calc/rental-tip-hover.png" class="hover">
                                        <div class="hover-contents hover3">
                                            <h1>넥스트레벨 체크</h1>
                                            <h2>찾아가는 점검 서비스</h2>
                                            <ul class="ul1">
                                                <li><span>차량점검</span> <div>엔진오일 / 배터리 / 냉각수,부동액 / 통화장치 / 윈도우 브러시</div></li>
                                                <li><span>타이어점검</span> <div>타이어 마모, 편마모 / 타이어 손상부위 점검</div></li>
                                                <li><span>스페셜서비스</span> <div>향균 연막탈취 / 워셔액 점검, 보충 / 타이어 공기압 점검, 보충</div></li>
                                            </ul>
                                        </div>
                                    </a>
                                    <div class="dropdown">
                                        <button class="btn btn-default btn-block dropdown-toggle" type="button" id="visit_exchange_obj" data-toggle="dropdown" aria-expanded="true" v-bind:disabled="pool.rental_type_table[pick.rental_type]['visit'] == false " >
                                            넥스트레벨 체크 무상 제공
                                            <!--<div class="count-box">
                                                <span>{{pick.visit_exchange}}</span>회
                                            </div>-->
                                            <i class="fas fa-chevron-down"></i>
                                        </button>
                                        <ul class="dropdown-menu" role="menu" aria-labelledby="visit_exchange_obj">
                                            <li role="presentation" v-for="(item, index) in range(0, pool.rental_type_table[pick.rental_type]['visit'] )"  >
                                                <label v-bind:for="'visit_exchange'+index" class="radio-inline custom-radio">
                                                    <input type="radio" v-bind:id="'visit_exchange'+index" name="visit_exchange" v-bind:value="item" v-model="pick.visit_exchange">
                                                    <span v-if="index == 0 ">해당 없음</span>
                                                    <span v-if="index != 0 ">{{item}}회 (월 {{ pool.visit_exchange_table[pick.rental_month] * item | formatNumber }}원)</span>
                                                </label>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group link-wrap">
                        <div class="clearfix">
                            <a v-on:click="now_step = 3" href="javascript:;" class="default-btn btn">간편 상담 신청</a>
                        </div>
                    </div>
                    
                    
                </div>
            </div>  <!-- /STEP02 -->
            
        </section>
        <!-- 본문 끝 -->
        
        
        <section  id="step03" class="default counsel-section" v-if="now_step == 3">
            <div class="container">
                <div class="row">
                    <div class="col-sm-offset-2 col-sm-8">
                        <form action="                         " method="post" accept-charset="utf-8">
                            
                            <div class="form-group">
                                <input type="hidden" name="brd_key" value="request">
                                <input type="hidden" name="post_title" value="문의입니다.">
                                <input type="hidden" name="post_content" value="문의입니다.">
                                
                                

                                <input type="hidden" name="cartype"              v-model="pick.cartype"  /> <!-- 차종 -->
                                <input type="hidden" name="rental_count"         v-model="pick.rental_count"  /> <!-- 렌탈수량 -->
                                <input type="hidden" name="rental_month"         v-model="pick.rental_month"  /> <!-- 렌탈기간 -->
                                <input type="hidden" name="rental_amount"        v-model="pick.rental_amount"  /> <!-- 등록비 -->
                                <input type="hidden" name="rental_grade"         v-model="pick.rental_grade"  /> <!-- 타이어등급 -->
                                <input type="hidden" name="rental_inch"          v-model="pick.rental_inch"  /> <!-- 타이어규격 -->
                                <input type="hidden" name="card_type"            v-model="pick.card_type"  /> <!-- 제휴카드 -->
                                <input type="hidden" name="month_amount"         v-model="pick.month_amount"  /> <!-- 제휴카드 2 -->
                                <input type="hidden" name="rental_type"          v-model="pick.rental_type"  /> <!-- 렌탈 종류 -->
                                
                                <input type="hidden" name="tire_exchange"        v-model="pick.tire_exchange"  /> <!-- 타이어 무상교체 -->
                                <input type="hidden" name="engine_exchange"      v-model="pick.engine_exchange"  /> <!-- 엔진오일교환 -->
                                <input type="hidden" name="ali_exchange"         v-model="pick.ali_exchange"  /> <!-- 얼라이먼트 -->
                                <input type="hidden" name="where_exchange"       v-model="pick.where_exchange"  /> <!-- 위치교환 -->
                                <input type="hidden" name="visit_exchange"       v-model="pick.visit_exchange"  /> <!-- 체크서비스 -->
                                
                                <input type="hidden" name="month_price"          v-model="price.month_price"  /> <!-- 월 렌탈료 -->
                                <input type="hidden" name="month_discount"       v-model="price.month_discount"  /> <!-- 할인금액 -->
                                <input type="hidden" name="total_price_not_sale" v-model="price.total_price_not_sale"  /> <!-- 할인전 총 금액 -->
                                <input type="hidden" name="total_price"          v-model="price.total_price"  /> <!-- 할인 후 총금액 -->

                                
                                <label>
                                    <input type="checkbox" name="post_privacy" value="동의함">
                                    <span>타이어 렌탈 가입 상담을 위한 개인정보 수집 및 이용에 동의합니다.*</span>
                                </label>
                            </div>
                            <div class="form-group">
                                <div class="privacy-table-contents">
                                    <span>개인(신용)정보 수집 및 동의</span>
                                    <div class="privacy-table">
                                        <div class="row">
                                            <div class="col-xs-4">
                                                <h5>이용목적</h5>
                                                <p>넥스트레벨 가입상담</p>
                                            </div>
                                            <div class="col-xs-4">
                                                <h5>항목</h5>
                                                <p>이름, 연락처, 주소, 차종, 차량번호</p>
                                            </div>
                                            <div class="col-xs-4">
                                                <h5>보유기간</h5>
                                                <p>이용목적 달성시까지</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="privacy-table-contents">
                                    <span>개인정보 제3자 제공 및 위탁에 대한 동의</span>
                                    <div class="privacy-table">
                                        <div class="row">
                                            <div class="col-xs-4">
                                                <h5>제공기관</h5>
                                                <p>넥센타이어주식회사</p>
                                            </div>
                                            <div class="col-xs-4">
                                                <h5>제공항목</h5>
                                                <p>이름, 연락처, 주소, 차종, 차량번호</p>
                                            </div>
                                            <div class="col-xs-4">
                                                <h5>제공목적</h5>
                                                <p>넥스트레벨 가입 상담 전화</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="form-section">
                                <div>
                                    <h2>기본정보</h2>
                                </div>
                                <div class="form-group">
                                    <div class="clearfix">
                                        <label for="post_nickname" class="col-sm-2 col-xs-3 control-label">고객명 <span>*</span></label>
                                        <div class="col-sm-10 col-xs-9">
                                            <input type="text" class="form-control" name="post_nickname" id="post_nickname" placeholder="고객명을 입력해주세요">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="clearfix">
                                        <label for="post_tel" class="col-sm-2 col-xs-3 control-label">연락처 <span>*</span></label>
                                        <div class="col-sm-10 col-xs-9">
                                            <input type="text" class="form-control" name="post_tel" id="post_tel" placeholder="연락처를 입력해주세요">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="clearfix">
                                        <label for="post_where" class="col-sm-2 col-xs-3 control-label">설치지역</label>
                                        <div class="col-sm-10 col-xs-9">
                                            <input type="text" class="form-control" name="post_where" id="post_where" placeholder="예 ) 서울시 강남구">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="form-section">
                                <div>
                                    <h2>차량정보</h2>
                                </div>
                                <div class="form-group">
                                    <div class="clearfix">
                                        <label for="post_car" class="col-sm-2 col-xs-3 control-label">차량종류</label>
                                        <div class="col-sm-10 col-xs-9">
                                            <input type="text" class="form-control" name="post_car" id="post_car" placeholder="예 ) 그랜저 IG">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="clearfix">
                                        <label for="post_tire" class="col-sm-2 col-xs-3 control-label">타이어규격</label>
                                        <div class="col-sm-10 col-xs-9">
                                            <input type="text" class="form-control" name="post_tire" id="post_tire" placeholder="예 ) 18인치 or 모름 or 245 45 18">
                                        </div>
                                    </div>
                                </div>
                                <p>※ 콜센터 1855-0100 / 운영 시간 평일 09:00 ~ 18:00 (주말 및 공휴일 휴무) / 영업시간 기준 우선 접수 순으로 연락 드리겠습니다.</p>
                            </div>
                            <div class="form-section text-center">
                                <span v-on:click="formSubmit" class="btn default-btn">상담 신청하기</span>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        
        
        
    </div>  <!-- /wrapper -->
    
    <script type="text/javascript" src="/js/calc_data.js"></script>
    <script type="text/javascript" src="/js/calc_application.js"></script>
