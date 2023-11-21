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

*** 
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


*** 

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


**3. List the form input elements you used in this assignment and explain why you used these input elements!**

In my assignment, several form input elements from Flutter were used to collect user input in the application:

1. TextFormField: This element is suitable for fields like the item name, amount, and description, where users need to type in text. It provides features like hint text, validation, and real-time updates.
   
2. ElevatedButton: The "Save" button is crucial for submitting the form. ElevatedButton is offering a visible and interactive button.
   
3. AlertDialog: An AlertDialog informs the user that the product has been saved.
    
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

The form also has an AppBar at the top, making it look nice with a title "Add Item Form" and a colored background. To make navigation easy, I added a left drawer to the page. The actual form is set up using a Form widget, and I used a SingleChildScrollView widget to allow for smooth scrolling if the form is long. Inside the form, I placed the input fields in a Column widget to keep things organized.
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
            'Add Item Form',
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

*** 

## Assignment 9

**1. Can we retrieve JSON data without creating a model first?**

Yes, we can retrieve JSON data without creating a model. Whether to use a model depends on how complicated the task is.

Retrieving JSON Data Without a Model:

1. Advantages:

• Quick and easy for simple tasks.

• Less code to write.

2. Drawbacks:
   
• Handling data may be messy.

• It might lead to mistakes without type safety.

Creating a Model:

1. Advantages:

• Makes data neat and organized.

• Helps avoid mistakes with type safety.

3. Drawbacks:
   
• Requires a bit more code to define the model.


**2. the function of CookieRequest**

CookieRequest is a crucial part of a Flutter application responsible for handling interactions with the internet. Sharing a single instance of CookieRequest across various components ensure everyone uses the same language and follows the same rules when dealing with the internet so it can prevent mistakes. This shared approach ensures that when the app communicates with the internet, everyone is on the same page, making things more efficient and easier to manage.

**3. the mechanism of fetching data from JSON until it can be displayed on Flutter**

1.	Add the HTTP Package:

Begin by adding the HTTP package to the Flutter project. We can do this by running the command:
```
flutter pub add http
```
This package allows the app to make HTTP requests.

2.	Make a Network Request:

Create a function, like fetchProduct(), to make an HTTP request to a server that provides data in JSON format. For example:
```
Future<List<Item>> fetchProduct() async {
  final request = context.watch<CookieRequest>();
  final response = await request.get('http://127.0.0.1:8000/json/');
}
```

3. Convert the Response into a Custom Dart Object:

Decode the received JSON data into Dart objects that Flutter can understand. We may define a Dart class, like Item, and use its fromJson method for this purpose.
```
List<Item> list_product = [];
for (var d in response) {
  if (d != null) {
    list_product.add(Item.fromJson(d));
  }
}
```

4. Fetch the Data:

Use the fetchProduct() function in a FutureBuilder to asynchronously fetch the data.

5. Displaying Data in Widgets:

Once the data is fetched, use Flutter widgets (e.g., ListView, GridView) to display it in the UI. This often involves mapping through the data and creating UI components.

**4. the authentication mechanism from entering account data on Flutter to Django authentication completion and the display of menus on Flutter**

1. Entering Account Data in Flutter: Users input their account details in the Flutter app.

2. Sending Data to Django: Flutter sends this data to Django using a secure HTTP request.

3. Django Authentication: Django validates the data, performs authentication, and may generate a token.

4. Authentication Completion: Django sends a response: success or failure.

5. Displaying Menus in Flutter: If successful, Flutter fetches user-specific data, like menus, and displays them.

6. Handling Authentication State: Flutter manages the authentication state, controlling navigation and UI based on it.


**5. all the widgets in this assignment**

1.	Scaffold:The overall structure that defines the visual elements of the page.
  
2. AppBar: Displays a navigation bar at the top of the screen.

3. Card:Represents a material design card. It contains information about the item.

4. Padding: Adds padding around the content within the Card.

5. Column: Arranges child widgets in a vertical column.

6. Text: Displays text.

7. SizedBox: Provides spacing between different Text widgets.

8. FloatingActionButton: Represents a floating action button, which, when pressed, navigates back to the item list page.

9. ListView.builder: A scrollable list of widgets. Dynamically creates items based on the length of the data.

10. GestureDetector: Wraps the ListTile to make it tappable, enabling navigation to the detail page when an item is tapped.

11. Container: Provides padding around the content within the login page.

12. ElevatedButton: Triggers the login process when pressed.

13. AlertDialog: Displays a pop-up dialog if login fails, providing details on why it failed.

14. SnackBar: Shows a message at the bottom of the screen when login is successful.

15. Provider: Initializes the CookieRequest instance using the Provider package.

16. LoginPage: Represents the initial screen where users can enter their login credentials.


**6. Steps in Implementing the Taks**

1. Create a login page in the Flutter project.

