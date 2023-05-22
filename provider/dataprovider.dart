import 'package:flutter/foundation.dart';

class ProviData extends ChangeNotifier {
  double? weight;
  double? height;
  int? gender;
  int? sick;
  String name = "";

  int page = 0;
  double sugar = 0;
  double kcal = 0;
  double sodium = 0;

  double selected = 0;
  double sesugar = 0;
  double sekcal = 0;
  double sesodium = 0;

  get getSelected => this.selected;
  set setSelected(selected) {
    this.selected = selected;
    notifyListeners();
  }

  get getSesugar => this.sesugar;
  set setSesugar(sesugar) {
    this.sesugar = sesugar;
    notifyListeners();
  }

  get getSekcal => this.sekcal;
  set setSekcal(sekcal) {
    this.sekcal = sekcal;
    notifyListeners();
  }

  get getSesodium => this.sesodium;
  set setSesodium(sesodium) {
    this.sesodium = sesodium;
    notifyListeners();
  }

  int get getPage => this.page;
  set setPage(int page) {
    this.page = page;
    notifyListeners();
  }

  get getSugar => this.sugar;
  set setSugar(sugar) {
    this.sugar = sugar;
    notifyListeners();
  }

  get getKcal => this.kcal;
  set setKcal(kcal) {
    this.kcal = kcal;
    notifyListeners();
  }

  get getSodium => this.sodium;
  set setSodium(sodium) {
    this.sodium = sodium;
    notifyListeners();
  }

  String get getName => name;
  set setName(String name) {
    this.name = name;
    notifyListeners();
  }

  get getWeight => this.weight;
  set setWeight(weight) {
    this.weight = weight;
    notifyListeners();
  }

  get getGender => this.gender;
  set setGender(gender) {
    this.gender = gender;
    notifyListeners();
  }

  get getSick => this.sick;
  set setSick(sick) {
    this.sick = sick;
    notifyListeners();
  }

  void updateData() {
    notifyListeners();
  }
}
