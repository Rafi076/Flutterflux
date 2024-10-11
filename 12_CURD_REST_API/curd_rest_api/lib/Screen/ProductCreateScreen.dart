import 'package:curd_rest_api/Style/Style.dart';
import 'package:flutter/material.dart';

class ProductCreateScreen extends StatefulWidget {
  @override
  State<ProductCreateScreen> createState() => _ProductcreatescreenState();
}

class _ProductcreatescreenState extends State<ProductCreateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue, // Set app bar color to blue
        centerTitle: true, // Center the title
        title: const Text(
          "AppBar",
          style: TextStyle(
            color: Colors.black, // Set text color to black
            fontWeight: FontWeight.bold, // Set text to bold
          ),
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu, color: Colors.black), // Drawer icon
            onPressed: () {
              Scaffold.of(context).openDrawer(); // Open drawer when pressed
            },
          ),
        ),
      ),

      // drawer calss
      drawer: Drawer(),
       body: Stack(
        children: [
          // Background Graphics
          ScreenBackground(context),
          Container(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  TextFormField(
                    decoration: AppInputDecoration('Product Name'),
                      onChanged: (value){}
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                      decoration: AppInputDecoration('Product Code'),
                      onChanged: (value){}
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                      decoration: AppInputDecoration('Product Image'),
                      onChanged: (value){}
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                      decoration: AppInputDecoration('Product Unit Price'),
                      onChanged: (value){}
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                      decoration: AppInputDecoration('Product Total Price'),
                      onChanged: (value){}
                  ),
                  const SizedBox(height: 20),                ],
              ),
            ),
          )
        ],

       ),

    );
  }
}
