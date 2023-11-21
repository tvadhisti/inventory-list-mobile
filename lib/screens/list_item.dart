import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
import 'package:inventory_management/models/item.dart';
import 'package:inventory_management/widgets/left_drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:inventory_management/screens/detail_item.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  Future<List<Item>> fetchProduct() async {
    // final request = context.watch<CookieRequest>();
    // var url = Uri.parse("http://127.0.0.1:8000/auth/json/");
    // var response = await http.get(
    //   url,
    //   headers: {"Content-Type": "application/json"},
    // );
    final request = context.watch<CookieRequest>();
    final response = await request.get('http://127.0.0.1:8000/json/');

    // decode the response to JSON
    // var data = jsonDecode(utf8.decode(response.bodyBytes));

    // convert the JSON to Product object
    List<Item> list_product = [];
    for (var d in response) {
      if (d != null) {
        list_product.add(Item.fromJson(d));
      }
    }
    return list_product;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('View Items'),
          backgroundColor: Color.fromARGB(255, 48, 150, 198),
          foregroundColor: Colors.white,
        ),
        drawer: const LeftDrawer(),
        body: FutureBuilder(
            future: fetchProduct(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return const Column(
                    children: [
                      Text(
                        "No item data available.",
                        style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) => Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 12),
                      // Wrap the ListTile in a GestureDetector to make it tappable
                      child: GestureDetector(
                        onTap: () {
                          // Navigate to the detail page when an item is tapped
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ItemDetailPage(item: snapshot.data![index]),
                            ),
                          );
                        },
                        child: ListTile(
                          title: Text(
                            "${snapshot.data![index].fields.name}",
                            style: const TextStyle(
                              fontSize: 23.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                              "Amount: ${snapshot.data![index].fields.amount} \nDescription: ${snapshot.data![index].fields.description}"),
                        ),
                      ),
                    ),
                  );
                }
              }
            }));
  }
}
