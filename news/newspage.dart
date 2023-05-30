// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:healthme_mobileapp/color/mycolor.dart';
import 'newsdata.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MySelectedcolor mySelectedcolor = MySelectedcolor();
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            "ข่าวสุขภาพประจำวัน",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          toolbarHeight: MediaQuery.of(context).size.height * 0.1,
          backgroundColor: mySelectedcolor.teal),
      body: Column(
        children: [
          Expanded(child: News()),
        ],
      ),
    );
  }
}

class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  final NewsData data = NewsData();
  TextEditingController searchController = TextEditingController();
  List<NewsDatacon> filteredMenuItems = [];

  MySelectedcolor mySelectedcolor = MySelectedcolor();

  @override
  void initState() {
    super.initState();
    filteredMenuItems = data.menuItems;
  }

  void filterMenuItems(String query) {
    setState(() {
      filteredMenuItems = data.menuItems
          .where((menuItem) => menuItem.name
              .toString()
              .toLowerCase()
              .contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: filteredMenuItems.length,
            itemBuilder: (context, index) {
              final menuItem = filteredMenuItems[index];

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(),
                        boxShadow: [
                          BoxShadow(color: mySelectedcolor.lpink, blurRadius: 5)
                        ],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: MediaQuery.of(context).size.height * 0.23,
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              content: Text("${menuItem.data}"),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              width: MediaQuery.of(context).size.width * 0.6,
                              height: MediaQuery.of(context).size.height * 0.1,
                              child: Image.network(menuItem.link),
                            ),
                            ListTile(
                              title: Text(
                                menuItem.name,
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.07,
                    ),
                    Container(
                        decoration: BoxDecoration(
                          border: Border.all(),
                          boxShadow: [
                            BoxShadow(
                                color: mySelectedcolor.lpink, blurRadius: 5)
                          ],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        height: MediaQuery.of(context).size.height * 0.23,
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  content: Text("${menuItem.data2}"),
                                ),
                              );
                            },
                            child: Column(children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                width: MediaQuery.of(context).size.width * 0.6,
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                child: Image.network(menuItem.link2),
                              ),
                              ListTile(
                                title: Text(
                                  menuItem.name2,
                                  style: TextStyle(fontSize: 20),
                                ),
                                // subtitle: Text(menuItem['data2']),
                              ),
                            ])))
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
