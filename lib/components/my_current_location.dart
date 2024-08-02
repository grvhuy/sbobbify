import 'package:flutter/material.dart';

class MyCurrentLocation extends StatelessWidget {
  const MyCurrentLocation({super.key});

  void openLocationSearchBox(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text("Location"),
              content: const TextField(
                decoration: InputDecoration(hintText: "Search address"),
              ),
              actions: [
                // Cancel
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel"),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Save"),
                )
                // OKay
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Delivery Now"),
        GestureDetector(
          onTap: () => openLocationSearchBox(context),
          child: Row(

            children: [
              // Address
              Text(
                "A Dorm VNUHCM",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
              // dropdown menu
              const Icon(Icons.keyboard_arrow_down)
            ],
          ),
        )
      ],
    );
  }
}
