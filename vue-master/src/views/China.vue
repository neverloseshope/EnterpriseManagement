<template>
  <el-card style="background-color: #8c939d">
    <el-row style="margin-bottom: 0;margin-top: 0" :gutter="4">
      <el-col :span="8">
        <el-card style="background-color: #C0C4CC">
          <i class="el-icon-user-solid" style="margin-right: 3px;font-size: 20px;color: #409EFF"></i>
          <b style="color: #409EFF">员工总数</b>
          <b style="color: #F56C6C">&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;567032</b>
        </el-card>
      </el-col>
      <el-col :span="8">
        <el-card style="background-color: #C0C4CC">
          <i class="el-icon-shopping-cart-2" style="margin-right: 3px;font-size: 22px;color: #67C23A"></i>
          <b style="color: #67C23A">销售金额</b>
          <b style="color: #F56C6C">&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;13.4亿</b>
        </el-card>
      </el-col>
      <el-col :span="8">
        <el-card style="background-color: #C0C4CC">
          <i class="el-icon-s-home" style="margin-right: 3px;font-size: 22px;color: #E6A23C"></i>
          <b style="color: #E6A23C">门店总数</b>
          <b style="color: #F56C6C">&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;743</b>
        </el-card>
      </el-col>
    </el-row>
    <div id="china_map"></div>
  </el-card>
</template>

<script>
// import echarts from "echarts";
import * as echarts from 'echarts'
import 'echarts/map/js/china.js'
export default {
  data() {
    return {
      //echart 配制option
      options: {
        tooltip: {
          triggerOn: "mousemove",   //mousemove、click
          padding:8,
          borderWidth:1,
          borderColor:'#e15d2d',
          backgroundColor:'rgba(255,255,255,0.7)',
          textStyle:{
            color:'#000000',
            fontSize:13
          },
          formatter: function(e, t, n) {
            let data = e.data;
            //模拟数据
            data.specialImportant = Math.random()*1000 | 0;
            data.import = Math.random()*1000 | 0;
            data.compare = Math.random()*1000 | 0;
            data.common = Math.random()*1000 | 0;
            data.specail = Math.random()*1000 | 0;

            let context = `
               <div>
                   <p><b style="font-size:15px;">${data.name}</b>(2022年第一季度)</p>
                   <p class="tooltip_style"><span class="tooltip_left">分部总数：</span><span class="tooltip_right">${data.value}</span></p>
              </div>
            `
            return context;
          }
        },
        visualMap: {
          show:true,
          left: 26,
          bottom: 40,
          showLabel:true,
          pieces: [
            {
              gte: 100,
              label: ">= 100",
              color: "#f3093e"
            },
            {
              gte: 500,
              lt: 999,
              label: "50 - 99",
              color: "#be13e5"
            },
            {
              gte: 100,
              lt:499,
              label: "10 - 99",
              color: "#13ccaa"
            },
            {
              gte: 10,
              lt: 99,
              label: "5 - 9",
              color: "#e7dc04"
            },
            {
              lt:10,
              label:'<5',
              color: "#2740b4"
            }
          ]
        },
        geo: {
          map: "china",
          scaleLimit: {
            min: 1,
            max: 2
          },
          zoom: 1,
          top: 120,
          label: {
            normal: {
              show:true,
              fontSize: "14",
              color: "rgba(0,0,0,0.7)"
            }
          },
          itemStyle: {
            normal: {
              //shadowBlur: 50,
              //shadowColor: 'rgba(0, 0, 0, 0.2)',
              borderColor: "rgba(0, 0, 0, 0.2)"
            },
            emphasis: {
              areaColor: "#eac360",
              shadowOffsetX: 0,
              shadowOffsetY: 0,
              borderWidth: 0
            }
          }
        },
        series: [
          {
            name: "公司发布",
            type: "map",
            geoIndex: 0,
            data:[]
          }
        ]
      },
      //echart data
      dataList: [
        {
          name: "南海诸岛",
          value: 100,
          eventTotal:100,
          specialImportant:10,
          import:10,
          compare:10,
          common:40,
          specail:20
        },
        {
          name: "北京",
          value: 540
        },
        {
          name: "天津",
          value: 130
        },
        {
          name: "上海",
          value: 400
        },
        {
          name: "重庆",
          value: 750
        },
        {
          name: "河北",
          value: 130
        },
        {
          name: "河南",
          value: 830
        },
        {
          name: "云南",
          value: 110
        },
        {
          name: "辽宁",
          value: 19
        },
        {
          name: "黑龙江",
          value: 150
        },
        {
          name: "湖南",
          value: 690
        },
        {
          name: "安徽",
          value: 60
        },
        {
          name: "山东",
          value: 39
        },
        {
          name: "新疆",
          value: 4
        },
        {
          name: "江苏",
          value: 31
        },
        {
          name: "浙江",
          value: 104
        },
        {
          name: "江西",
          value: 36
        },
        {
          name: "湖北",
          value: 52
        },
        {
          name: "广西",
          value: 33
        },
        {
          name: "甘肃",
          value: 7
        },
        {
          name: "山西",
          value: 5
        },
        {
          name: "内蒙古",
          value: 778
        },
        {
          name: "陕西",
          value: 22
        },
        {
          name: "吉林",
          value: 4
        },
        {
          name: "福建",
          value: 18
        },
        {
          name: "贵州",
          value: 5
        },
        {
          name: "广东",
          value: 98
        },
        {
          name: "青海",
          value: 1
        },
        {
          name: "西藏",
          value: 0
        },
        {
          name: "四川",
          value: 44
        },
        {
          name: "宁夏",
          value: 4
        },
        {
          name: "海南",
          value: 22
        },
        {
          name: "台湾",
          value: 3
        },
        {
          name: "香港",
          value: 5
        },
        {
          name: "澳门",
          value: 555
        }
      ]
    };
  },
  methods: {
    //初始化中国地图
    initEchartMap() {
      let mapDiv = document.getElementById('china_map');
      let myChart = echarts.init(mapDiv);
      myChart.setOption(this.options);
    },
    //修改echart配制
    setEchartOption(){
      this.options.series[0]['data'] = this.dataList;
    }
  },
  created() {
    this.setEchartOption();
  },
  mounted() {
    this.$nextTick(()=>{
      this.initEchartMap();
    })
  }
};
</script>

<style>
#china_map {
  width: 100%;
  height: 580px;
}

</style>