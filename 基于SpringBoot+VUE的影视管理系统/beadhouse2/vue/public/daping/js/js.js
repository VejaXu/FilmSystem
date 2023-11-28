 $(window).load(function(){  
             $(".loading").fadeOut()
            })  
$(function () {
    echarts_1();
	// echarts_2();
	echarts_3();
	echarts_4();
	echarts_5();
	ppyssj();
	zxfe();
	xflc();
    function echarts_1() {
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('echart1'));
        $.ajax({
            //请求方式
            type : "GET",
            //请求的媒体类型
            contentType: "application/json;charset=UTF-8",
            //请求地址
            url : "/dev-api/api/data/ssql",
            //数据，json字符串
            data : {sql:"SELECT field5, sum(field6) tol,ROUND(sum(field6)/(SELECT sum(field6) FROM biz_data )*100,2) price FROM biz_data GROUP BY field5  "},
            //请求成功
            success : function(result) {
                var sdata = [];
                var ldata = [];
                var data = result.data;
                data.forEach(obj => {
                    sdata.push({value:obj.price, name:obj.field5});
                    ldata.push(obj.field5);
                });
                option = {
                    tooltip : {
                        trigger: 'item',
                        formatter: "{b} : {c} ({d}%)"
                    },
                    legend: {
                        right:0,
                        top:30,
                        height:160,
                        itemWidth:10,
                        itemHeight:10,
                        itemGap:10,
                        textStyle:{
                            color: 'rgba(255,255,255,.6)',
                            fontSize:12
                        },
                        orient:'vertical',
                        data:ldata
                    },
                calculable : true,
                    series : [
                        {
                            name:' ',
                            color: ['#62c98d', '#2f89cf', '#4cb9cf', '#53b666', '#62c98d', '#205acf', '#c9c862', '#c98b62', '#c962b9', '#7562c9','#c96262','#c25775','#00b7be'],	
                            type:'pie',
                            radius : [30, 70],
                            center : ['35%', '50%'],
                            roseType : 'radius',
                            label: {
                                normal: {
                                    show: true
                                },
                                emphasis: {
                                    show: true
                                }
                            },

                            lableLine: {
                                normal: {
                                    show: true
                                },
                                emphasis: {
                                    show: true
                                }
                            },

                            data:sdata
                        },
                    ]
                };

                // 使用刚指定的配置项和数据显示图表。
                myChart.setOption(option);
                window.addEventListener("resize",function(){
                    myChart.resize();
                });
            }
        })
    }
function echarts_2() {
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('echart2'));


        $.ajax({
            //请求方式
            type : "GET",
            //请求的媒体类型
            contentType: "application/json;charset=UTF-8",
            //请求地址
            url : "/dev-api/api/data/ssql",
            //数据，json字符串
            data : {sql:"SELECT field9,ROUND((COUNT(*)/(SELECT COUNT(*) FROM biz_data) ),2) rs  FROM biz_data GROUP BY field9 ORDER BY rs desc"},
            //请求成功
            success : function(result) {
                var sdata = [];
                var ldata = [];
                var data = result.data;
                data.forEach(obj => {
                    sdata.push({value:obj.field9, name:obj.rs});
                    ldata.push(obj.field9);
                });
                debugger;
                option = {
                    tooltip: {
                        trigger: 'item',
                       formatter: "{b} : {c} ({d}%)"
                    },
                    legend: {
                    
                        top:'15%',
                        data:ldata,
                        icon: 'circle',
                        textStyle: {
                            color: 'rgba(255,255,255,.6)',
                        }
                    },
                    calculable: true,
                    series: [{
                        name: '',
                        color: ['#62c98d', '#2f89cf', '#4cb9cf', '#53b666', '#62c98d', '#205acf', '#c9c862', '#c98b62', '#c962b9','#c96262'],	
                        type: 'pie',
                        //起始角度，支持范围[0, 360]
                        startAngle: 0,
                        //饼图的半径，数组的第一项是内半径，第二项是外半径
                        radius: [51, 100],
                        //支持设置成百分比，设置成百分比时第一项是相对于容器宽度，第二项是相对于容器高度
                        center: ['50%', '45%'],
                        
                        //是否展示成南丁格尔图，通过半径区分数据大小。可选择两种模式：
                        // 'radius' 面积展现数据的百分比，半径展现数据的大小。
                        //  'area' 所有扇区面积相同，仅通过半径展现数据大小
                        roseType: 'area',
                        //是否启用防止标签重叠策略，默认开启，圆环图这个例子中需要强制所有标签放在中心位置，可以将该值设为 false。
                        avoidLabelOverlap: false,
                        label: {
                            normal: {
                                show: true,
                              //  formatter: '{c}辆'
                            },
                            emphasis: {
                                show: true
                            }
                        },
                        labelLine: {
                            normal: {
                                show: true,
                                length2: 1,
                            },
                            emphasis: {
                                show: true
                            }
                        },
                        data:sdata
                    }]
                };
        
                // 使用刚指定的配置项和数据显示图表。
                myChart.setOption(option);
                window.addEventListener("resize",function(){
                    myChart.resize();
                });

            }
        })
    }
