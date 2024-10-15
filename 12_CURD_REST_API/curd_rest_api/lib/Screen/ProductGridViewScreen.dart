import 'package:curd_rest_api/Style/Style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../RestAPI/RectClient.dart';


class ProductGridViewScreen extends StatefulWidget {
  const ProductGridViewScreen({super.key});

  @override
  State<ProductGridViewScreen> createState() => _ProductGridViewScreen();
}

class _ProductGridViewScreen extends State<ProductGridViewScreen> {

  List ProductList = [];
  bool Loading = true;

  @override
  void initState(){
    CallDate();
    super.initState();
  }

  CallDate() async {
    Loading = true;
    var data = await ProductGridViewListRequest();
    setState(() {
      ProductList = data;
      Loading = false;
    });
  }

  DeleteItem(id) async {
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("Delete"),
            content: Text("Once Delete, You Cant get it Back"),
            actions: [
              OutlinedButton(
                  onPressed: (){},
                  child: Text("YES")
              ),
              OutlinedButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text("NO")
              ),
            ],
          );
         }
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue, // Set app bar color to blue
        centerTitle: true, // Center the title
        title: const Text(
          "List Product",
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
      drawer: Drawer(),
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
            child: Loading?(Center(child: CircularProgressIndicator())): RefreshIndicator(
                onRefresh: () async {
                  await CallDate();
                },
                child: GridView.builder(
                        gridDelegate: ProductGridViewStyle(),
                        itemBuilder: (context, index){
                          return Card( // card for each grid
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch, // stretch will fit each grid in X-Y Axis
                              children: [
                                Expanded(child: Image.network(ProductList[index]['img'],fit: BoxFit.fill,)),
                                Container(
                                  padding: EdgeInsets.fromLTRB(5, 5, 5, 8),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(ProductList[index]['ProductName']),
                                      SizedBox(height: 7),
                                      Text("Price: "+ProductList[index]['unitPrice']+" BDT"),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          OutlinedButton(onPressed: (){

                                          }, child: Icon(CupertinoIcons.ellipsis_vertical_circle, size: 18,color: colorGreen,)),
                                          SizedBox(width: 4,),
                                          OutlinedButton(onPressed: (){
                                            DeleteItem(ProductList[index]['-id']);
                                          },
                                              child: Icon(CupertinoIcons.delete, size: 18,color: colorGreen,))
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],

                            ),

                          );

                        }
                    ),
                )
          )

        ],
      ),

    );

  }
}
