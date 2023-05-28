// ignore_for_file: prefer_const_constructors

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:healthme_mobileapp/color/mycolor.dart';
import 'package:healthme_mobileapp/home.dart';
import 'package:healthme_mobileapp/pmama/addmenu.dart';
import 'package:healthme_mobileapp/pmilyn/firstform.dart';
import 'package:healthme_mobileapp/pnat/circlegraph.dart';
import 'package:healthme_mobileapp/pnoon/newspage.dart';
import 'package:healthme_mobileapp/provider/dataprovider.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  Provider.debugCheckInvalidValueType = null;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProviData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FirstFormPage(),
      ),
    );
  }
}

class AppMain extends StatefulWidget {
  const AppMain({Key? key}) : super(key: key);

  @override
  _AppMainState createState() => _AppMainState();
}

class _AppMainState extends State<AppMain> {
  MySelectedcolor mySelectedcolor = MySelectedcolor();

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviData>(
      builder: (context, prodata, child) => Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: mySelectedcolor.teal,
          items: const <Widget>[
            Icon(Icons.home),
            Icon(Icons.auto_graph),
            Icon(Icons.add),
            Icon(Icons.newspaper)
          ],
          onTap: (value) {
            setState(() {
              prodata.page = value;
            });
          },
        ),
        body: getPage(index: prodata.page),
      ),
    );
  }
}

Widget getPage({required int index}) {
  Widget pagewid;
  switch (index) {
    case 0:
      pagewid = CircleGraph();
      break;
    case 1:
      pagewid = MainChart();
      break;
    case 2:
      pagewid = SelectedFood();
      break;
    case 3:
      pagewid = NewsPage();
      break;
    default:
      pagewid = Scaffold(
        body: Center(
          child: Text(
            "Error",
            style: TextStyle(fontSize: 50, color: Colors.red),
          ),
        ),
      );
  }
  return pagewid;
}
