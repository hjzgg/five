<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>JavaScript 图片滑动切换效果</title>
<link href="css/foot.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript">
    function MyRandom(Min,Max)
    {   
        var Range = Max - Min;   
        var Rand = Math.random();   
        return(Min + Math.round(Rand * Range));   
     }   
</script> 
 
<script type="text/javascript">
var $ = function (id) {
	return "string" == typeof id ? document.getElementById(id) : id;
};

var Extend = function(destination, source) {
	for (var property in source) {
		destination[property] = source[property];
	}
	return destination;
}

var CurrentStyle = function(element){
	return element.currentStyle || document.defaultView.getComputedStyle(element, null);
}

var Bind = function(object, fun) {
	var args = Array.prototype.slice.call(arguments).slice(2);
	return function() {
		return fun.apply(object, args.concat(Array.prototype.slice.call(arguments)));
	}
}

var Tween = {
	Quart: {
		easeOut: function(t,b,c,d){
			return -c * ((t=t/d-1)*t*t*t - 1) + b;
		}
	},
	Back: {
		easeOut: function(t,b,c,d,s){
			if (s == undefined) s = 1.70158;
			return c*((t=t/d-1)*t*((s+1)*t + s) + 1) + b;
		}
	},
	Bounce: {
		easeOut: function(t,b,c,d){
			if ((t/=d) < (1/2.75)) {
				return c*(7.5625*t*t) + b;
			} else if (t < (2/2.75)) {
				return c*(7.5625*(t-=(1.5/2.75))*t + .75) + b;
			} else if (t < (2.5/2.75)) {
				return c*(7.5625*(t-=(2.25/2.75))*t + .9375) + b;
			} else {
				return c*(7.5625*(t-=(2.625/2.75))*t + .984375) + b;
			}
		}
	}
}