function echarts_3() {
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('echart3'));
    
    $.ajax({
        //请求方式
        type : "GET",
        //请求的媒体类型
        contentType: "application/json;charset=UTF-8",
        //请求地址
        url : "/dev-api/api/data/ssql",
        //数据，json字符串
        data : {sql:"SELECT field8,sum(field6) rs  FROM biz_data GROUP BY field8 ORDER BY FIELD(field8,'星期一','星期二','星期三','星期四','星期五','星期六','星期日')"},
        //请求成功
        success : function(result) {
            var sdata =[];
            var xdata =[];
            var data = result.data;
            data.forEach(obj => {
                sdata.push(obj.rs);
                xdata.push(obj.field8);
            });
            
            option = {
                   tooltip: {
                    trigger: 'axis',
                    axisPointer: {
                        lineStyle: {
                            color: '#57617B'
                        }
                    }
                },
                "legend": {
                    
                  "data": [
                    {"name": "消费额"}
                  ],
                  "top": "0%",
                  "textStyle": {
                   "color": "rgba(255,255,255,0.9)"//图例文字
                  }
                },
                
                "xAxis": [
                  {
                    "type": "category",
                    
                    data: xdata,
                     axisLine: { lineStyle: {color: "rgba(255,255,255,.1)"}},
                    axisLabel:  { textStyle: {color: "rgba(255,255,255,.6)", fontSize: '14', },
                        },
                    
                    },
                ],
                "yAxis": [
                  {
                    "type": "value",
                    "name": "消费额",
                    "axisLabel": {
                      "show": true,
                     
                    },
                    axisLine: {lineStyle: {color: 'rgba(255,255,255,.4)'}},//左线色
                    
                  },
                  {
                    "type": "value",
                    "name": "消费额",
                    "show": true,
                    "axisLabel": {
                      "show": true,
                    
                    },
                      axisLine: {lineStyle: {color: 'rgba(255,255,255,.4)'}},//右线色
                       splitLine: {show:true,lineStyle: {color:"#001e94"}},//x轴线
                  },
                ],
                "grid": {
                  "top": "10%",
                    "right":"30",
                    "bottom":"30",
                    "left":"30",
                },
                "series": [
                  {
                    "name": "消费额",
                    "type": "line",
                    "yAxisIndex": 1,
                    
                    "data": sdata,
                      lineStyle: {
                        normal: {
                            width: 2
                        },
                    },
                    "itemStyle": {
                      "normal": {
                        "color": "#cdba00",
                         
                      }
                    },
                    "smooth": true
                  }
                ]
            };
                   
            
            // 使用刚指定的配置项和数据显示图表。
            myChart.setOption(option);
            window.addEventListener("resize",function(){
                myChart.resize();
            });
    
        }
    })
    }
function echarts_4() {
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('echart4'));
        
        $.ajax({
            //请求方式
            type : "GET",
            //请求的媒体类型
            contentType: "application/json;charset=UTF-8",
            //请求地址
            url : "/dev-api/api/data/ssql",
            //数据，json字符串
            data : {sql:"SELECT field8,count(*) rs  FROM biz_data GROUP BY field8 ORDER BY FIELD(field8,'星期一','星期二','星期三','星期四','星期五','星期六','星期日')"},
            //请求成功
            success : function(result) {
                var sdata =[];
                var xdata =[];
                var data = result.data;
                data.forEach(obj => {
                    sdata.push(obj.rs);
                    xdata.push(obj.field8);
                });
                
                option = {
                       tooltip: {
                        trigger: 'axis',
                        axisPointer: {
                            lineStyle: {
                                color: '#57617B'
                            }
                        }
                    },
                    "legend": {
                        
                      "data": [
                        {"name": "人流量"}
                      ],
                      "top": "0%",
                      "textStyle": {
                       "color": "rgba(255,255,255,0.9)"//图例文字
                      }
                    },
                    
                    "xAxis": [
                      {
                        "type": "category",
                        
                        data: xdata,
                         axisLine: { lineStyle: {color: "rgba(255,255,255,.1)"}},
                        axisLabel:  { textStyle: {color: "rgba(255,255,255,.6)", fontSize: '14', },
                            },
                        
                        },
                    ],
                    "yAxis": [
                      {
                        "type": "value",
                        "name": "人流量",
                        "interval": 10,
                        "axisLabel": {
                         
                        },
                        axisLine: {lineStyle: {color: 'rgba(255,255,255,.4)'}},//左线色
                        
                      },
                      {
                        "type": "value",
                        "name": "人流量",
                        "show": true,
                        "axisLabel": {
                          "show": true,
                        
                        },
                          axisLine: {lineStyle: {color: 'rgba(255,255,255,.4)'}},//右线色
                           splitLine: {show:true,lineStyle: {color:"#001e94"}},//x轴线
                      },
                    ],
                    "grid": {
                      "top": "10%",
                        "right":"30",
                        "bottom":"30",
                        "left":"30",
                    },
                    "series": [
                      {
                        "name": "人流量",
                        "type": "line",
                        "yAxisIndex": 1,
                        
                        "data": sdata,
                          lineStyle: {
                            normal: {
                                width: 2
                            },
                        },
                        "itemStyle": {
                          "normal": {
                            "color": "#cdba00",
                             
                          }
                        },
                        "smooth": true
                      }
                    ]
                };
                       
                
                // 使用刚指定的配置项和数据显示图表。
                myChart.setOption(option);
                window.addEventListener("resize",function(){
                    myChart.resize();
                });
        
            }
        })
    }
	
