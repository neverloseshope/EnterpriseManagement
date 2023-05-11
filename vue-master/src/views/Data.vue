<template>
  <div>
    <el-card  width="70%" >
      <el-row style="margin-bottom: 8px;margin-top: 0" :gutter="4">
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
      <div style="height: 420px">
        <el-card id="main" style="background-color:deepskyblue;width: 700px; height: 400px;margin-right: 10px" ></el-card>
        <el-card id="pie" style="background-color:deepskyblue;margin-left:10px;width: 541px; height: 400px;position: relative;right: -700px;top:-402px"></el-card>
      </div>
    </el-card>
  </div>
</template>

<script>
import * as echarts from 'echarts'
export default {
  name: "Data",
  mounted() {
    let option = {
      title: {
        text: '各季度员工数量统计',
        subtext: '趋势图',
        left: 'center'
      },
      tooltip: {
        trigger: 'item'
      },
      legend: {
        orient: 'vertical',
        left: 'left'
      },
      xAxis: {
        type: 'category',
        data: ["第一季度", "第二季度", "第三季度", "第四季度"]
      },
      yAxis: {
        type: 'value'
      },
      series: [
        {
          data: [],
          type: 'line',
        },
        {
          data: [],
          type: 'bar',
          name:'柱状'
        },
        {
          data: [5,7,3,4],
          type: 'line',
        },
        {
          data: [5,7,3,4],
          type: 'bar',
          name:'虚拟柱状'
        }
      ]
    };
    let chartDom = document.getElementById('main');
    let myChart = echarts.init(chartDom);
    this.request.get('/echarts/members').then(res => {
      // 填空
      // option.xAxis.data = res.data.x
      option.series[0].data = res.data
      option.series[1].data = res.data
      // 数据准备完毕之后再set
      myChart.setOption(option);
    })
    myChart.setOption(option);
    let pieOption = {
      title: {
        text: '各季度员工数量统计',
        subtext: '比例图',
        left: 'center'
      },
      tooltip: {
        trigger: 'item'
      },
      legend: {
        orient: 'vertical',
        left: 'left'
      },
      series: [
        {
          type: 'pie',
          radius: '60%',
          label:{            //饼图图形上的文本标签
            normal:{
              show:true,
              position:'inner', //标签的位置
              textStyle : {
                fontWeight : 300 ,
                fontSize : 14,    //文字的字体大小
                color: "#fff"
              },
              formatter:'{d}%'
            }
          },
          data: [],  // 填空
          emphasis: {
            itemStyle: {
              shadowBlur: 10,
              shadowOffsetX: 0,
              shadowColor: 'rgba(0, 0, 0, 0.5)'
            }
          }
        }
      ]
    };
    let pieDom = document.getElementById('pie');
    let pieChart = echarts.init(pieDom);
    this.request.get("/echarts/members").then(res => {

      pieOption.series[0].data = [
        {name: "第一季度", value: res.data[0]},
        {name: "第二季度", value: res.data[1]},
        {name: "第三季度", value: res.data[2]},
        {name: "第四季度", value: res.data[3]},
      ]
      pieChart.setOption(pieOption)
    })
  }
}
</script>

<style scoped>

</style>