//容器对象,滑动对象,切换数量
var SlideTrans = function(container, slider, count, options) {
	this._slider = $(slider);
	this._container = $(container);//容器对象
	this._timer = null;//定时器
	this._count = Math.abs(count);//切换数量
	this._target = 0;//目标值
	this._t = this._b = this._c = 0;//tween参数
	
	this.Index = 0;//当前索引
	
	this.SetOptions(options);
	
	this.Auto = !!this.options.Auto;
	this.Duration = Math.abs(this.options.Duration);
	this.Time = Math.abs(this.options.Time);
	this.Pause = Math.abs(this.options.Pause);
	this.Tween = this.options.Tween;
	this.onStart = this.options.onStart;
	this.onFinish = this.options.onFinish;
	
	var bVertical = !!this.options.Vertical;
	this._css = bVertical ? "top" : "left";//方向
	
	//样式设置
	var p = CurrentStyle(this._container).position;
	p == "relative" || p == "absolute" || (this._container.style.position = "relative");
	this._container.style.overflow = "hidden";
	this._slider.style.position = "absolute";
	
	this.Change = this.options.Change ? this.options.Change :
		this._slider[bVertical ? "offsetHeight" : "offsetWidth"] / this._count;
};
SlideTrans.prototype = {
  //设置默认属性
  SetOptions: function(options) {
	this.options = {//默认值
		Vertical:	true,//是否垂直方向（方向不能改）
		Auto:		true,//是否自动
		Change:		0,//改变量
		Duration:	50,//滑动持续时间
		Time:		10,//滑动延时
		Pause:		2000,//停顿时间(Auto为true时有效)
		onStart:	function(){},//开始转换时执行
		onFinish:	function(){},//完成转换时执行
		Tween:		Tween.Quart.easeOut//tween算子
	};
	Extend(this.options, options || {});
  },
  //开始切换
  Run: function(index) {
	//修正index
	index == undefined && (index = this.Index);
	index < 0 && (index = this._count - 1) || index >= this._count && (index = 0);
	//设置参数
	this._target = -Math.abs(this.Change) * (this.Index = index);
	this._t = 0;
	this._b = parseInt(CurrentStyle(this._slider)[this.options.Vertical ? "top" : "left"]);
	this._c = this._target - this._b;
	
	this.onStart();
	this.Move();
        
        var num = MyRandom(0,2); 
        switch(num){
                case 2 :
			st.Tween = Tween.Bounce.easeOut; break;
		case 1 :
			st.Tween = Tween.Back.easeOut; break;
		default :
			st.Tween = Tween.Quart.easeOut;
        }
        
  },
  //移动
  Move: function() {
	clearTimeout(this._timer);
	//未到达目标继续移动否则进行下一次滑动
	if (this._c && this._t < this.Duration) {
		this.MoveTo(Math.round(this.Tween(this._t++, this._b, this._c, this.Duration)));
		this._timer = setTimeout(Bind(this, this.Move), this.Time);
	}else{
		this.MoveTo(this._target);
		this.Auto && (this._timer = setTimeout(Bind(this, this.Next), this.Pause));
	}
  },
  //移动到
  MoveTo: function(i) {
	this._slider.style[this._css] = i + "px";
  },
  //下一个
  Next: function() {
	this.Run(++this.Index);
  },
  //上一个
  Previous: function() {
	this.Run(--this.Index);
  },
  //停止
  Stop: function() {
	clearTimeout(this._timer); this.MoveTo(this._target);
  }
};
</script>
<style type="text/css"> 
.container, .container img{width:400px; height:200px; z-index: 1;}
.container{border:1px solid #333; align:center;}
.container img{border:0;}
</style>
    
<style type="text/css">
    .num{ position:absolute; right:5px; bottom:5px;}
    .num li{
            float: left;
            list-style:none;
            color: #fff;
            text-align: center;
            line-height: 16px;
            width: 16px;
            height: 16px;
            font-family: Arial;
            font-size: 12px;
            cursor: pointer;
            margin: 1px;
            border: 1px solid #707070;
            background-color: #060a0b;
    }
    .num li.on{
            line-height: 18px;
            width: 18px;
            height: 18px;
            font-size: 14px;
            border: 0;
            background-color: #ce0609;
            font-weight: bold;
    }
</style>
</head>
<body>
     <div class="container" id="idContainer2" align="center">
	<table id="idSlider2" border="0" cellpadding="0" cellspacing="0">
		<tr>
                        <%
                        		int tot = 4;
                                for(int i=1; i<4; ++i){
                        %>
                                    <td><a href="#"> <img src="<%="picture/" + i +".jpg"%>" title="hjzgg"/> </a></td>   
                        <%
                                }
                        %>
		</tr>
	</table>
	<ul class="num" id="idNum">
	</ul>
    </div>
<br />
<!-- <div>
	<input id="idAuto" type="button" value="停止" />
        &nbsp;&nbsp;&nbsp;&nbsp;
	<input id="idPre" type="button" value="&lt;&lt;" />
        &nbsp;&nbsp;&nbsp;&nbsp;
	<input id="idNext" type="button" value="&gt;&gt;" />
</div> -->
<script>

        var forEach = function(array, callback, thisObject){
                if(array.forEach){
                        array.forEach(callback, thisObject);
                }else{
                        for (var i = 0, len = array.length; i < len; i++) { callback.call(thisObject, array[i], i, array); }
                }
        }

        var st = new SlideTrans("idContainer2", "idSlider2", <%=tot-1%>, { Vertical: false });

        var nums = [];
        //插入数字
        for(var i = 0, n = st._count - 1; i <= n;){
                (nums[i] = $("idNum").appendChild(document.createElement("li"))).innerHTML = ++i;
        }

        forEach(nums, function(o, i){
                o.onmouseover = function(){ o.className = "on"; st.Auto = false; st.Run(i); }
                o.onmouseout = function(){ o.className = ""; st.Auto = true; st.Run(); }
        })

        /* //设置按钮样式
        st.onStart = function(){
                forEach(nums, function(o, i){ o.className = st.Index == i ? "on" : ""; })
        }

        $("idAuto").onclick = function(){
                if(st.Auto){
                        st.Auto = false; st.Stop(); this.value = "自动";
                }else{
                        st.Auto = true; st.Run(); this.value = "停止";
                }
        }
        $("idNext").onclick = function(){ st.Next(); }
        $("idPre").onclick = function(){ st.Previous(); }

        st.Run(); */
</script>
</body>
</html>
