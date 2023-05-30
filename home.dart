// ignore_for_file: avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:healthme_mobileapp/color/mycolor.dart';
import 'package:healthme_mobileapp/pnat/circlegraph.dart';
import 'package:healthme_mobileapp/provider/dataprovider.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MainChart extends StatefulWidget {
  const MainChart({super.key});

  @override
  State<MainChart> createState() => _MainChartState();
}

class _MainChartState extends State<MainChart> {
  MySelectedcolor mySelectedcolor = MySelectedcolor();
  int index_color = 0;

  final List<ChartData> chartData = [
    ChartData("00.00", 0),
    ChartData("06.00", 500),
    ChartData("12.00", 1000),
    ChartData("18.00", 1500),
    ChartData("24.00", 2000)
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<ProviData>(
      builder: (context, prodata, child) => Scaffold(
          appBar: AppBar(
            backgroundColor: mySelectedcolor.teal,
            automaticallyImplyLeading: false,
            title: Text(
              'Health me Chart',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      children: [
                        Container(
                          child: Row(children: [
                            Text(
                              'ทั้งหมด',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            )
                          ]),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Text(
                                '${prodata.kcal} แคลอรี',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Text(
                                'วันนี้',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: SfCartesianChart(
                      primaryXAxis: CategoryAxis(),
                      palette: [mySelectedcolor.lpink, mySelectedcolor.pink],
                      series: [
                        StackedColumnSeries(
                            dataSource: getData(
                                prodata.sodium,
                                prodata.fat,
                                prodata.sugar,
                                prodata.protein,
                                prodata.carbo,
                                prodata.kcal),
                            xValueMapper: (GraphData ch, _) => ch.dataname,
                            yValueMapper: (GraphData ch, _) => ch.data)
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: mySelectedcolor.coolmint,
                        boxShadow: [BoxShadow(spreadRadius: 1, blurRadius: 3)],
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: mySelectedcolor.lgreen,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          width: MediaQuery.of(context).size.width * 0.2,
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Container(
                          decoration: BoxDecoration(color: Colors.transparent),
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: MediaQuery.of(context).size.height * 0.05,
                          child: Center(
                            child: Text(
                              "คุณต้องการโซเดียมเพิ่มขึ้นอีก ${2 - prodata.sodium} กรัม ",
                              style: TextStyle(fontSize: 17),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Container(
                          decoration: BoxDecoration(color: Colors.transparent),
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: MediaQuery.of(context).size.height * 0.05,
                          child: Center(
                            child: Text(
                              "คุณต้องการไขมันเพิ่มขึ้นอีก ${65 - prodata.fat} กรัม ",
                              style: TextStyle(fontSize: 17),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Container(
                          decoration: BoxDecoration(color: Colors.transparent),
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: MediaQuery.of(context).size.height * 0.05,
                          child: Center(
                            child: Text(
                              "คุณต้องการน้ำตาลเพิ่มขึ้นอีก ${24 - prodata.sugar} กรัม ",
                              style: TextStyle(fontSize: 17),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Container(
                          decoration: BoxDecoration(color: Colors.transparent),
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: MediaQuery.of(context).size.height * 0.05,
                          child: Center(
                            child: Text(
                              "คุณต้องการโปรตีนเพิ่มขึ้นอีก ${55 - prodata.protein} กรัม ",
                              style: TextStyle(fontSize: 17),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Container(
                          decoration: BoxDecoration(color: Colors.transparent),
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: MediaQuery.of(context).size.height * 0.05,
                          child: Center(
                            child: Text(
                              "คุณต้องการคาร์โบไฮเดรตเพิ่มอีก ${600 - prodata.carbo} กรัม ",
                              style: TextStyle(fontSize: 17),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  List<GraphData> getData(double sodium, double fat, double sugar,
      double protein, double carbo, double kcal) {
    List<GraphData> dataChartList = [
      GraphData("โซเดียม", sodium),
      GraphData("ไขมัน", fat),
      GraphData("น้ำตาล", sugar),
      GraphData("โปรตีน", protein),
      GraphData("คาร์โบ", carbo),
      GraphData("แคลลอรี่", kcal)
    ];
    return dataChartList;
  }
}

class ChartData {
  final String x;
  final int y;

  ChartData(this.x, this.y);
}
