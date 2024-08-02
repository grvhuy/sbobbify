import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sbobbify/models/restaurant.dart';

class MyReceipt extends StatelessWidget {
  const MyReceipt({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25, top: 50),
      child: Center(
        child: Column(
          children: [
            const Text("Thanks for your Order :)"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    borderRadius: BorderRadius.circular(8)),
                child: Consumer<Restaurant>(
                  builder: (context, restaurant, child) {
                    return Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text(restaurant.displayCartReceipt()),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
