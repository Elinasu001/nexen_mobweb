class App extends React.Component {	

	state = {
		      nowStep: '1',
		      carType: ''
		  }
	
	handler = (nowStep, carType) => {
		this.setState({
	    	nowStep: nowStep,
	    	carType: carType
        })
	}
	
	render(){
	    return (
	    		<div>
	    		{this.state.nowStep == "1" && <Step01 handler={this.handler}></Step01>}
	    		{this.state.nowStep == "2" && <Step02 state={this.state} handler={this.handler}></Step02>}
	    		</div>
	    )
	 }
}

class Step01 extends React.Component {
                            	   
	  constructor(){
	    super();
	  }
	  
	  render(){
	    return (
	    		<section  id="step01" className="default rental-section" >
		    	 <div className="container" >                
	                <div className="default-title">
	                    <h2>차종선택</h2>
	                </div>
	                <div className="contents" >
	                    <div className="row">
	                        <div className="col-sm-offset-2 col-sm-8">
	                            <div className="row" id="carType">
	                            
								{cartype_table.map((car) => (
										<div className="col-xs-4">
											<div className="cards" onClick={() => {this.props.handler("2", car.id)}}>
												<label>
													<div className="row">
														<p className="col-sm-12">
															<input type="radio" name="car_type" value={car.id}/>
															<span>{ car.label }</span>
														</p>
														<div className="col-sm-12">
				                                        	<img src={'/img/calc/' + car.imgName + '.png'} className="img-responsive mg-auto"/>
														</div>
													</div>
												</label>
											</div>
										</div>
								))}
								
								</div>
				                </div>
				            </div>
				        </div> 
				    </div>
				</section>
	    )
	 }
}

class Step02 extends React.Component {
	
	//초기화
	state = {
			rentalCount: "04",
			rentalCountName: "4본",
			rentalPeriod: "36",
			rentalPeriodName: "36개월",
			rentalAmount: "0",
			rentalAmountName: "0",
			tireGrade: "0",
			tireGradeName: "0",
			rentalInch: "0",
			rentalInchName: "0",
			monthAmount: [],
			rentalType: "discount",
			rentalTypeName: "알뜰렌탈",
			rentalFee: 0,
			rentalAmt: 0,
			rentalMonthAmt: 0,
			rentalOrgTotAmt: 0,
			rentalTotAmt: 0,
			rentalDiscountAmt: 0,
			rentalServiceAmt: 0,
			tireExchangeValue: "0",
			tireExchangeName: "0",
			tireExchangeAmt: 0,
			tireExchangeArr: [],
			aliExchangeValue: "0",
			aliExchangeName: "0",
			aliExchangeAmt: 0,
			aliExchangeArr: [],
			whereExchangeValue: "0",
			whereExchangeName: "0",
			whereExchangeAmt: 0,
			whereExchangeArr: [],
			visitExchangeValue: "0",
			visitExchangeName: "0",
			visitExchangeAmt: 0,
			visitExchangeArr: [],
			cardCd: "0",
			cardSeq: 0,
			freeServiceDisplay: "hidden",
			tireGradeArr: [],
			inchArr: [],
			enable: "false"
		  }
	
	constructor(props){
    	super(props);
	    	
    	//공통코드 조회
    	this.getCommCd(props);
	}
	
