class Menu {
  final List<Datadetails> menuItem = [
    Datadetails("ก๋วยเตี๋ยวต้มยําทะเล", 0, 50, 2.00, 400, 250, 320),
    Datadetails("ไก่ทอด", 0, 12.00, 0, 30, 1.80, 245),
    Datadetails("ข้าว 1 ถ้วย", 0, 0.66, 0.12, 7.13, 80.00, 365),
    Datadetails("ข้าวขาหมู", 450, 13.00, 0, 20.00, 53.00, 409),
    Datadetails("ข้าวไข่เจียวหมูสับ", 1113.2, 63.30, 0.7, 31.80, 46.70, 890),
    Datadetails("ข้าวผัดกะเพราไก่", 1978.9, 5.50, 6.50, 38, 34.40, 351),
    Datadetails("ข้าวผัดกะเพราหมู", 852.50, 6.40, 2.30, 32.20, 8.90, 231),
    Datadetails("ข้าวผัดหมู", 142, 31.10, 0.30, 31.2, 56.70, 646),
    Datadetails("ไข่เจียว", 1497.8, 4.9, 6.3, 8.90, 11.60, 125),
    Datadetails("ไข่ดาว", 71, 9.30, 0.20, 6.30, 0.40, 112),
    Datadetails("ต้มยํากุ้งนํ้าใส", 0, 1.00, 0, 14.00, 3.00, 77),
    Datadetails("ต้มยําปลานิล", 3819, 2.80, 3.20, 25, 45, 290),
    Datadetails("มาม่าต้มใส่ไข่", 1621, 7.80, 2.2, 12.30, 42.40, 291),
    Datadetails("หมูทอดกระเทียม", 64, 7.10, 0, 23, 1.00, 166),
    Datadetails("นํ้าอัดลม", 0.10, 0, 35, 0, 36, 145),
    Datadetails("กล้วยหอมสุก", 0, 0.20, 0, 0.90, 29.80, 128),
    Datadetails("แตงโม", 2.00, 0.10, 11.20, 0.69, 7.10, 33),
    Datadetails("มะม่วงนํ้าดอกไม้(สุก)", 2.00, 0.23, 15.00, 0.60, 17.73, 90),
    Datadetails("แอปเปิ้ลแดง", 4.00, 7.86, 9.00, 0.17, 7.86, 36)
  ];
}

class Ingredients {
  final List<Datadetails> ingrediants = [
    Datadetails("โปรดเลือกวัตถุดิบ", 0, 0, 0, 0, 0, 0),
    Datadetails("เนื้อไก่", 0, 9.70, 0, 19.50, 0, 165),
    Datadetails("เนื้อวัว", 0, 4.80, 0, 20.30, 2.30, 134),
    Datadetails("เนื้อหมู", 0, 3.30, 0, 19.60, 0.40, 110),
    Datadetails("ข้าว", 0, 0.66, 0.12, 7.13, 80, 365),
    Datadetails("กระเทียม", 14, 0.31, 0, 6.96, 14.60, 108),
    Datadetails("กะหล่ำ", 0, 0.10, 0, 1.60, 1.00, 14),
    Datadetails("คะน้า", 0, 0.50, 0, 2.70, 3.80, 31),
    Datadetails("แครอท", 0, 0.40, 0, 16.0, 7.90, 42),
    Datadetails("ต้นหอม", 39, 0.36, 0, 1.54, 3.99, 30),
    Datadetails("แตงกวา", 0, 0.10, 0, 0.80, 1.90, 13),
    Datadetails("ถั่วงอก", 0, 0.10, 0, 2.80, 6.60, 39),
    Datadetails("ถั่วฝักยาว", 0, 0.50, 0, 2.60, 4.00, 35),
    Datadetails("บร็อคโคลี่", 12, 0.50, 0, 36.4, 1.98, 33),
    Datadetails("ใบกะเพรา", 176, 0.61, 0, 3.24, 1.41, 32),
    Datadetails("ผักกาดขาว", 0, 0.10, 0, 1.50, 1.10, 11),
    Datadetails("ผักชี", 1.8, 0.63, 0, 2.68, 0.38, 24),
    Datadetails("ผักบุงจีน", 130, 0.34, 0, 1.72, 0.27, 16),
    Datadetails("ฟักทอง", 1, 0.92, 2.8, 1.91, 13.80, 75),
    Datadetails("มะเขือเทศ", 6, 0.17, 0, 0.83, 2.16, 15),
    Datadetails("ไข่ 1 ฟอง ", 90, 9.65, 0, 12.77, 1.17, 143)
  ];
}

class Datadetails {
  Datadetails(this.menuname, this.sodium, this.fat, this.sugar, this.protein,
      this.carbo, this.kcal);
  String menuname;
  double sodium;
  double fat;
  double sugar;
  double protein;
  double carbo;
  double kcal;
}
