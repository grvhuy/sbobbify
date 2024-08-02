import 'package:flutter/material.dart';

class MyDescriptionBox extends StatelessWidget {
  const MyDescriptionBox({super.key});

  @override
  Widget build(BuildContext context) {
    var myPrimaryTextStyle =
        TextStyle(color: Theme.of(context).colorScheme.primary);

    var mySecondaryTextStyle =
        TextStyle(color: Theme.of(context).colorScheme.inversePrimary);

    return Container(
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.only(top: 10,left: 8, right: 8, bottom: 25),
      decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.secondary),
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // delivery fee
          Column(
            children: [
              Text('\$0.99', style: myPrimaryTextStyle),
              Text("Delivery Fee", style: mySecondaryTextStyle)
            ],
          ),
          Column(
            children: [
              Text(
                '15 - 30 mins',
                style: myPrimaryTextStyle,
              ), // time
              Text("Delivery Time", style: mySecondaryTextStyle) //
            ],
          )
          // delivery time
        ],
      ),
    );
  }
}
