# inventory_management

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


## Assignment 7

**1. Stateless Widget vs Stateful Widget in Flutter**

A stateless widget does not change after it is created, these widgets are immutable. It is like a picture that always looks the same. It can show information, icons, buttons, etc., but those things will not change while we are using the app. It is good for showing fixed information or elements that do not change as we use the app.

A stateful widget can change while we are using the app, these states are mutable and can be changed multiple times in their lifetime. It is used for dynamic and interactive elements, like checkboxes, sliders, forms, and more. For example we are building a to-do list app. Users can add, complete, or delete tasks. Since the task list changes as users interact with the app, we would use a stateful widget to manage and display the list.

**2. Widgets that Used in This Assignment**

I used several widgets in this project:

1. MyApp (Stateless Widget): It is the starting point for the app, The MaterialApp widget here is used to set up the app's overall structure, controlling things like the app's title, theme, and initial page. This is like the app's basic setup.

2. MyHomePage (Stateless Widget): This is the main part representing the home page. It is the foundation for the page's layout and contains various widgets:

  * Scaffold: Provides the overall structure of the page, including the app bar and body.
  
  * AppBar: It is the top bar with a title.
  
  * SingleChildScrollView: It enables scrolling if the content does not fit on the screen.
  
  * Padding: Adds padding around the content.
  
  * Column: Organizes child widgets vertically.
  
  * GridView.count: Creates a grid layout for the ShopCard widgets.

3. ShopCard (Stateless Widget): This is used to display cards with icons and text and allows user interaction. Inside, there are more widgets:
   
  * Material: This widget provides the background color for the card.

  * InkWell: It is responsible for adding interactivity to the card. 
  
  * Container: The Container widget is like a box that holds the card's content. It allows us to add padding and organize the card's elements.
  
  * Icon: This is used to display an icon on the card.
  
  * Text: It displays the text content on the card.
  

**3. Steps in Implelementing the Task**

1. Create a new Flutter application with the inventory theme.

To do this, I opened my terminal and executed the following command:
```
flutter create inventory_management
```

After creating the app, then I verify that it runs correctly.

Next, I opened the code in Visual Studio Code and made the following modifications:

* I created a new file named menu.dart inside the lib directory and import the necessary Flutter package:
```
import 'package:flutter/material.dart';
```

* I moved several lines of code from main.dart to menu.dart and add the following import statement at the top of main.dart:
```
  import 'package:shopping_list/menu.dart';
```

* I changed the home property in main.dart from ```home: const MyHomePage(title: 'Flutter Demo Home Page'),```  to ```home: MyHomePage(),```

* I modified the color theme by replacing a line of code with ```primarySwatch: Colors.indigo,``` in main.dart

* I replaced the constructor in menu.dart from ```({super.key, required this.title})``` to ```({Key? key}) : super(key: key);``` Also, I removed the State class located below the Stateless widget section.


2. Create 3 simple buttons

I created three simple buttons by defining the item type in my list:

```
class InvItem {
  final String name;
  final IconData icon;
  final Color buttonColor;

  InvItem(this.name, this.icon, this.buttonColor);

  // Rest of the class remains the same
}
```

Next, I added the items:
```
final List<InvItem> items = [
    InvItem("View Items", Icons.checklist,
        Colors.blue), // Set the color for each item
    InvItem("Add Items", Icons.add_shopping_cart, Colors.green),
    InvItem("Logout", Icons.logout, Colors.red),
  ];
```

Then, i added the following code inside the Widget build method:
```
return Scaffold(
      appBar: AppBar(
        title: const Text(
          'shopVentory',
        ),
      ),
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
                children: items.map((InvItem item) {
                  // Iteration for each item
                  return ShopCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
```

Finally, I created a new Stateless widget named ShopCard to display the card:

```
class ShopCard extends StatelessWidget {
  final InvItem item;

  const ShopCard(this.item, {Key? key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.buttonColor,
      child: InkWell(
        // Responsive touch area
        onTap: () {
          // Show a SnackBar when clicked
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("You clicked the ${item.name} button!")));
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
```

3. Create a Snackbar with texts

To implement this I added the following code in the previous stateless widget:
```
child: InkWell(
        // Responsive touch area
        onTap: () {
          // Show a SnackBar when clicked
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("You clicked the ${item.name} button!")));
        },
```




## Assignment 8

**1. ```Navigator.push()``` vs ```Navigator.pushReplacement()```**

In Flutter, when you want to move from one screen to another, we can use Navigator.push() to add a new screen on top. It is like stacking papers, and we can go back to the previous one with a back button. For example, we'd use it like this:
```
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => ShopFormPage()),
);
```
Now, if we want to replace the current screen entirely with a new one, so there is no going back, we'd use Navigator.pushReplacement(). It is like swapping one paper for another:
```
Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => ShopFormPage()),
);
```

**2. Layout Widget in Flutter and Their Respective Usage Contexts**

1. Container:  A flexible widget that can hold other widgets.

2. Gridview: Organizes children in a two-dimensional grid.

3. Card: Constructs a material design card with rounded corners.

4. ListView: Presents a scrolling, linear list of widgets.

5. Row and Column: Ideal for linear arrangements of widgets.

6. Stack: Overlays widgets on top of each other.

7. Wrap: Wraps children to the next line when reaching the screen edge.

8. Expanded and Flexible:

  • Expanded: Occupies available space and enables its child to expand.

  • Flexible: Similar to Expanded but provides additional customization.
   