	//setstate 완료 후 호출
	componentDidUpdate(prevProps, prevState) {
	    	
		if (prevState.rentalCount !== this.state.rentalCount) {
		    //this.calcAmt();
			this.getRentalAmt();
		}
		if(prevState.rentalPeriod !== this.state.rentalPeriod){
			this.getRentalAmt();
			//console.log("this.state.rentalPeriod / 2::" + (this.state.rentalPeriod / 2));
			
		}
		if(prevState.tireGrade !== this.state.tireGrade){
			//this.calcAmt();
			this.getTireInches();
			//this.getRentalAmt();
		}
		if(prevState.rentalInch !== this.state.rentalInch){
			this.getRentalAmt();
		}
		if(prevState.rentalAmount !== this.state.rentalAmount){
			//this.calcAmt();
		}
		if(prevState.rentalDiscountAmt !== this.state.rentalDiscountAmt){
			this.calcAmt();
		}
		if(prevState.cardCd !== this.state.cardCd){
			
			//카드 디테일 정보
			this.getCardDiscountAmt();
		}
		if(prevState.rentalFee !== this.state.rentalFee){
			this.calcAmt();
		}
		if(prevState.rentalType !== this.state.rentalType){
			
		}
		if(prevState.tireExchangeValue !== this.state.tireExchangeValue){
			
			this.getServiceAmt("B00007", this.state.tireExchangeValue);
		}
		if(prevState.whereExchangeValue !== this.state.whereExchangeValue){
			
			this.getServiceAmt("B00002", this.state.whereExchangeValue);
		}
		if(prevState.aliExchangeValue !== this.state.aliExchangeValue){
			
			this.getServiceAmt("B00008", this.state.aliExchangeValue);
		}
		if(prevState.visitExchangeValue !== this.state.visitExchangeValue){
			//this.getServiceAmt("B00010", this.state.visitExchangeValue);
		}
		if(prevState.tireExchangeAmt != this.state.tireExchangeAmt){
			this.calcAmt();
		}
		if(prevState.whereExchangeAmt !== this.state.whereExchangeAmt){
			this.calcAmt();
		}
		if(prevState.aliExchangeAmt !== this.state.aliExchangeAmt){
			this.calcAmt();
		}
		if(prevState.visitExchangeAmt !== this.state.visitExchangeAmt){
			
		}
	}
	
	
	//공통코드
	getCommCd=(props)=>{
		
		var param = {classCd : props.state.carType};
	
		$.ajax({
		    url: "/rental/selectOrdAgentCommCd",
		    type: "POST",
		    cache: false,
		    data: JSON.stringify(param),
	        contentType:"application/json;charset=UTF-8",  // ajax 통신으로 보내는 타입
	        success: (data) => {
	    	   if(data.rtnCode == "0") {
	    		   
	    		   this.setState({
	   					tireGradeArr: data.gradeCdList,
	   					inchArr: data.inchList
	   		    	})
		    	} else {
		    		alert("관리자에게 문의하세요.");
		    	}
	       },		    
		    error: function (request, status, error) {
		    	alert(error);
			}
	
		});
	}
	
	//렌탈료
	getRentalAmt=()=>{
		
		//조건 중 하나라도 선택이 안되어 있으면 렌탈료 미조회
		if(this.state.rentalCount == 0 || this.state.rentalPeriod == 0 || this.state.tireGrade == 0 || this.state.rentalInch == 0){
			return;
		}
		
		var param = {cntCd : this.state.rentalCount ,  
			     periodCd : this.state.rentalPeriod , 
			     classCd : this.props.state.carType , 
			     gradeCd : this.state.tireGrade, 
			     inch: this.state.rentalInch
			    };
	
		$.ajax({
		    url: "/rental/selectOrdAgentRentalAmt",
		    type: "POST",
		    cache: false,
		    data: JSON.stringify(param),
	        contentType:"application/json;charset=UTF-8",  // ajax 통신으로 보내는 타입
	        success: (data) => {
	    	   if(data.rtnCode == "0") {
		    		if(data.rtnList.length > 0){
			    		console.log("rentalAmt::" + data.rtnList[0].AMT);
			    		
			    		this.setState({
			    			rentalFee: data.rtnList[0].AMT
			    	    	})
		    		}else{
		    			alert("렌탈료 정보를 가져오지 못했습니다.");
		    		}
		    	} else {
		    		alert("관리자에게 문의하세요.");
		    	}
	       },		    
		    error: function (request, status, error) {
		    	alert(error);
			}
	
		});
	}

	//제휴카드 할인금액
	getCardDiscountAmt=()=>{
		
		console.log("card code::" + this.state.cardCd);
		
		//초기값인경우 초기화
		if(this.state.cardCd == "CCNU"){		
			this.setState({
				monthAmount: [],
				rentalDiscountAmt: 0
		    	})
		    	
		    return;
		}
		
		var param = {cardCd : this.state.cardCd};
	
		$.ajax({
		    url: "/rental/selectOrdAgentCardAmt",
		    type: "POST",
		    cache: false,
		    data: JSON.stringify(param),
	        contentType:"application/json;charset=UTF-8",  // ajax 통신으로 보내는 타입
	        success: (data) => {
	    	   if(data.rtnCode == "0") {
		    		if(data.rtnList.length > 0){
			    		
			    		var tmpList = new Array();
			    		
			    		for(var i=0; i<data.rtnList.length; i++){
			    			var _data = new Object();
			    		
			    			_data.id = data.rtnList[i].AMT;
			    			_data.label = data.rtnList[i].gradeNm + "(" + data.rtnList[i].AMT + "원 할인)";
			    			
			    			tmpList.push(_data);
			    		}
			    		
						this.setState({
							monthAmount: tmpList
					    	})
		    		}else{
		    			alert("제휴카드 금액정보를 가져오지 못했습니다.");
		    		}
		    	} else {
		    		alert("관리자에게 문의하세요.");
		    	}
	       },		    
		    error: function (request, status, error) {
		    	alert(error);
			}
	
		});
	}
	
