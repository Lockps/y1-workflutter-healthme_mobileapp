// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:healthme_mobileapp/color/mycolor.dart';
import 'newsdata.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
  List<Map<String, dynamic>> filteredMenuItems = [];

  @override
  void initState() {
    super.initState();
    filteredMenuItems = data.menuItems;
  }

  void filterMenuItems(String query) {
    setState(() {
      filteredMenuItems = data.menuItems
          .where((item) =>
              item['name'].toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  MySelectedcolor mySelectedcolor = MySelectedcolor();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: mySelectedcolor.teal,
              boxShadow: [BoxShadow(color: Colors.greenAccent, blurRadius: 10)],
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Text(
                "    ข่าวสารสุขภาพ",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: searchController,
                  onChanged: filterMenuItems,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      labelText: 'Search',
                      labelStyle: TextStyle(color: Colors.white),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      )),
                ),
              ),
            ],
          ),
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
                            builder: (context) => Scaffold(),
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
                              child: Image.network(menuItem['image']),
                            ),
                            ListTile(
                              title: Text(
                                menuItem['name'],
                                style: TextStyle(fontSize: 20),
                              ),
                              subtitle: Text(menuItem['data']),
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
                                builder: (context) => Scaffold(),
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
                                child: Image.network(menuItem['image2']),
                              ),
                              ListTile(
                                title: Text(
                                  menuItem['name2'],
                                  style: TextStyle(fontSize: 20),
                                ),
                                subtitle: Text(menuItem['data2']),
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
