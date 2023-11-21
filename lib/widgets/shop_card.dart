import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:inventory_management/screens/list_product.dart';
import 'package:inventory_management/screens/login.dart';
import 'package:inventory_management/screens/menu.dart';
import 'package:inventory_management/screens/shoplist_form.dart';

class ShopCard extends StatelessWidget {
  final InvItem item;
  const ShopCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    Color buttonColor;
    if (item.name == "Add Items") {
      buttonColor =
          Color.fromARGB(255, 186, 130, 149); // Change this color as needed
    } else if (item.name == "View Items") {
      buttonColor =
          Color.fromARGB(255, 116, 102, 164); // Change this color as needed
    } else if (item.name == "Logout") {
      buttonColor =
          Color.fromARGB(255, 85, 159, 196); // Change this color as needed
    } else {
      // Default color for other buttons
      buttonColor = Colors.cyan; // Change this color as needed
    }

    return Material(
      color: buttonColor,
      child: InkWell(
        // Responsive touch area
        onTap: () async {
          // Navigate to the appropriate route (depending on the button type)
          if (item.name == "Add Items") {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ShopFormPage()),
            );
          } else if (item.name == "View Items") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ProductPage()));
          } else if (item.name == "Logout") {
            final response =
                await request.logout("http://127.0.0.1:8000/auth/logout/");
            String message = response["message"];
            if (response['status']) {
              String uname = response["username"];
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("$message Good bye, $uname."),
              ));
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("$message"),
              ));
            }
          } else {
            // Show SnackBar for other buttons
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(
                  content: Text("You pressed the ${item.name} button!")));
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