	//타이어인치
	getTireInches=()=>{
				
		var param = {classCd : this.props.state.carType ,  
				     periodCd : this.state.rentalPeriod,
					 cntCd : this.state.rentalCount , 
			     	 gradeCd : this.state.tireGrade,			     	 
			    };
	
		$.ajax({
		    url: "/rental/selectOrdAgentInch",
		    type: "POST",
		    cache: false,
		    data: JSON.stringify(param),
	        contentType:"application/json;charset=UTF-8",  // ajax 통신으로 보내는 타입
	        success: (data) => {
	    	   if(data.rtnCode == "0") {
			    		
		    		this.setState({
		    			inchArr: data.inchList,
	   		    	})

		    	} else {
		    		alert("관리자에게 문의하세요.");
		    	}
	       },		    
		    error: function (request, status, error) {
		    	alert(error);
			}
	
		});
	}
	
	//서비스금액
	getServiceAmt=(serviceCd, apprCnt)=>{

		//횟수가 0일때 기존 금액 * -1
		if(apprCnt == "0"){

			if(serviceCd == "B00007"){
				this.setState({
					tireExchangeAmt: this.state.tireExchangeAmt * -1
			    	})
			}else if(serviceCd == "B00008"){
				this.setState({
					aliExchangeAmt: this.state.aliExchangeAmt * -1
			    	})
			}else{
				this.setState({
					whereExchangeAmt: this.state.whereExchangeAmt * -1
			    	})
			}
			return;
		}
		
		if(this.state.rentalPeriodCd == ""){
			this.alert("렌탈기간이 설정되지 않았습니다.");
			return;
		}
		
		//렌탈료가 조회된 경우에만 서비스금액 조회
		if(this.state.rentalFee == 0){
			return;
		}
		
		var param = {serviceCd : serviceCd ,  
					 periodCd : this.state.rentalPeriod , 
			     	 apprCnt : Number(apprCnt),
			    };
	
		$.ajax({
		    url: "/rental/selectOrdAgentServiceAmt",
		    type: "POST",
		    cache: false,
		    data: JSON.stringify(param),
	        contentType:"application/json;charset=UTF-8",  // ajax 통신으로 보내는 타입
	        success: (data) => {
	    	   if(data.rtnCode == "0") {
		    		if(data.rtnList.length > 0){
			    		console.log("service amt::" + data.rtnList[0].AMT);
			    		
			    		switch(serviceCd){
						case "B00007": 
							this.setState({
								tireExchangeAmt: data.rtnList[0].AMT
						    	})
							break;
						case "B00002": 
							this.setState({
								whereExchangeAmt: data.rtnList[0].AMT
						    	})
							break;
						case "B00008": 
							this.setState({
								aliExchangeAmt: data.rtnList[0].AMT
						    	})
							break;
						}
			    		
		    		}else{
		    			alert("서비스금액 정보를 가져오지 못했습니다.");
		    		}
		    	} else {
		    		alert("관리자에게 문의하세요.");
		    	}
	       },		    
		    error: function (request, status, error) {
		    	alert(error);
			}
	
		});
	}

