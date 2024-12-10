//radio group 공통 class
class RadioGroup extends React.Component {    

	render(){
	    return (
	    		<div>
				{this.props.datas.map((item) => (
					<label className="radio-inline custom-radio">
   					<input type="radio" name={this.props.name} value={item.id} data-label={item.label} checked={this.props.defaultValue == item.id} onClick={(e) => {this.props.handler(e, this.props.id)}}/>
   					<span>{item.label}</span>
					</label>	
				))}
				</div>
	    )
	  }
}

//select box 공통 class
class SELECT extends React.Component {    

	render(){
	    return (
	    		<select name={this.props.name} className="form-control" onChange={(e) => {this.props.handler(e, this.props.id)}}>
				<option value="" selected>{this.props.nullText}</option>
				{this.props.datas.map((item) => (
					<option value={item.id}>{item.label}</option>
				))}
				</select>
	    )
	  }
}

//custom select box 공통 class
class CUSTOM_SELECT extends React.Component {    
	
	render(){
	    return (
	    		<div className="dropdown" style={{ 
	    		           "true" : {"opacity": "1.0"},
	    		           "false" : {"pointer-events": "none", "opacity": "0.4"}
	    		        }[this.props.enable]}>
                <button className="btn btn-default btn-block dropdown-toggle" type="button" id={this.props.id} data-toggle="dropdown" aria-expanded="true" >
                    {this.props.subject}
                    <div className="count-box">
                        <span>{this.props.text}</span>회
                    </div>
                    <i className="fas fa-chevron-down"></i>
                </button>
                <ul className="dropdown-menu" role="menu" aria-labelledby={this.props.id}>
                {this.props.datas.map((item, index) => (
                	<li role="presentation" >
                        <label className="radio-inline custom-radio">
                            <input type="radio" name={this.props.name} value={item.id} data-label={item.label} data-amt={item.amt} checked={this.props.defaultValue == item.id}  onClick={(e) => {this.props.handler(e, this.props.name)}}/>
                            {index == 0 && <span>해당 없음</span>}
                            {index != 0 && <span>{item.label + "회"}</span>}
                        </label>
                    </li>
				))}
                </ul>
            </div>
	    )
	  }
}

//1000단위마다 콤마 찍어주는 기능
function number_format(num){
	return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}