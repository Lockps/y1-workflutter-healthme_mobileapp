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
  List day = ['วัน', 'สัปดาห์', 'เดือน', 'ปี'];
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
    CircleGraph datafromcircle = CircleGraph();
    return Consumer<ProviData>(
      builder: (context, prodata, child) => Scaffold(
        body: SafeArea(
            child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Health me Chart',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ...List.generate(4, (index) {
                          //เอาไว้ทำสิ่งที่เราอยากจะทำซ้ำเพิ่ม
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                index_color = index;
                              });
                            },
                            child: Container(
                              height: 40,
                              width: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: index_color == index
                                      ? Color.fromARGB(255, 47, 125, 121)
                                      : Colors.white),
                              alignment: Alignment.center,
                              child: Text(
                                day[index],
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: index_color == index
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                          );
                        })
                      ],
                    ),
                  ),
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
                                '... ก้าว',
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
                  )
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }

  List<GraphData> getData(double sodium, double fat, double sugar,
      double protein, double carbo, double kcal) {
    List<GraphData> dataChartList = [
      GraphData("โซเดียม", sodium),
      GraphData("ไขมัน", fat),
      GraphData("น้ำตาล", sugar),
      GraphData("โปรตีน", protein),
      GraphData("คาร์โบไฮเดรต", carbo),
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
