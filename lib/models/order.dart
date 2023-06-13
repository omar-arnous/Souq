import 'cart.dart';

class Order {
  const Order({
    required this.items,
    required this.total,
  });

  final List<Cart> items;
  final int total;

  Map<String, dynamic> toJson() => {
        'cart': items,
        'total': total,
      };

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        items: json['orders'],
        total: json['total'],
      );
}
