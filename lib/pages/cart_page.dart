import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sbobbify/components/my_button.dart';
import 'package:sbobbify/components/my_cart_tile.dart';
import 'package:sbobbify/models/restaurant.dart';
import 'package:sbobbify/pages/payment_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) {
        // cart
        final userCart = restaurant.cart;

        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.primary,
          appBar: AppBar(
            title: const Text("My Cart"),
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
            actions: [
              IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: const Text(
                                  "Are you sure you want to remove all items in cart ?"),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      restaurant.clearCart();
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Yes")),
                                TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text("No"))
                              ],
                            ));
                    userCart.clear();
                  },
                  icon: const Icon(Icons.delete))
            ],
          ),
          body: Column(
            children: [
              Expanded(
                  child: ListView.builder(
                      itemCount: userCart.length,
                      itemBuilder: (context, index) {
                        // detail item in cart
                        final cartItem = userCart[index];

                        return MyCartTile(cartItem: cartItem);
                      })),
              MyButton(
                  text: "Go To Checkout",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PaymentPage()));
                  }),
              const SizedBox(
                height: 25,
              )
            ],
          ),
        );
      },
    );
  }
}