	calcAmt=()=>{
		
		var rentalFee = this.state.rentalFee;
		var rentalDiscountAmt = this.state.rentalDiscountAmt;
		var rentalServiceAmt = 0;
		
		var visitServiceAmt = this.state.visitExchangeAmt;
		var aliServiceAmt = this.state.aliExchangeAmt;
		var whereServiceAmt = this.state.whereExchangeAmt;
		var tireServiceAmt = this.state.tireExchangeAmt;
		
		console.log("visitServiceAmt::" + visitServiceAmt);
		console.log("aliServiceAmt::" + aliServiceAmt);
		console.log("whereServiceAmt::" + whereServiceAmt);
		console.log("tireServiceAmt::" + tireServiceAmt);
		
		rentalServiceAmt = visitServiceAmt + aliServiceAmt + whereServiceAmt + tireServiceAmt;
		
		var rentalAmt = 0;
		
		//부가서비스 금액을 초기화하는 경우
		if(rentalServiceAmt < 0){
			rentalAmt = this.state.rentalAmt + rentalServiceAmt;
		}else{
			rentalAmt = rentalFee + rentalServiceAmt;
		}
		
		var rentalMonthAmt = rentalAmt - rentalDiscountAmt;
		
		//제휴카드가가 0보다 작으면 0원 처리
		if(rentalMonthAmt < 0) rentalMonthAmt = 0;
		
		var rentalOrgTotAmt = rentalAmt * this.state.rentalPeriod;
		var rentalTotAmt = rentalMonthAmt * this.state.rentalPeriod;
		
		this.setState({
			rentalFee: rentalFee,
			rentalAmt: rentalAmt,
			rentalMonthAmt: rentalMonthAmt,
			rentalOrgTotAmt: rentalOrgTotAmt,
			rentalTotAmt: rentalTotAmt,
			rentalDiscountAmt: rentalDiscountAmt,
			rentalServiceAmt: rentalServiceAmt
	    	})
	}

	handler = (event, id) => {
		
		var difficult_tasks = [];
		
		console.log("handler::" + event.target.value);
		
		if(id == "rentalCount"){
			
			var tmpList = new Array();
			for(var i=0; i<=event.target.value / 2; i++){
				var _data = new Object();
				_data.id = i;
				
				if(i == 0){
					_data.label = "해당없음";
				}else{
					_data.label = i;
				}
				
				tmpList.push(_data);
			}
			
			this.setState({
		    	rentalCount: event.target.value,
		    	rentalCountName: event.target.attributes["data-label"].value,
		    	tireExchangeArr: tmpList
		    	})
		    
		    //this.calcAmt();
		}else if(id == "rentalPeriod"){
			
			var check_count = this.state.rentalPeriod / 2;
			
			var tmpList = new Array();
			var _data = new Object();
			_data.id = "0";
			_data.label = "해당없음";
			tmpList.push(_data);
			
			_data = new Object();
			_data.id = check_count;
			_data.label = check_count;
			tmpList.push(_data);
			
			this.setState({
		    	rentalPeriod: event.target.value,
		    	rentalPeriodName: event.target.attributes["data-label"].value,
		    	visitExchangeValue: event.target.value / 2,
		    	visitExchangeName: event.target.value / 2,
		    	visitExchangeArr: tmpList
		    	})
		    	
		    //this.calcAmt();
		}else if(id == "rentalAmount"){
			this.setState({
		    	rentalAmount: event.target.value,
		    	rentalAmountName: event.target.attributes["data-label"].value
		    	})
		    	
		}else if(id == "tireGrade"){
			this.setState({
		    	tireGrade: event.target.value,
		    	tireGradeName: event.target.attributes["data-label"].value
		    	})
		    	
		}else if(id == "rentalInch"){
			this.setState({
		    	rentalInch: event.target.value,
		    	rentalInchName: event.target.attributes["data-label"].value
		    	})
		    	
		}else if(id == "monthAmount"){
			
			this.setState({
				rentalDiscountAmt: event.target.value
		    	})
		    	
		}else if(id == "rentalType"){

			//본수에 따른 무상교체 서비스 세팅
			var tmpList = new Array();
			for(var i=0; i<=this.state.rentalCount / 2; i++){
				var _data = new Object();
				_data.id = i;
				
				if(i == 0){
					_data.label = "해당없음";
				}else{
					_data.label = i;
				}
				
				tmpList.push(_data);
			}
		    	
			var rentalTypeName = "";
			var freeServiceDisplay = "hidden";
			var whereExchangeValue = "0";
			var whereExchangeName = "0";
			var aliExchangeValue = "0";
			var aliExchangeName = "0";
			var enable = "false";
		    	
			switch(event.target.value){
			case "discount": 
				rentalTypeName = "알뜰렌탈";
				freeServiceDisplay = "hidden";
				whereExchangeValue = "1";
				whereExchangeName = "1";
				enable = "false";
				break;
			case "basic": 
				rentalTypeName = "안심케어";
				freeServiceDisplay = "hidden";
				whereExchangeValue = "1";
				whereExchangeName = "1";
				aliExchangeValue = "1";
				aliExchangeName = "1";
				enable = "false";
				break;
			case "free": 
				rentalTypeName = "자유렌탈";
				freeServiceDisplay = "visible";
				enable = "true";
				break;
			}
			
			this.setState({
				freeServiceDisplay: freeServiceDisplay,
		    	rentalType: event.target.value,
		    	rentalTypeName: rentalTypeName,
		    	tireExchangeAmt: 0,
		    	whereExchangeAmt: 0,
		    	aliExchangeAmt: 0,
		    	visitExchangeAmt: 0,
		    	tireExchangeValue: "0",
		    	whereExchangeValue: whereExchangeValue,
		    	aliExchangeValue: aliExchangeValue,
		    	visitExchangeValue: this.state.rentalPeriod / 2,
		    	tireExchangeName: "0",
		    	whereExchangeName: whereExchangeName,
		    	aliExchangeName: aliExchangeName,
		    	visitExchangeName: this.state.rentalPeriod / 2,
		    	enable: enable,
		    	tireExchangeArr: tmpList
		    	})
		    	
		}else if(id == "visit_exchange"){
			
			this.setState({
				visitExchangeValue: event.target.value,
				visitExchangeName: event.target.attributes["data-label"].value
		    	})
		    	
	    }else if(id == "ali_exchange"){
	    	
			this.setState({
				aliExchangeValue: event.target.value,
				aliExchangeName: event.target.attributes["data-label"].value
		    	})
		    	
	    }else if(id == "where_exchange"){
	    	
			this.setState({
				whereExchangeValue: event.target.value,
				whereExchangeName: event.target.attributes["data-label"].value
		    	})
		    	
	    }else if(id == "tire_exchange"){
	    	
			this.setState({
				tireExchangeValue: event.target.value,
				tireExchangeName: event.target.attributes["data-label"].value
		    	})

	    }else if(id == "cardType"){
			
			this.setState({
				cardCd: event.target.value,
				monthAmount: difficult_tasks
		    	})
		}
	}
	
