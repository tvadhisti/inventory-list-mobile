import 'package:flutter/material.dart';
import 'package:inventory_management/widgets/shop_card.dart';
import 'package:inventory_management/widgets/left_drawer.dart';
import 'package:inventory_management/screens/shoplist_form.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final List<InvItem> items = [
    InvItem("View Items", Icons.checklist,
        Color.fromARGB(255, 186, 130, 149)), // Set the color for each item
    InvItem("Add Items", Icons.add_shopping_cart,
        Color.fromARGB(255, 116, 102, 164)),
    InvItem("Logout", Icons.logout, Color.fromARGB(255, 47, 129, 196)),
  ];

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'shopVentory',
        ),
      ),
      drawer: const LeftDrawer(),
      body: SingleChildScrollView(
        // Scrolling wrapper widget
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Set padding for the page
          child: Column(
            // Widget to display children vertically
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                // Text widget to display text with center alignment and appropriate style
                child: Text(
                  'Inventory Management', // Text indicating the shop name
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Grid layout
              GridView.count(
                // Container for our cards.
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map<Widget>((InvItem item) {
                  return ShopCard(item, onTap: () {
                    if (item.name == 'Add Items') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ShopFormPage()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content:
                                Text("You clicked the ${item.name} button!")),
                      );
                    }
                  });
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ShopCard extends StatelessWidget {
  final InvItem item;
  final VoidCallback onTap;

  const ShopCard(this.item, {required this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.buttonColor,
      child: InkWell(
        // Responsive touch area
        onTap: onTap,
        child: Container(
          // Container to hold Icon and Text
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InvItem {
  final String name;
  final IconData icon;
  final Color buttonColor;

  InvItem(this.name, this.icon, this.buttonColor);

  // Rest of the class remains the same
}
