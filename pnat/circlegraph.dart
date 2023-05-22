import 'package:flutter/material.dart';
import 'package:healthme_mobileapp/color/mycolor.dart';
import 'package:healthme_mobileapp/provider/dataprovider.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CircleGraph extends StatefulWidget {
  const CircleGraph({super.key});

  @override
  State<CircleGraph> createState() => _CircleGraphState();
}

class _CircleGraphState extends State<CircleGraph> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MySelectedcolor mySelectedcolor = MySelectedcolor();

    return Consumer<ProviData>(
      builder: (context, prodata, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: mySelectedcolor.teal,
          title: Text("สวัสดี ${prodata.getName}"),
        ),
        body: Column(
          children: [
            SfCircularChart(
              palette: [mySelectedcolor.pink],
              series: <CircularSeries>[
                RadialBarSeries<GraphData, String>(
                  dataSource: getData(
                    prodata.getSick,
                    prodata.getGender,
                    prodata.getSugar,
                    prodata.getKcal,
                    prodata.getSodium,
                  ),
                  xValueMapper: (GraphData data, _) => data.dataname,
                  yValueMapper: (GraphData data, _) => data.data,
                  dataLabelSettings: DataLabelSettings(isVisible: true),
                  enableTooltip: true,
                  maximumValue: getSick(prodata.getSick, prodata.getGender),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(color: Colors.transparent),
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.1,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Text(
                    "${datanums(prodata.getSick, prodata.getKcal, prodata.getSodium, prodata.getSugar)}",
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Text(
                    " ${getamount(prodata.getSick, prodata.getKcal, prodata.getSodium, prodata.getSugar, prodata.getGender)}",
                    style: TextStyle(
                      color: mySelectedcolor.pink,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.teal),
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Container(
              decoration: BoxDecoration(color: Colors.red),
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.1,
            ),
          ],
        ),
      ),
    );
  }

  List<GraphData> getData(
      int? sick, int? gender, double sugar, double kcal, double sodium) {
    switch (sick) {
      case 1:
        List<GraphData> sugardata = [GraphData("sugar", sugar)];
        return sugardata;
      case 2:
        List<GraphData> sodiumdata = [GraphData("sodium", sodium)];
        return sodiumdata;
      default:
        List<GraphData> fatdata = [GraphData("fat", kcal)];
        return fatdata;
    }
  }
}

getamount(int? sick, double kcal, double sodium, double sugar, int? gender) {
  switch (sick) {
    case 1:
      return "คุณกินน้ำตาลได้อีก ${getSick(sick, gender)! - sugar} กรัม";
    case 2:
      return "คุณกินโซเดี่ยมได้อีก ${getSick(sick, gender)! - sodium} กรัม";
    default:
      return "คุณกินได้อีก ${getSick(sick, gender)! - kcal} แคลลอรี่";
  }
}

datanums(int? sick, double kcal, double sodium, double sugar) {
  switch (sick) {
    case 1:
      return "วันนี้คุณกินน้ำตาลไปแล้ว $sugar กรัม";
    case 2:
      return "วันนี้คุณกินโซเดี่ยมไปแล้ว $sodium กรัม";
    default:
      return "วันนี้คุณกินไปแล้ว $kcal แคลลอรี่";
  }
}

double? getSick(int? data, int? gender) {
  switch (data) {
    case 1:
      return 10;
    case 2:
      return 2;
    default:
      return checkGender(gender);
  }
}

double? checkGender(int? gender) {
  switch (gender) {
    case 0:
      return 2000;
    default:
      return 1600;
  }
}

class GraphData {
  GraphData(this.dataname, this.data);
  final String dataname;
  final double data;
}