function echarts_5() {
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('echart5'));
        $.ajax({
            //请求方式
            type : "GET",
            //请求的媒体类型
            contentType: "application/json;charset=UTF-8",
            //请求地址
            url : "/dev-api/api/data/ssql",
            //数据，json字符串
            data : {sql:" SELECT field5,ROUND(sum(field6)/(SELECT sum(field6) FROM biz_data )*100,2) price FROM biz_data GROUP BY field5 "},
            //请求成功
            success : function(result) {
                var ydata = [];
                var sdata = [];
                var sdata2 = [];
                var data = result.data;
                data.forEach(obj => {
                    ydata.push(obj.field5)
                    sdata.push(obj.price)
                    sdata2.push(100)
                });


                var option = {
                    tooltip: {
                        show: false
                    },
                    grid: {
                        top: '0%',
                        left: '65',
                        right: '14%',
                        bottom: '0%',
                    },
                    xAxis: {
                        min: 0,
                        max: 100,
                        splitLine: {
                            show: false
                        },
                        axisTick: {
                            show: false
                        },
                        axisLine: {
                            show: false
                        },
                        axisLabel: {
                            show: false
                        }
                    },
                    yAxis: {
                        data: ydata,
                        //offset: 15,
                        axisTick: {
                            show: false
                        },
                        axisLine: {
                            show: false
                        },
                        axisLabel: {
                            color: 'rgba(255,255,255,.6)',
                            fontSize: 14
                        }
                    },
                    series: [{
                        type: 'bar',
                        label: {
                            show: true,
                            zlevel: 10000,
                            position: 'right',
                            padding: 10,
                            color: '#49bcf7',
                            fontSize: 14,
                            formatter: '{c}%'
                            
                        },
                        itemStyle: {
                            color:'#49bcf7'
                        },
                        barWidth: '15',
                        data: sdata,
                        z: 10
                    }, {
                        type: 'bar',
                        barGap: '-100%',
                        itemStyle: {
                            color:'#fff',
                            opacity: 0.1
                        },
                        barWidth: '15',
                        data: sdata2,
                        z: 5
                    }],
                };
                // 使用刚指定的配置项和数据显示图表。
                myChart.setOption(option);
                window.addEventListener("resize",function(){
                    myChart.resize();
                });
            },
            //请求失败，包含具体的错误信息
            error : function(e){
                console.log(e.status);
                console.log(e.responseText);
            }
        });
    
    }
	
    function ppyssj(){
        
        $.ajax({
            //请求方式
            type : "GET",
            //请求的媒体类型
            contentType: "application/json;charset=UTF-8",
            //请求地址
            url : "/dev-api/api/data/ssql",
            //数据，json字符串
            data : {sql:"SELECT field5, sum(field6) tol,ROUND(sum(field6)/(SELECT sum(field6) FROM biz_data )*100,2) price,(SELECT sum(field6) FROM biz_data ) tfee FROM biz_data GROUP BY field5 "},
            //请求成功
            success : function(result) {
                var html = '';
                var row = result.data;
                row.forEach(element => {
                    html+="<li><p><span>"+element.field5+"</span><span>"+element.price+"%</span><span style='width:30%'>"+element.tol+"元</span></p></li>";
                });
                $("#ppyssj").html(html);
                $("#tolfee").html(result.data[0].tfee);
            }
        })
    }
	
    function zxfe(){
        $.ajax({
            //请求方式
            type : "GET",
            //请求的媒体类型
            contentType: "application/json;charset=UTF-8",
            //请求地址
            url : "/dev-api/api/data/ssql",
            //数据，json字符串
            data : {sql:"SELECT field8,sum(field6) rs  FROM biz_data GROUP BY field8 ORDER BY FIELD(field8,'星期一','星期二','星期三','星期四','星期五','星期六','星期日')"},
            //请求成功
            success : function(result) {
                var html = '<tr><th scope="col"></th><th scope="col">星期</th><th scope="col">消费额</th></tr>';
                var row = result.data;
                var i = 1;
                row.forEach(element => {
                    html+="<tr>       <td><span>"+i+"</span></td>        <td>"+element.field8+"</td>       <td>"+element.rs+" 元<br></td>         </tr>";
                    i++;
                });
                $("#zxfe").html(html);
            }
        })
    }
	
    function xflc(){
        $.ajax({
            //请求方式
            type : "GET",
            //请求的媒体类型
            contentType: "application/json;charset=UTF-8",
            //请求地址
            url : "/dev-api/api/data/ssql",
            //数据，json字符串
            data : {sql:"  SELECT field13,sum(field6) rs  FROM biz_data GROUP BY field13 ORDER BY rs desc "},
            //请求成功
            success : function(result) {
                var html = '<tr><th scope="col"></th><th scope="col">楼层</th><th scope="col">消费额</th></tr>';
                var row = result.data;
                var i = 1;
                row.forEach(element => {
                    html+="<tr>       <td><span>"+i+"</span></td>        <td>"+element.field13+"</td>       <td>"+element.rs+" 元<br></td>         </tr>";
                    i++;
                });
                $("#xflc").html(html);
            }
        })
    }
    
