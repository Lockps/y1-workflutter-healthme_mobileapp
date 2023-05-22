// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:healthme_mobileapp/color/mycolor.dart';
import 'package:healthme_mobileapp/pmama/listmenu.dart';
import 'package:healthme_mobileapp/provider/dataprovider.dart';
import 'package:provider/provider.dart';

class SelectedFood extends StatefulWidget {
  const SelectedFood({Key? key}) : super(key: key);

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
          automaticallyImplyLeading: false,
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
              ),
            ],
            indicatorColor: Colors.white,
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: const [Item(), FoodDIY()],
        ),
      ),
    );
  }
}

class Item extends StatefulWidget {
  const Item({Key? key}) : super(key: key);

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  Menu menu = Menu();
  List<Datadetails> filteredMenuItems = [];

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
              prefixIcon: const Icon(Icons.search),
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
                              const Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Text(
                                  'Add Menu',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(color: Colors.amber),
                                width: MediaQuery.of(context).size.width * 0.5,
                                height:
                                    MediaQuery.of(context).size.height * 0.25,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text(
                                      'Cancel',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      prodata.kcal += menuItem.kcal;
                                      prodata.sodium +=
                                          (menuItem.sodium * 0.001);
                                      prodata.sugar += menuItem.sugar;
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text(
                                      'Save',
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
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
  State<FoodDIY> createState() => _FoodDIYState();
}

class _FoodDIYState extends State<FoodDIY> {
  List<String?> selectedMeats = [];
  List<String?> meatOptions = [];
  Test a = Test();
  int indexs = 0;

  final _textdata = TextEditingController();
  int count = 0;

  MySelectedcolor mySelectedcolor = MySelectedcolor();

  int whereindex = 0;

  @override
  void initState() {
    super.initState();
    meatOptions = a.getMenuName()?.map((item) => item.value).toList() ?? [];

    selectedMeats = List.generate(count, (index) => meatOptions.first);
  }

  @override
  Widget build(BuildContext context) {
    Ingredients samp = Ingredients();
    return Consumer<ProviData>(
      builder: (context, providata, child) => SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: count,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(color: Colors.transparent),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DropdownButton<String?>(
                        value: selectedMeats[index],
                        onChanged: (String? newValue) {
                          whereindex = getIngredientIndex(newValue!);
                          setState(() {
                            providata.sekcal +=
                                samp.ingrediants[whereindex].kcal;
                            providata.sesodium +=
                                samp.ingrediants[whereindex].sodium;
                            providata.sesugar +=
                                samp.ingrediants[whereindex].sugar;
                            selectedMeats[index] = newValue;
                          });
                        },
                        items: a.getMenuName(),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.2,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: TextFormField(
                          controller: _textdata,
                          onChanged: (newValue) {
                            // Retrieve the entered value as a double
                            double enteredValue =
                                double.tryParse(newValue) ?? 0.0;
                            // Update the corresponding value in the provider
                            if (enteredValue != 0.0) {
                              providata.selected = enteredValue;
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: ElevatedButton(
                    onPressed: () {
                      print("${providata.sekcal}");
                      print("${providata.selected}");
                      providata.sugar += providata.sesugar;
                      providata.sodium += providata.sesodium;
                      providata.kcal += providata.sekcal;
                      providata.updateData();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Add successful"),
                        ),
                      );
                    },
                    child: const Text("Save"),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        count++;
                        selectedMeats.add(meatOptions.first);
                      });
                    },
                    child: const Icon(Icons.add),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Test {
  Ingredients samp = Ingredients();

  List<DropdownMenuItem<String>>? getMenuName() {
    List<DropdownMenuItem<String>> op = [];

    for (int i = 0; i < samp.ingrediants.length; i++) {
      op.add(
        DropdownMenuItem<String>(
          value: samp.ingrediants[i].menuname,
          child: Text(samp.ingrediants[i].menuname),
        ),
      );
    }

    return op;
  }

  getA() {
    return samp.ingrediants[0].menuname;
  }
}

int getIngredientIndex(String ingredientName) {
  Ingredients ingredients = Ingredients();
  return ingredients.ingrediants
      .indexWhere((ingredient) => ingredient.menuname == ingredientName);
}
