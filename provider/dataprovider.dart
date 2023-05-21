import 'package:flutter/foundation.dart';

class ProviData {
  double? weight;
  double? height;
  int? gender;
  int? sick;
  String name = "";

  int page = 0;
  double sugar = 0;
  double kcal = 0;
  double sodium = 0;

  int get getPage => this.page;

  set setPage(int page) => this.page = page;

  get getSugar => this.sugar;

  set setSugar(sugar) => this.sugar = sugar;

  get getKcal => this.kcal;

  set setKcal(kcal) => this.kcal = kcal;

  get getSodium => this.sodium;

  set setSodium(sodium) => this.sodium = sodium;

  String get getName => name;

  set setName(String name) => this.name = name;

  get getWeight => this.weight;

  set setWeight(weight) => this.weight = weight;

  get getGender => this.gender;

  set setGender(gender) => this.gender = gender;

  get getSick => this.sick;

  set setSick(sick) => this.sick = sick;
}