	render(){
	    	
	    return (
				<section  id="step02" className="default rental-form-section" >
	            <div className="container" >
	                
	                <div className="contents">
	                	<div className="form-group">
	                		<div className="clearfix">
	                			<div className="col-sm-10">
	                				<a className="btn btn-default" onClick={(e) => {this.props.handler("1", "")}}>
	                					<i className="fas fa-angle-left"></i><span> &nbsp;&nbsp; 뒤로가기</span>
	                				</a>
	                			</div>
	                		</div>
	                	</div>
	                    <div className="form-group">
	                        <div className="clearfix">
	                            <label for="rental_count" className="col-sm-2  control-label">렌탈수량</label>
	                            <div className="col-sm-10 " id="rentalCount">
	                              
	                            	<RadioGroup datas={rental_count_table} name={"rental_count"} id={"rentalCount"} defaultValue={this.state.rentalCount} handler={this.handler}></RadioGroup>
	                              
	                            </div>
	                        </div>
	                    </div>
	                    <div className="form-group">
	                        <div className="clearfix">
	                            <label for="rental_month" className="col-sm-2  control-label">렌탈기간</label>
	                            <div className="col-sm-10 " id="rentalPeriod">
	                               
	                               <RadioGroup datas={rental_period_table} name={"rental_period"} id={"rentalPeriod"}  defaultValue={this.state.rentalPeriod}  handler={this.handler}></RadioGroup>
	                               
	                            </div>
	                        </div>
	                    </div>
	                    <div className="form-group">
	                        <div className="clearfix">
	                            <label for="rental_amount" className="col-sm-2  control-label">렌탈등록비</label>
	                            <div className="col-sm-10 " id="rentalAmount">
	                            
	                            <div className="rental_amount_show_box">
	                        		{this.state.rentalCount == "02" && <span id="rental_amount_show">25,000원</span>} 
	                        		{this.state.rentalCount == "04" && <span id="rental_amount_show">50,000원</span>} 
	                        		<span className="text-black">(등록비면제 프로모션 진행중)</span>
                        		</div>
	                            	
	                            </div>
	                        </div>
	                    </div>
	                    <div className="form-group">
	                        <div className="clearfix">
	                            <label for="rental_grade" className="col-sm-2  control-label">
	                                타이어 등급
	                                <span>
	                                    <i className="fas fa-question-circle"></i>
	                                    <img src="/img/calc/rental-form-img2.png" alt=""/>
	                                </span>
	                            </label>
	                            <div className="col-sm-10 " id="tireGrade">
	                            
	                                <RadioGroup datas={this.state.tireGradeArr} name={"tireGrade"} id={"tireGrade"}  defaultValue={this.state.tireGrade}  handler={this.handler}></RadioGroup>
	                                
	                            </div>
	                        </div>
	                    </div>
	                    <div className="form-group">
	                        <div className="clearfix">
	                            <label for="rental_inch" className="col-sm-2  control-label">
	                                타이어 규격
	                                <span>
	                                    <i className="fas fa-question-circle"></i>
	                                    <img src="/img/calc/rental-form-img1.png" alt=""/>
	                                </span>
	                            </label>
	                            <div className="col-sm-10 ">
	                                <div id="rental_inch_contents">
	                                
	                                	<RadioGroup datas={this.state.inchArr} name={"rental_inch"} id={"rentalInch"}  defaultValue={this.state.rentalInch}   handler={this.handler}></RadioGroup>
	                                
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                    <div className="form-group">
	                        <div className="clearfix">
	                            <label for="card_type" className="col-sm-2  control-label">제휴카드</label>
	                            <div className="col-sm-10 ">
	                                <div className="select-inline" id="card_type">     
	                                
	                                        <SELECT name={"card_type"} id={"cardType"} datas={card_type} nullText={"카드 종류 선택"} handler={this.handler}></SELECT>
	                                        
	                                </div>
	                                <div className="select-inline" id="month_amount">	  
	                                    	
	                                    	<SELECT name={"month_amount"} id={"monthAmount"} datas={this.state.monthAmount} nullText={"월 사용액 선택"} handler={this.handler}></SELECT>
	                                    	
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                    
	                    <CalcDetailView state={this.state} handler={this.handler}></CalcDetailView>
	                    
	                </div>
	            </div>	            
	        </section>
	    )
	 }
}

