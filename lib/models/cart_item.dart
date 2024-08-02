// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sbobbify/models/food.dart';

class CartItem {

  Food food;
  List<Addon> selectedAddons;
  int quantity;

  CartItem({
    required this.food,
    required this.selectedAddons,
    this.quantity = 1,
  });

  double getTotalPrice() {
    double addonsPrice = selectedAddons.fold(0, (sum, addon) => sum += addon.price);
    double totalPrice = (food.price + addonsPrice) * quantity;

    return totalPrice;
  }

  
}
