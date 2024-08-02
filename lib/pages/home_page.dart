import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sbobbify/components/my_current_location.dart';
import 'package:sbobbify/components/my_description_box.dart';
import 'package:sbobbify/components/my_drawer.dart';
import 'package:sbobbify/components/my_food_tile.dart';
import 'package:sbobbify/components/my_sliver_app_bar.dart';
import 'package:sbobbify/components/my_tab_bar.dart';
import 'package:sbobbify/models/food.dart';
import 'package:sbobbify/models/restaurant.dart';
import 'package:sbobbify/pages/food_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: FoodCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Food> _filterMenuByCategory(FoodCategory category, List<Food> menu) {
    return menu.where((food) => food.category == category).toList();
  }

  // return the list of foods in given category

  List<Widget> getFoodByCategory(List<Food> fullMenu) {
    return FoodCategory.values.map((category) {
      List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);
      return ListView.builder(
          itemCount: categoryMenu.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder:  (context, index) {
            // get individual food
            final food = categoryMenu[index];
            return MyFoodTile(
              food: food,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FoodPage(food: food))
              ),
            );
          });
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      drawer: const MyDrawer(),
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
                MySliverAppBar(
                  title: MyTabBar(tabController: _tabController),
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 75,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Divider(
                            indent: 25,
                            endIndent: 25,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        // Current location
                        const MyCurrentLocation(),
                        // description box
                        const MyDescriptionBox(),
                      ],
                    ),
                  ),
                ),
              ],
          body: Consumer<Restaurant>(
            builder: (context, restaurant, child) {
              return TabBarView(
                  controller: _tabController,
                  children: getFoodByCategory(restaurant.menu));
            },
          )),
    );
  }
}
