class Item {
  final String name;
  final String image;
  final double price;
  int qty;
  Item(
      {required this.name,
      required this.image,
      required this.price,
      this.qty = 0});
}
