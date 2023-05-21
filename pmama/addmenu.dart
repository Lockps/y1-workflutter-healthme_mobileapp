// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:healthme_mobileapp/color/mycolor.dart';
import 'package:healthme_mobileapp/pmama/listmenu.dart';
import 'package:healthme_mobileapp/provider/dataprovider.dart';
import 'package:provider/provider.dart';

class SelectedFood extends StatefulWidget {
  const SelectedFood({super.key});

  @override
  State<SelectedFood> createState() => _SelectedFoodState();
}

class _SelectedFoodState extends State<SelectedFood>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  MySelectedcolor mySelectedcolor = MySelectedcolor();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: mySelectedcolor.teal,
          toolbarHeight: 30,
          bottom: TabBar(
            controller: _tabController,
            tabs: [
              Tab(
                text: "เมนู",
              ),
              Tab(
                text: "ปรุงเอง",
              )
            ],
            indicatorColor: Colors.white,
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [Item(), FoodDIY()],
        ),
      ),
    );
  }
}

class Item extends StatefulWidget {
  const Item({super.key});

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  Menu menu = Menu();
  List<MenuData> filteredMenuItems = [];

  @override
  void initState() {
    super.initState();
    filteredMenuItems = menu.menuItem;
  }

  void filterMenuItems(String query) {
    setState(() {
      filteredMenuItems = menu.menuItem
          .where((menuItem) => menuItem.menuname
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onChanged: filterMenuItems,
            decoration: InputDecoration(
              labelText: 'ค้นหารายการอาหาร',
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: filteredMenuItems.length,
            itemBuilder: (context, index) {
              final menuItem = filteredMenuItems[index];
              return InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) => Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: MediaQuery.of(context).size.height * 0.4,
                              child: Consumer<ProviData>(
                                builder: (context, prodata, child) => Column(
                                  children: [
                                    // Add your dialog content here
                                    // For example, you can add a title and buttons
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Text(
                                        'Add Menu',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration:
                                          BoxDecoration(color: Colors.amber),
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.25,
                                    ),

                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text(
                                            'Cancel',
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            prodata.kcal += menuItem.kcal;
                                            prodata.sodium += menuItem.sodium;
                                            prodata.sugar += menuItem.sugar;
                                            Navigator.of(context).pop();
                                          },
                                          child: Text(
                                            'Save',
                                            style:
                                                TextStyle(color: Colors.blue),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ));
                },
                child: ListTile(
                  title: Text(menuItem.menuname),
                  trailing: Text('${menuItem.kcal} cal'),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class FoodDIY extends StatefulWidget {
  const FoodDIY({Key? key}) : super(key: key);

  @override
  _FoodDIYState createState() => _FoodDIYState();
}

class _FoodDIYState extends State<FoodDIY> {
  String selectedMeat = 'Beef';
  List<String> meatOptions = ['Beef', 'Chicken', 'Pork'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            DropdownButton<String>(
              value: selectedMeat,
              onChanged: (String? newValue) {
                setState(() {
                  selectedMeat = newValue!;
                });
              },
              items: meatOptions.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            Container()
          ],
        ),
      ],
    );
  }
}
