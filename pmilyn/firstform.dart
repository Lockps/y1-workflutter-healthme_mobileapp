// ignore_for_file: prefer_const_constructors

import 'package:healthme_mobileapp/color/mycolor.dart';
import 'package:healthme_mobileapp/provider/dataprovider.dart';
import 'package:flutter/material.dart';
import 'package:healthme_mobileapp/main.dart';
import 'package:provider/provider.dart';

class FirstFormPage extends StatefulWidget {
  const FirstFormPage({super.key});

  @override
  State<FirstFormPage> createState() => _FirstFormPageState();
}

class _FirstFormPageState extends State<FirstFormPage> {
  bool _woman = false;
  bool _man = false;

  bool kidney = false;
  bool fat = false;
  bool sugar = false;

  bool validatesick = false;

  int? pic;

  String? username = '';

  final _namecontrol = TextEditingController();
  final _weightcontrol = TextEditingController();
  final _heightcontrol = TextEditingController();

  MySelectedcolor mySelectedcolor = MySelectedcolor();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mySelectedcolor.green,
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Consumer<ProviData>(
            builder: (context, prodata, child) => Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.12,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_forward),
                        onPressed: () {
                          if (_namecontrol.text.isNotEmpty &&
                              _heightcontrol.text.isNotEmpty &&
                              _weightcontrol.text.isNotEmpty &&
                              (_man || _woman)) {
                            if (_man) prodata.gender = 0;
                            if (_woman) prodata.gender = 1;

                            prodata.sick = pic;
                            // prodata.weight = double.parse(_weightcontrol.text);
                            prodata.name = _namecontrol.text;
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return AppMain();
                            }));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("กรุณาใส่ข้อมูลให้ครบถ้วน")));
                          }
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.transparent),
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.35,
                  child: SizedBox(child: getpic(pic)),
                ),
                // SizedBox(
                //   height: MediaQuery.of(context).size.height * 0.05,
                // ),
                Container(
                  decoration: BoxDecoration(color: Colors.transparent),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.person),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.02,
                      ),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.28,
                          child: TextFormField(
                            controller: _namecontrol,
                            decoration: InputDecoration(labelText: " ชื่อ"),
                            onSaved: (newValue) {
                              username = newValue;
                            },
                            validator: (value) {
                              if (value == null) {
                                return 'Please Enter Name';
                              }
                              return null;
                            },
                          )),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.1,
                      ),
                      Icon(Icons.calendar_today),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.02,
                      ),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.28,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(labelText: " อายุ"),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.transparent),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.height),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.02,
                      ),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.28,
                          child: TextFormField(
                            controller: _heightcontrol,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                labelText: " ส่วนสูง (เซนติเมตร)"),
                          )),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.1,
                      ),
                      Icon(Icons.monitor_weight),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.02,
                      ),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.28,
                          child: TextFormField(
                            controller: _weightcontrol, //!weight
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                labelText: " น้ำหนัก (กิโลกรัม)"),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.transparent),
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Gender",
                        style: TextStyle(fontSize: 23),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.05,
                      ),
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: _man ? Colors.blue : Colors.white,
                              border: Border.all()),
                          width: 50,
                          height: 50,
                          child: Icon(
                            Icons.man,
                            size: 30,
                            color: _man ? Colors.white : Colors.blue,
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            _woman = false;
                            _man = !_man;
                          });
                        },
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.05,
                      ),
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: _woman ? Colors.pink : Colors.white,
                              border: Border.all()),
                          width: 50,
                          height: 50,
                          child: Icon(
                            Icons.woman,
                            size: 30,
                            color: _woman ? Colors.white : Colors.redAccent,
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            _man = false;
                            _woman = !_woman;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: Text(
                    "โปรดเลือกโรคของท่าน",
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                            onTap: () {
                              setState(() {
                                kidney = true;
                                sugar = false;
                                fat = false;
                                pic = 2;
                              });
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle),
                                child: kidneylogo())),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.1,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              sugar = true;
                              kidney = false;
                              fat = false;
                              pic = 1;
                            });
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                              child: sugarlogo()),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.1,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              fat = true;
                              sugar = false;
                              kidney = false;
                              pic = 3;
                            });
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                              child: fatlogo()),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget kidneylogo() {
  return Container(
      decoration: BoxDecoration(border: Border.all(), shape: BoxShape.circle),
      width: 70,
      height: 70,
      child: Image.asset('images/kidney.png'));
}

Widget fatlogo() {
  return Container(
      decoration: BoxDecoration(border: Border.all(), shape: BoxShape.circle),
      width: 70,
      height: 70,
      child: Image.asset('images/hungry.png'));
}

Widget sugarlogo() {
  return Container(
      decoration: BoxDecoration(border: Border.all(), shape: BoxShape.circle),
      width: 70,
      height: 70,
      child: Image.asset('images/sugar-blood-level.png'));
}

Widget getpic(int? nums) {
  switch (nums) {
    case 1:
      return Image.asset('images/pic1.png');
    case 2:
      return Image.asset('images/pic2.png');
    case 3:
      return Image.asset('images/pic3.png');
    default:
      return Image.asset('images/logo.png');
  }
}
