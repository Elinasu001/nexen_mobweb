
function number_format(number,decimals,dec_point,thousands_sep){number=(number+'').replace(/[^0-9+\-Ee.]/g,'');var n=!isFinite(+number)?0:+number,prec=!isFinite(+decimals)?0:Math.abs(decimals),sep=(typeof thousands_sep==='undefined')?',':thousands_sep,dec=(typeof dec_point==='undefined')?'.':dec_point,s='',toFixedFix=function(n,prec){var k=Math.pow(10,prec);return''+Math.round(n*k)/k;};s=(prec?toFixedFix(n,prec):''+Math.round(n)).split('.');if(s[0].length>3){s[0]=s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g,sep);}  if((s[1]||'').length<prec){s[1]=s[1]||'';s[1]+=new Array(prec-s[1].length+1).join('0');}  return s.join(dec);} 

function rental_calculator() {
    
    try{
        
        
        var car_type = app.pick.cartype;
        var rental_count = app.pick.rental_count;
        var rental_month = app.pick.rental_month;
        var rental_amount = app.pick.rental_amount;
        var rental_grade = app.pick.rental_grade;
        var rental_inch = app.pick.rental_inch;
        var card_type = app.pick.card_type;
        var month_amount = app.pick.month_amount;
        var rental_type = app.pick.rental_type;
        
        var tire_exchange = app.pick.tire_exchange;
        var engine_exchange = app.pick.engine_exchange;
        var ali_exchange = app.pick.ali_exchange;
        var where_exchange = app.pick.where_exchange;
        var visit_exchange = app.pick.visit_exchange;
        
        var prev_rental_count = '';
        
        var add_price = add_price;
        // var month_price = rental_price;
        
        if(rental_count == 2 && prev_rental_count != rental_count) {
            // $('#rental_amount_show').text('25,000');
        } else if(rental_count == 4 && prev_rental_count != rental_count) {
            // $('#rental_amount_show').text('50,000');
        }
        prev_rental_count = rental_count;
        
        
        prev_rental_type = rental_type;
        
        prev_rental_grade = rental_grade;
        
        if( ! rental_amount || ! rental_inch || ! rental_grade || ! rental_type || ! rental_count) {
            return;
        }
        

        console.log("POINT 0");
        
        var add_price = 0;
        
        $.each(rental_price_table[car_type], function (n, o) {
            if( o.rental_month == rental_month &&  o.rental_inch == rental_inch &&  o.rental_grade == rental_grade  ) {
                if( ! rental_count) {
                    return;
                }
                
                var default_rental_price = parseInt(o.rental_price.replace(/[^0-9]/g, ''));
                // if(rental_type !== 'basic'){
                default_rental_price = default_rental_price * (rental_count / 2);
                // }
                
                if(rental_type != 'free' && rental_type != 'discount') {
                    // rental_price += parseInt(price_table[rental_count][rental_month][rental_type]);
                }
                
                if(rental_amount && rental_month) {
                    if(rental_count == 2 && rental_amount == 1){
                        rental_amount = 25000;
                        // $('#rental-tag').append($rental_tag_month.text('렌탈등록비 일시납 (면제)'));
                    } else if(rental_count == 4 && rental_amount == 1){
                        rental_amount = 50000;
                        // $('#rental-tag').append($rental_tag_month.text('렌탈등록비 일시납 (면제)'));
                    }
                    if(rental_amount == 0) {
                        // $('#rental-tag').append($rental_tag_month.text('렌탈등록비 분납('+rental_month+')개월'));
                    }
                    // rental_price = rental_price - (Math.floor((rental_amount / rental_month) / 10) * 10);
                }
                
                var rental_price = 0;
                if( tire_exchange && rental_month) {
                    if(rental_type == 'free') {
                        rental_price  = default_rental_price + (tire_exchange_table[rental_month] * tire_exchange );
                    }
                    add_price += (tire_exchange_table[rental_month] * tire_exchange );
                }
                if( engine_exchange  && rental_month) {
                    if(rental_type == 'free') {
                        rental_price  = default_rental_price + (engine_exchange_table[rental_month] * engine_exchange);
                    }
                    add_price += (engine_exchange_table[rental_month] * engine_exchange);
                }
                if( ali_exchange  && rental_month) {
                    if(rental_type == 'free') {
                        rental_price = default_rental_price + (ali_exchange_table[rental_month] * ali_exchange);
                    }
                    add_price += (ali_exchange_table[rental_month] * ali_exchange);
                }
                if( where_exchange && rental_month) {
                    if(rental_type == 'free') {
                        rental_price = default_rental_price + (where_exchange_table[rental_month] * where_exchange);
                    }
                    add_price += (where_exchange_table[rental_month] * where_exchange);
                }
                if( visit_exchange  && rental_month) {
                    if(rental_type == 'free') {
                        rental_price  = default_rental_price + (visit_exchange_table[rental_month] * visit_exchange);
                    }
                    add_price += (visit_exchange_table[rental_month] * visit_exchange);
                }
                
                if(rental_type == 'discount') {
                    add_price = 0;
                    // $('#month_price_disc').text('');
                } else if(rental_type == 'basic') {
                    var _basic_table = { 12: 3000, 24: 1500, 36: 1000, 48: 800 };
                    add_price = _basic_table[rental_month];
                    // $('#month_price_disc').text('');
                } else if(rental_type == 'free') {
                    app.price.month_price_disc = '월 렌탈료 '+ number_format((default_rental_price) + '') +'원 + 부가서비스 '+ number_format(add_price + '') +'원';
                    
                }
                rental_price = default_rental_price + add_price;
                
                add_price = add_price;
                month_price = rental_price;
                
                return;
            }
        });
        
        // var month_price = month_price;
        // var add_price = add_price;
        var month_discount = 0;
        // var month_discount = parseInt($('#month_discount').text().replace(/[^0-9]/g, ''));
        var total_price = month_price;
        var sale_total_price = (month_price - month_amount) < 0 ? 0 : (month_price - month_amount);
        
        
        month_discount = sale_total_price;
        
        
        console.log('total_price', month_price, 'rental_month', rental_month, 'month_discount', month_discount, 'rental_month', rental_month);
        console.log('mm', $('#month_discount').text().replace(/[^0-9]/g, ''));
        console.log('total', (month_price * rental_month), 'discount', (month_discount * rental_month));
        // var month_price_not_sale') (((month_price * rental_month) + (month_discount * rental_month))+ '') + '원');
        
        app.price.show_total_price = total_price * rental_month;
        app.price.total_price = month_price * rental_month;
        app.price.discount    = month_discount * rental_month;
        
        var total_price_not_sale = month_price * rental_month;
        var total_price = sale_total_price * rental_month;
        var rental_tag_count = rental_count;
        var rental_tag_month = rental_month;
        
        app.price.month_price = month_price;
        app.price.month_discount = month_discount;
        app.price.month_discount_disc = '월 '+month_amount + '원 청구 할인 혜택';
        app.price.month_discount_card = month_amount;
        // app.price.show_total_price = total_price * rental_month;
        app.price.total_price = total_price;
        
    }catch(e){
        console.log("ERR", e.message );
    }
    
    return total_price;
    
}


