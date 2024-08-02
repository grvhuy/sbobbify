import 'package:flutter/material.dart';
import 'package:sbobbify/pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                  child: Center(
                child: Icon(
                  Icons.restaurant,
                  size: 72,
                  color: Theme.of(context).colorScheme.primary,
                ),
              )),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: ListTile(
                      title: const Text("HOME PAGE"),
                      leading: const Icon(Icons.home),
                      onTap: () {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: ListTile(
                      title: const Text("SETTINGS PAGE"),
                      leading: const Icon(Icons.home),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SettingsPage()));
                      },
                    ),
                  )
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: ListTile(
              title: const Text("LOG OUT"),
              leading: const Icon(Icons.home),
              onTap: () {},
            ),
          )
        ],
      ),
    );
  }
}