10. SizedBox: Sets a fixed size for its child or enforces a minimum/maximum size.
    
11. Flow: Arranges children in a flow layout algorithm.
    
13. AspectRatio: Enforces a specific aspect ratio for its child.




**4. Clean Architecture in A Flutter**

In Flutter, Clean Architecture means arranging our code in different layers so it is easier to manage and test. There are several layers:

1. Domain layer: This is where we define the main rules of the application
   
3. Data layer: It deals with external data, such as data from the internet or databases
   
5. Framework layer: This layer contains Flutter-specific code, like UI components
   
7. Dependency rule: This ensures a clean and modular structure by specifying the direction of dependencies
   
9. Testing: Involves checking if different layers work correctly
    
11. Presentation Layer (Optional): This layer focuses on how things look
    
13. Design Patterns: Refers to the use of design patterns to achieve clean code


**5. Steps in Implementing the Task**

1. Create at least one new page in the application, a page for adding a new item

I made a new page in the app where users can add a new item. To do this, I created a file called "shoplist_form.dart" and added some code to it. This code includes things like importing necessary Flutter components and defining a page called ShopFormPage. Inside this page, I set up a form with fields for the product's name, amount, and description.

The form also has an AppBar at the top, making it look nice with a title "Add Product Form" and a colored background. To make navigation easy, I added a left drawer to the page. The actual form is set up using a Form widget, and I used a SingleChildScrollView widget to allow for smooth scrolling if the form is long. Inside the form, I placed the input fields in a Column widget to keep things organized.
```
import 'package:flutter/material.dart';
import 'package:inventory_management/widgets/left_drawer.dart';

class ShopFormPage extends StatefulWidget {
  const ShopFormPage({super.key});

  @override
  State<ShopFormPage> createState() => _ShopFormPageState();
}

class _ShopFormPageState extends State<ShopFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _amount = 0;
  String _description = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Add Product Form',
          ),
        ),
        backgroundColor: Colors.cyan,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
child: Column(),)
	),
	);
	}
	}
```

I added more details to the form by putting in three boxes for users to fill in. Each box is for the item's name, amount, and description.

For the item's name, there's a box with a hint like "Item Name" and a label saying the same. It also has a border to make it look nice. When users type in something, it updates the name. If they leave it empty, there's a message saying "Name cannot be empty!"

I did the same thing for the amount box and the description box. The amount box takes numbers, and the description box is for adding more details about the item. The validation checks make sure these boxes aren't left empty, and if they are, it gives a message accordingly.

This makes the form more complete, and users can now enter the name, amount, and description of the item they want to add.

```
child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: "Item Name",
          labelText: "Item Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        onChanged: (String? value) {
          setState(() {
            _name = value!;
          });
        },
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return "Name cannot be empty!";
          }
          return null;
        },
      ),
    ),
    // Additional TextFormField for Amount
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: "Amount",
          labelText: "Amount",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        onChanged: (String? value) {
          setState(() {
            _amount = int.parse(value!);
          });
        },
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return "Amount cannot be empty!";
          }
          return null;
        },
      ),
    ),
    // Additional TextFormField for Description
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: "Description",
          labelText: "Description",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        onChanged: (String? value) {
          setState(() {
            _description = value!;
          });
        },
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return "Description cannot be empty!";
          }
          return null;
        },
      ),
    ),
  ],
),
```

I included a "Save" button to the form, which is designed with an ElevatedButton wrapped in Padding and Align for proper placement. Inside the onPressed() section of the button, I implemented the showDialog() function to display an AlertDialog widget. This AlertDialog confirms that the product has been successfully saved and shows the entered details such as the name, amount, and description. Additionally, a function is added to reset the form.
```
Align(
  alignment: Alignment.bottomCenter,
  child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.cyan),
      ),
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Product successfully saved'),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Name: $_name'),
                      Text('Amount: $_amount'),
                      Text('Description: $_description'),
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                    child: const Text('OK'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            },
          );
          // Add a function to reset the form here if needed
        }
      },
      child: const Text(
        "Save",
        style: TextStyle(color: Colors.white),
      ),
    ),
  ),
),
```

To enable navigation from the menu, I updated the children in the myhomepage class in menu.dart. The modification includes using the Navigator.push method to navigate to the ShopFormPage when the "Add Items" button is clicked.
```
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
          content: Text("You clicked the ${item.name} button!"),
        ),
      );
    }
  });
}).toList(),
```

Additionally, the onTap property in the ShopCard class is now set to onTap, ensuring that the onTap function passed as a parameter is called when the card is tapped.

2. Create a drawer in the application

I created a new file called "left_drawer.dart" and added code for a Drawer widget, importing necessary packages and the ShopFormPage. The Drawer includes a header with the app name and a brief description. Two ListTiles are added for navigation - one leading to the Homepage (MyHomePage) and the other leading to the Add Item page (ShopFormPage). The onTap functions use the Navigator to replace the current page with the respective destination.
```
import 'package:flutter/material.dart';
import 'package:inventory_management/screens/menu.dart';
import 'package:inventory_management/screens/shoplist_form.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({Key? key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.cyan,
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
            title: const Text('Homepage'),
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
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ShopFormPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
```

In menu.dart, I imported the LeftDrawer widget and added it to the Scaffold drawer property.
```
import 'package:inventory_management/widgets/left_drawer.dart';

...

Scaffold(
  drawer: const LeftDrawer(),
  // Other Scaffold properties...
);
```
Now, the drawer is included in the menu, providing easy navigation to the Homepage and Add Item page.