function zb1() {
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('zb1'));
	var v1=298//男消费
		var v2=523//女消费
		var v3=v1+v2//总消费 
option = {	
    series: [{
		
        type: 'pie',
        radius: ['60%', '70%'],
        color:'#49bcf7',
        label: {
            normal: {
                position: 'center'
            }
        },
        data: [{
            value: v2,
            name: '女消费',
            label: {
                normal: {
                    formatter: v2 +'',
                    textStyle: {
                        fontSize: 20,
						color:'#fff',
                    }
                }
            }
        }, {
            value: v1,
            name: '男消费',
            label: {
                normal: {
                 formatter : function (params){
                return '占比'+Math.round( v2/v3*100)+ '%'
            },
                    textStyle: {
                        color: '#aaa',
                        fontSize: 12
                    }
                }
            },
            itemStyle: {
                normal: {
                    color: 'rgba(255,255,255,.2)'
                },
                emphasis: {
                    color: '#fff'
                }
            },
        }]
    }]
};
        myChart.setOption(option);
        window.addEventListener("resize",function(){
            myChart.resize();
        });
    }
function zb2() {
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('zb2'));
 var v1=298//男消费
		var v2=523//女消费
		var v3=v1+v2//总消费 
      option = {
	
//animation: false,
    series: [{	
        type: 'pie',
       radius: ['60%', '70%'],
        color:'#cdba00',
        label: {
            normal: {
                position: 'center'
            }
        },
        data: [{
            value: v1,
            name: '男消费',
            label: {
                normal: {
                    formatter: v1 +'',
                    textStyle: {
                        fontSize: 20,
						color:'#fff',
                    }
                }
            }
        }, {
            value: v2,
            name: '女消费',
            label: {
                normal: {
                 formatter : function (params){
                return '占比'+Math.round( v1/v3*100)+ '%'
            },
                    textStyle: {
                        color: '#aaa',
                        fontSize: 12
                    }
                }
            },
            itemStyle: {
                normal: {
                    color: 'rgba(255,255,255,.2)'
                },
                emphasis: {
                    color: '#fff'
                }
            },
        }]
    }]
};
        myChart.setOption(option);
        window.addEventListener("resize",function(){
            myChart.resize();
        });
    }
function zb3() {
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('zb3'));
		var v1=298//男消费
		var v2=523//女消费
		var v3=v1+v2//总消费 
option = {	
    series: [{
		
        type: 'pie',
       radius: ['60%', '70%'],
        color:'#62c98d',
        label: {
            normal: {
                position: 'center'
            }
        },
        data: [{
            value: v2,
            name: '女消费',
            label: {
                normal: {
                    formatter: v2 +'',
                    textStyle: {
                        fontSize: 20,
						color:'#fff',
                    }
                }
            }
        }, {
            value: v1,
            name: '男消费',
            label: {
                normal: {
                 formatter : function (params){
                return '占比'+Math.round( v2/v3*100)+ '%'
            },
                    textStyle: {
                        color: '#aaa',
                        fontSize: 12
                    }
                }
            },
            itemStyle: {
                normal: {
                    color: 'rgba(255,255,255,.2)'
                },
                emphasis: {
                    color: '#fff'
                }
            },
        }]
    }]
};
        myChart.setOption(option);
        window.addEventListener("resize",function(){
            myChart.resize();
        });
    }
})



		
		
		


		