I created a new file named login.dart in the screen folder and added the following code:
```
import 'package:inventory_management/screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
              ),
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () async {
                String username = _usernameController.text;
                String password = _passwordController.text;

                // Check credentials
                // TODO: Change the URL and don't forget to add a trailing slash (/) at the end of the URL!
                // To connect the Android emulator to Django on localhost,
                // use the URL http://10.0.2.2/
                final response =
                    await request.login("http://127.0.0.1:8000/auth/login/", {
                  'username': username,
                  'password': password,
                });

                if (request.loggedIn) {
                  String message = response['message'];
                  String uname = response['username'];
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                  );
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                        SnackBar(content: Text("$message Welcome, $uname.")));
                } else {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Login Failed'),
                      content: Text(response['message']),
                      actions: [
                        TextButton(
                          child: const Text('OK'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  );
                }
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
```

In the main.dart file, in the MaterialApp(...) widget, I changed home: MyHomePage() to home: LoginPage()

2. Integrate the Django authentication system with the Flutter project.

Initially, I configured authentication in Django by creating a new app named 'authentication.' To ensure compatibility, I installed the necessary library using the command pip install django-cors-headers in the terminal. Then, I adjusted the settings.py file in my Django application.

After that, I created a new function in the 'authentication' app's views.py and added the path in the urls.py. 
```
@csrf_exempt
def login(request):
    username = request.POST['username']
    password = request.POST['password']
    user = authenticate(username=username, password=password)
    if user is not None:
        if user.is_active:
            auth_login(request, user)
            # Successful login status.
            return JsonResponse({
                "username": user.username,
                "status": True,
                "message": "Login successful!"
                # Add other data if you want to send data to Flutter.
            }, status=200)
        else:
            return JsonResponse({
                "status": False,
                "message": "Login failed, account disabled."
            }, status=401)

    else:
        return JsonResponse({
            "status": False,
            "message": "Login failed, check email or password again."
        }, status=401)
```

To fit this authentication setup into the whole project, I added the path 'auth/', include('authentication.urls') in the 'shopping_list' app's urls.py.

Once the setup was done, I run two packages for the Flutter app:
```
flutter pub add provider
flutter pub add pbp_django_auth
```

Following this, I made modifications to the main.dart file. I imported the required dependencies, including the login screen.
```
import 'package:flutter/material.dart';
import 'package:inventory_management/screens/login.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
            useMaterial3: true,
          ),
          home: LoginPage()),
    );
  }
}

```

3. Create a custom model according to your Django application project.

I created a new directory named 'model' and made a file named 'item.dart'. Next, I copied the code that I had previously generated using Quicktype and pasted it into 'item.dart':
```
import 'dart:convert';

List<Item> itemFromJson(String str) =>
    List<Item>.from(json.decode(str).map((x) => Item.fromJson(x)));

String itemToJson(List<Item> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Item {
  String model;
  int pk;
  Fields fields;

  Item({
    required this.model,
    required this.pk,
    required this.fields,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "model": [model],
        "pk": pk,
        "fields": fields.toJson(),
      };
}

class Fields {
  String name;
  DateTime dateAdded;
  int amount;
  String description;
  int user;

  Fields({
    required this.name,
    required this.dateAdded,
    required this.amount,
    required this.description,
    required this.user,
  });

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        name: json["name"],
        dateAdded: DateTime.parse(json["date_added"]),
        amount: json["amount"],
        description: json["description"],
        user: json["user"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "date_added":
            "${dateAdded.year.toString().padLeft(4, '0')}-${dateAdded.month.toString().padLeft(2, '0')}-${dateAdded.day.toString().padLeft(2, '0')}",
        "amount": amount,
        "description": description,
        "user": user,
      };
}
```
This Dart file helps with reading and writing JSON data according to a specific model for the Django app.

4. Create a page containing a list of all items available at the JSON endpoint in Django that you have deployed. Display the name, amount, and description of each item on this page.

I created a new file in the lib/screens directory with name list_item.dart and added the following code:
```
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
```

I Added the page list_item.dart to widgets/left_drawer.dart by adding this code:
```
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
```

I also changed the function of the "View Items" button on the shop_card page to redirect to the ProductPage:
```
else if (item.name == "View Items") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ProductPage()));
          } else if (item.name == "Logout") {

```

5. Create a detail page for each item listed on the Item list page.

• This page can be accessed by tapping on any item on the Item list page.

• Display all attributes of your item model on this page.

• Add a button to return to the item list page.

I created a new file in the screen folder named detail_item.dart and added the following code:
```
import 'package:flutter/material.dart';
import 'package:inventory_management/models/item.dart';

class ItemDetailPage extends StatelessWidget {
  final Item item;

  const ItemDetailPage({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Details'),
        backgroundColor: Color.fromARGB(255, 48, 150, 198),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Card(
          elevation: 10.0, // Add a shadow
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0), // Add rounded corners
          ),
          margin: const EdgeInsets.all(20.0),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  item.fields.name,
                  style: const TextStyle(
                    fontSize: 24.0, // Increase font size
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  "Amount: ${item.fields.amount}",
                  style: const TextStyle(fontSize: 18.0),
                ),
                const SizedBox(height: 15),
                Text(
                  "Description: ${item.fields.description}",
                  style: const TextStyle(fontSize: 18.0),
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context); // Return to the item list page
        },
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}
```

