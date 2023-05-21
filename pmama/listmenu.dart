class Menu {
  final List<MenuData> menuItem = [
    MenuData("ก๋วยเตี๋ยวต้มยําทะเล", 0, 50, 2.00, 400, 250, 320),
    MenuData("ไก่ทอด", 0, 12.00, 0, 30, 1.80, 245),
    MenuData("ข้าว 1 ถ้วย", 0, 0.66, 0.12, 7.13, 80.00, 365),
    MenuData("ข้าวขาหมู", 450, 13.00, 0, 20.00, 53.00, 409),
    MenuData("ข้าวไข่เจียวหมูสับ", 1113.2, 63.30, 0.7, 31.80, 46.70, 890),
    MenuData("ข้าวผัดกะเพราไก่", 1978.9, 5.50, 6.50, 38, 34.40, 351),
    MenuData("ข้าวผัดกะเพราหมู", 852.50, 6.40, 2.30, 32.20, 8.90, 231),
    MenuData("ข้าวผัดหมู", 142, 31.10, 0.30, 31.2, 56.70, 646),
    MenuData("ไข่เจียว", 1497.8, 4.9, 6.3, 8.90, 11.60, 125),
    MenuData("ไข่ดาว", 71, 9.30, 0.20, 6.30, 0.40, 112),
    MenuData("ต้มยํากุ้งนํ้าใส", 0, 1.00, 0, 14.00, 3.00, 77),
    MenuData("ต้มยําปลานิล", 3819, 2.80, 3.20, 25, 45, 290),
    MenuData("มาม่าต้มใส่ไข่", 1621, 7.80, 2.2, 12.30, 42.40, 291),
    MenuData("หมูทอดกระเทียม", 64, 7.10, 0, 23, 1.00, 166),
    MenuData("นํ้าอัดลม", 0.10, 0, 35, 0, 36, 145),
    MenuData("กล้วยหอมสุก", 0, 0.20, 0, 0.90, 29.80, 128),
    MenuData("แตงโม", 2.00, 0.10, 11.20, 0.69, 7.10, 33),
    MenuData("มะม่วงนํ้าดอกไม้(สุก)", 2.00, 0.23, 15.00, 0.60, 17.73, 90),
    MenuData("แอปเปิ้ลแดง", 4.00, 7.86, 9.00, 0.17, 7.86, 36)
  ];
}

class MenuData {
  MenuData(this.menuname, this.sodium, this.fat, this.sugar, this.protein,
      this.carbo, this.kcal);
  String menuname;
  double sodium;
  double fat;
  double sugar;
  double protein;
  double carbo;
  double kcal;
}