Vue.filter("formatNumber", function (number) {
return new Intl.NumberFormat().format(number)
});

var app = new Vue({
    el: '#rentalCalc',
    data: {
        "now_step":1,

        tire_exchange_enable:false,
        engine_exchange_enable:false,
        ali_exchange_enable:false,
        where_exchange_enable:false,
        visit_exchange_enable:false,

        "pick":{
            cartype:null,
            rental_count:2,
            rental_month:36,
            rental_amount:1, /* 렌탈 등록비  0:분납 | 1:일시납 */
            rental_grade:"",
            rental_inch:null,
            card_type:'',
            month_amount:'',
            rental_type:'discount',

            tire_exchange:0,
            engine_exchange:0,
            ali_exchange:0,
            where_exchange:0,
            visit_exchange:0,
        },
        pool:{
            "cartype_table":cartype_table,
            "rental_count":rental_count_table,
            "price_table":price_table,

            "inch_labels":[13, 14, 15, 16, 17, 18, 19, 20],
            "inch_table":inch_table,
            "tire_exchange_table":tire_exchange_table,
            "engine_exchange_table":engine_exchange_table,
            "ali_exchange_table":ali_exchange_table,
            "where_exchange_table":where_exchange_table,
            "visit_exchange_table":visit_exchange_table,
            "card_type":card_type,
            "card_data":card_data,
            "rental_amount_table":rental_amount_table,
            "rental_type_table":rental_type_table,
        },
        "rental_price":rental_price_table,
        price:{
            month_price:0,
            month_discount:0,
            total_price_not_sale:0,
            total_price:0,

            show_price :0,
            show_card_discount:0,
            month_discount_disc:'',
            show_total_price:0,
            month_price_disc:'',
        }
    },
    methods: {
        setCarType: function (event) {
            app.now_step = 2;
            $(document).scrollTop(0);
        },
        calcPrice : function(){
            rental_calculator();
            return '';
        },
        setRentalType: function ( rental_type ) {
            app.price.month_discount_disc = '';
            app.price.month_price_disc = '';
            app.pick.rental_type = rental_type;
            if( rental_type == 'free' ){

                app.pick.tire_exchange = 0;
                app.pick.engine_exchange = 0;
                app.pick.ali_exchange = 0;
                app.pick.where_exchange = 0;
                app.pick.visit_exchange = 0;
    
            }else if( rental_type == 'discount' ){

                app.pick.tire_exchange = 0;
                app.pick.engine_exchange = 0;
                app.pick.ali_exchange = 1;
                app.pick.where_exchange = 1;
                app.pick.visit_exchange = 0;

            }else if( rental_type == 'basic' ){

                app.pick.tire_exchange = 0;
                app.pick.engine_exchange = 0;
                app.pick.ali_exchange = 0;
                app.pick.where_exchange = 1;
                app.pick.visit_exchange = 0;

            }

        },
        formSubmit:function(){
            var form = $('#step03 form');//[0].submit(this);

            if( $("input[name='post_privacy']:checked",form).val() != '동의함'){
                alert("개인정보보호동의 항목은 필수 입력입니다.");
                return;
            }
            if( $("input[name='post_nickname']",form).val().length == 0 ){
                alert("고객명 항목은 필수 입력입니다.");
                return;
            }
            if( $("input[name='post_tel']",form).val().length == 0 ){
                alert("연락처 항목은 필수 입력입니다.");
                return;
            }

            form[0].submit();
        },
        in_array: function(needle,haystack,argStrict){var key='',strict=!!argStrict;if(strict){for(key in haystack){if(haystack[key]===needle){return true;}}}else{for(key in haystack){if(haystack[key]==needle){return true;}}}  return false;},
        range: function(low,high,step){var matrix=[];var inival,endval,plus;var walker=step||1;var chars=false;if(!isNaN(low)&&!isNaN(high)){inival=low;endval=high;}else if(isNaN(low)&&isNaN(high)){chars=true;inival=low.charCodeAt(0);endval=high.charCodeAt(0);}else{inival=(isNaN(low)?0:low);endval=(isNaN(high)?0:high);} plus=((inival>endval)?false:true);if(plus){while(inival<=endval){matrix.push(((chars)?String.fromCharCode(inival):inival));inival+=walker;}}else{while(inival>=endval){matrix.push(((chars)?String.fromCharCode(inival):inival));inival-=walker;}} return matrix;}
        
    }
});