class CalcDetailView extends React.Component {
	
	componentDidMount(){

		//초기값:알뜰렌탈
		document.getElementById('rental_type2').click();
	}
	
	render(){
		return (
				<div>
				<div className="form-group mt">
                <div className="clearfix">
                    <label for="rental_type2" className="rental-type-contents">
                        <input type="radio" id="rental_type2" name="rental_type" value="discount" className="hidden" onClick={(e) => {this.props.handler(e, "rentalType")}}/>
                        <div>
                            <span>알뜰<br className="visible-xs">케어</br></span>
                        </div>
                    </label>
                    <label for="rental_type3" className="rental-type-contents">
                        <input type="radio" id="rental_type3" name="rental_type" value="basic" className="hidden" onClick={(e) => {this.props.handler(e, "rentalType")}}/>
                        <div>
                            <span>안심<br className="visible-xs">케어 <img src="/img/calc/recom_icon.png"/></br></span>
                        </div>
                    </label>
                    <label for="rental_type1" className="rental-type-contents">
                        <input type="radio" id="rental_type1" name="rental_type" value="free" className="hidden" onClick={(e) => {this.props.handler(e, "rentalType")}}/>
                        <div>
                            <span>자유<br className="visible-xs">렌탈</br></span>
                        </div>
                    </label>
                </div>
                </div>
            
				<div className="form-group">
                <div className="clearfix">
                    <div className="result-contents">
                        <div className="row">
                            <div className="col-sm-7">
                                <h1> {this.props.state.rentalTypeName}</h1>
                                <div id="rental-tag">
                                	{this.props.state.rentalCount != "0" && <span>타이어수량 <span id="rental-tag-count">&nbsp;{this.props.state.rentalCountName}</span></span>}
                                	{this.props.state.rentalPeriod != "0" && <span>렌탈기간 <span id="rental-tag-month">&nbsp;{this.props.state.rentalPeriodName}</span></span>}
                                	{this.props.state.tireGrade != "0" && <span>타이어등급 <span id="rental-tag-grade">&nbsp;{this.props.state.tireGradeName}</span></span>}
                                	{this.props.state.rentalInch != "0" && <span>타이어규격 <span id="rental-tag-inch">&nbsp;{this.props.state.rentalInchName + "인치"}</span></span>}
                                	{this.props.state.rentalAmount == "0" && <span>렌탈등록비 일시납(면제)</span>}
                                </div>
                                <div id="default-service-tag">
                                    <p>기본 제공 서비스 <span style={{ "color":'#802a8f', "font-size":'14px' }}>(※ 윈터, 경트럭용 타이어는 보증에서 제외됨)</span></p>
                                    {this.props.state.rentalType == "free" && <div className="inner" ><span>무상 위치 교환 1회</span><span>넥스트레벨 체크 서비스</span><span>파손 보증</span><span>조기마모보증(휠얼라인먼트1회 이상 추가시)</span></div>}
                                    {this.props.state.rentalType == "basic" && <div className="inner" ><span>무상 위치 교환 1회</span><span>넥스트레벨 체크 서비스</span><span>파손 보증</span><span>조기마모 보증</span><span>무상 휠얼라인먼트 1회</span></div>}
                                    {this.props.state.rentalType == "discount" && <div className="inner" ><span>무상 위치 교환 1회</span><span>넥스트레벨 체크 서비스</span><span>파손 보증</span></div>}
                                </div>
                            </div>
                            <div className="col-sm-5">
                            <div className="calc-chart">
                                <dl>
                                    <dt>렌탈료</dt>
                                    <dd>
                                        월 <span id="month_price" className="chart-price">{number_format(this.props.state.rentalAmt)}</span>원
                                        {this.props.state.rentalType == "free" && <p id="month_price_disc">{"월 렌탈료 " + number_format(this.props.state.rentalFee) + "원  + 부가서비스 " + number_format(this.props.state.rentalServiceAmt) + "원"}</p>}
                                    </dd>
                                </dl>
                                <dl>
                                    <dt>제휴카드가</dt>
                                    <dd>
                                    {this.props.state.rentalDiscountAmt == 0 && <div className="n-card" >제휴카드 사용 안함</div>}
                                    {this.props.state.rentalDiscountAmt != 0 && <div className="y-card"  style={{"display": 'block'}}>
                                            월 <span id="month_discount" className="chart-price text-danger">{number_format(this.props.state.rentalMonthAmt)}</span>원
                                            <p id="month_discount_disc">월 {number_format(this.props.state.rentalDiscountAmt)} 원 청구 할인 혜택</p>
                                        </div>
                                    }
                                    </dd>
                                </dl>
                            </div>
                            <div className="calc-chart no-bg">
                                <dl>
                                    <dt>총 납입금액</dt>
                                    <dd>
                                        <s id="total_price_not_sale">{number_format(this.props.state.rentalOrgTotAmt) + "원"}</s>
                                        <span id="total_price" className="chart-price text-danger">{number_format(this.props.state.rentalTotAmt)}</span>원
                                    </dd>
                                </dl>
                            </div>
                            <dl className="hidden">
                                <dt></dt>
                                <dd>
                                    <span id="show_month">0개월</span>동안 납입하실 월 렌탈료는 <span id="show_price">0원</span>이며, <br/>
                                    <span id="show_card">카드</span> 사용시 매월 <span id="show_card_discount">0원</span> 할인 받아<br/>
                                    타이어 <span id="show_count">0</span>본 총 납입금액은 <span id="show_total_price">0원</span>입니다.
                                </dd>
                            </dl>
                        </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <div className="form-group add-service">
            <h4><span>부가 서비스 추가 (자유렌탈 설계 시 선택 사항)</span></h4>
            <div className="clearfix">
                <div className="add-contents">
                    <div className="inner">
                        <a href="javascript:void(0);" className="tip-contents">
                            <img src="/img/calc/rental-tip.png" className="normal"/>
                            <img src="/img/calc/rental-tip-hover.png" className="hover"/>
                            <div className="hover-contents">
                                <h1>타이어 무상 교체 서비스</h1>
                                <h2>
                                    고객님께서 렌탈 계약하신 타이어와 <br/>
                                    동일한 규격의 타이어로 무상교체해드립니다.
                                </h2>
                                <ul>
                                    <li><span>01</span><div>렌탈중인 제품이 단종 될 경우 동급의 제품으로 변경되어 제공될 수 있습니다.</div></li>
                                    <li><span>02</span><div>TPMS, 런플랫 타이어의 경우 장착점에서 추가 비용이 과금될 수 있습니다.</div></li>
                                    <li><span>03</span><div>계약기간 내 렌탈 타이어가 마모한계선 이하의 마모진행, 주행불가능한 파손의 경우는 언제나 신청하실 수 있으며, 계약 종료 6개월 전 ~ 계약 만료일까지는 조건없이 신청이 가능합니다.</div></li>
                                </ul>
                            </div>
                        </a>
                        
                        <CUSTOM_SELECT id={"tire_exchange_obj"} name={"tire_exchange"} datas={this.props.state.tireExchangeArr} text={this.props.state.tireExchangeName} subject={"타이어 무상 교체"} defaultValue={this.props.state.tireExchangeValue} enable={this.props.state.enable} handler={this.props.handler}></CUSTOM_SELECT>
                        
                    </div>
                </div>
                <div className="add-contents">
                    <div className="inner">
                        <a href="javascript:void(0);" className="tip-contents">
                            <img src="/img/calc/rental-tip.png" className="normal" />
                            <img src="/img/calc/rental-tip-hover.png" className="hover"/>
                            <div className="hover-contents hover1">
                                <h1>무상 얼라인먼트 서비스</h1>
                                <img src="/img/calc/add-contetns3.jpg" className="img-responsive mg-auto" />
                            </div>
                        </a>
                        
                        <CUSTOM_SELECT id={"ali_exchange_obj"} name={"ali_exchange"} datas={ali_exchange_table} text={this.props.state.aliExchangeName} subject={"무상 얼라인먼트"} defaultValue={this.props.state.aliExchangeValue} enable={this.props.state.enable} handler={this.props.handler}></CUSTOM_SELECT>
                        
                    </div>
                </div>
                <div className="add-contents">
                    <div className="inner">
                        <a href="javascript:void(0);" className="tip-contents">
                            <img src="/img/calc/rental-tip.png" className="normal"/>
                            <img src="/img/calc/rental-tip-hover.png" className="hover"/>
                            <div className="hover-contents hover2">
                                <h1>무상 위치교환 서비스</h1>
                                <img src="/img/calc/add-contetns4.jpg" className="img-responsive mg-auto"/>
                            </div>
                        </a>
                        
                        <CUSTOM_SELECT id={"where_exchange_obj"} name={"where_exchange"} datas={where_exchange_table} text={this.props.state.whereExchangeName} subject={"무상 위치교환"} defaultValue={this.props.state.whereExchangeValue} enable={this.props.state.enable} handler={this.props.handler}></CUSTOM_SELECT>
                        
                    </div>
                </div>
                <div className="add-contents">
                    <div className="inner">
                        <a href="javascript:void(0);" className="tip-contents">
                            <img src="/img/calc/rental-tip.png" className="normal"/>
                            <img src="/img/calc/rental-tip-hover.png" className="hover"/>
                            <div className="hover-contents hover3">
                                <h1>넥스트레벨 체크</h1>
                                <h3>두달 주기로 고객님 근처 대리점에서 무상점검을 받을 수 있습니다.</h3>
                                <ul className="ul1">
                                    <li><span>차량점검</span><div>엔진오일 / 배터리 / 냉각수,부동액 / 통화장치 / 윈도우 브러시</div></li>
                                    <li><span>타이어점검</span><div>타이어 마모, 편마모 / 타이어 손상부위 점검</div></li>
                                </ul>
                                <br><h3>※ 렌탈전문점 사정에 따라 타이어 외 정비는 제한될 수 있습니다.</h3></br>
                            </div>
                        </a>
                        
                        <CUSTOM_SELECT id={"visit_exchange_obj"} name={"visit_exchange"} datas={this.props.state.visitExchangeArr} text={this.props.state.visitExchangeName} subject={"넥스트레벨 체크서비스"} defaultValue={this.props.state.visitExchangeValue} enable={"false"} handler={this.props.handler}></CUSTOM_SELECT>
                        
                    </div>
                </div>
            </div>
        </div> 
    </div>
		)
	}
}


ReactDOM.render(<App />, document.querySelector("#calc_body"));