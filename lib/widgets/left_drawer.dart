import 'package:flutter/material.dart';
import 'package:inventory_management/screens/menu.dart';
// DONE TODO: Import the ShopFormPage page here
import 'package:inventory_management/screens/shoplist_form.dart';
import 'package:inventory_management/screens/list_item.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 48, 150, 198),
            ),
            child: Column(
              children: [
                Text(
                  'shopVentory',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text(
                  "Write all your inventory list here!",
                  //DONE  TODO: Add a text style with center alignment, font size 15, white color, and regular weight
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home'),
            // redirect to MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_shopping_cart),
            title: const Text('Add Item'),
            // redirect to ShopFormPage
            onTap: () {
              /*
              DONE TODO: Create routing to ShopFormPage here
              */
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ShopFormPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_basket),
            title: const Text('Item List'),
            onTap: () {
              // Route menu to product page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProductPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
