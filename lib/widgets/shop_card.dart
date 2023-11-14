import 'package:flutter/material.dart';
import 'package:inventory_management/screens/menu.dart';
import 'package:inventory_management/screens/shoplist_form.dart';

class ShopCard extends StatelessWidget {
  final InvItem item;

  const ShopCard(this.item, {Key? key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.cyan,
      child: InkWell(
        // Responsive touch area
        onTap: () {
          // Show SnackBar when clicked
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("You pressed the ${item.name} button!")));

          // Navigate to the appropriate route (depending on the button type)
          if (item.name == "Add Product") {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ShopFormPage()),
            );
            // DONE TODO: Use Navigator.push to navigate to a MaterialPageRoute that encompasses ShopFormPage.
          }
        },
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
