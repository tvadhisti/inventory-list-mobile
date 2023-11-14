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

