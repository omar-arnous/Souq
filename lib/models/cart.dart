class Cart {
  const Cart({
    required this.title,
    required this.price,
    this.quantity = 1,
  });

  final String title;
  final int quantity;
  final int price;

  int calcAmount() {
    return price * quantity;
  }
}
