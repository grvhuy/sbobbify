import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sbobbify/models/cart_item.dart';
import 'package:sbobbify/models/food.dart';

class Restaurant with ChangeNotifier {
  // List of food menu
  final List<Food> _menu = [
    //burger
    Food(
      name: "Classic Cheeseburger",
      description: "Big fat juicy burger with cheddar cheese",
      imagePath: "lib/images/burgers/burger.png",
      price: 0.99,
      category: FoodCategory.burger,
      availableAddons: [
        Addon(name: "Extra cheese", price: 0.17),
        Addon(name: "Lettuce", price: 0.05),
        Addon(name: "Extra Beef", price: 0.49),
      ],
    ),
    Food(
      name: "Veggie Burger",
      description: "Delicious veggie patty with fresh veggies",
      imagePath: "lib/images/burgers/burger.png",
      price: 0.89,
      category: FoodCategory.burger,
      availableAddons: [
        Addon(name: "Avocado", price: 0.20),
        Addon(name: "Tomato", price: 0.10),
      ],
    ),

    Food(
      name: "Classic Cheeseburger",
      description: "Big fat juicy burger with cheddar cheese",
      imagePath: "lib/images/burgers/burger.png",
      price: 0.99,
      category: FoodCategory.burger,
      availableAddons: [
        Addon(name: "Extra cheese", price: 0.17),
        Addon(name: "Lettuce", price: 0.05),
        Addon(name: "Extra Beef", price: 0.49),
      ],
    ),
    Food(
      name: "Veggie Burger",
      description: "Delicious veggie patty with fresh veggies",
      imagePath: "lib/images/burgers/burger.png",
      price: 0.89,
      category: FoodCategory.burger,
      availableAddons: [
        Addon(name: "Avocado", price: 0.20),
        Addon(name: "Tomato", price: 0.10),
      ],
    ),

    // Sides
    Food(
      name: "French Fries",
      description: "Crispy golden fries",
      imagePath: "lib/images/burgers/burger.png",
      price: 0.49,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Cheese sauce", price: 0.15),
        Addon(name: "Bacon bits", price: 0.25),
      ],
    ),
    Food(
      name: "Onion Rings",
      description: "Crunchy onion rings",
      imagePath: "lib/images/burgers/burger.png",
      price: 0.59,
      category: FoodCategory.sides,
      availableAddons: [],
    ),

    // Salads
    Food(
      name: "Caesar Salad",
      description: "Classic Caesar salad with croutons and parmesan",
      imagePath: "lib/images/burgers/burger.png",
      price: 1.29,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Grilled chicken", price: 0.50),
        Addon(name: "Extra dressing", price: 0.10),
      ],
    ),

    Food(
      name: "Greek Salad",
      description: "Fresh salad with feta, olives, and tomatoes",
      imagePath: "lib/images/burgers/burger.png",
      price: 1.19,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Extra feta", price: 0.20),
      ],
    ),

    // Drinks
    Food(
      name: "Soda",
      description: "Refreshing carbonated drink",
      imagePath: "lib/images/burgers/burger.png",
      price: 0.29,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Lemon slice", price: 0.05),
        Addon(name: "Ice", price: 0.00),
      ],
    ),
    Food(
      name: "Fresh Orange Juice",
      description: "Freshly squeezed orange juice",
      imagePath: "lib/images/burgers/burger.png",
      price: 0.69,
      category: FoodCategory.drinks,
      availableAddons: [],
    ),
    // Desserts
    Food(
      name: "Chocolate Cake",
      description: "Rich chocolate cake with frosting",
      imagePath: "lib/images/burgers/burger.png",
      price: 1.49,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Extra frosting", price: 0.25),
        Addon(name: "Vanilla ice cream", price: 0.50),
      ],
    ),
    Food(
      name: "Fruit Salad",
      description: "Mixed fresh fruit salad",
      imagePath: "lib/images/burgers/burger.png",
      price: 0.99,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Honey", price: 0.10),
        Addon(name: "Yogurt", price: 0.20),
      ],
    ),
  ];

  // Getters
  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;

  // user cart
  final List<CartItem> _cart = [];

  // Operations
  // add to cart,
  void addToCart(Food food, List<Addon> selectedAddons) {
    // check if there is a cart item have the same food and addons
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      // check food
      bool isSameFood = item.food == food;
      // check addons
      bool isSameAddons =
          const ListEquality().equals(item.selectedAddons, selectedAddons);
      return isSameAddons && isSameFood;
    });

    if (cartItem == null) {
      _cart.add(CartItem(food: food, selectedAddons: selectedAddons));
    } else {
      cartItem.quantity++;
    }
    notifyListeners();
  }

  // remove from cart,
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  double getTotalCartPrice() {
    double totalCart = 0.0;

    for (CartItem cartItem in _cart) {
      double totalItem = cartItem.food.price;
      for (Addon addon in cartItem.selectedAddons) {
        totalItem += addon.price;
      }
      totalCart += totalItem * cartItem.quantity;
    }
    return totalCart;
  }

  // get total item number,
  int getTotalItemNumber() {
    int totalItemNumber = 0;
    for (CartItem cartItem in _cart) {
      totalItemNumber += cartItem.quantity;
    }

    return totalItemNumber;
  }

  // clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  // Helpers
  // generate receipt,
  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here is your receipt.");
    receipt.writeln();

    // format the date
    String formattedDate =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("_______________");
    for (final cartItem in _cart) {
      receipt.writeln(
          "${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}}");
      if (cartItem.selectedAddons.isNotEmpty) {
        receipt
            .writeln("    Add-ons: ${_formatAddons(cartItem.selectedAddons)}");
      }
      receipt.writeln();
    }
    receipt.writeln("_______________");
    receipt.writeln();
    receipt.writeln("Total Item: ${getTotalItemNumber()}");
    receipt.writeln("Total Price: ${(_formatPrice(getTotalCartPrice()))}");

    return receipt.toString();
  }

  // format double into money,
  String _formatPrice(double price) {
    return "\$${price.toStringAsFixed(2)}";
  }

  // format list addons into a string summary
  String _formatAddons(List<Addon> addons) {
    return addons
        .map((addon) => "${addon.name}" "${_formatPrice(addon.price)}")
        .join(", ");
  }
}
