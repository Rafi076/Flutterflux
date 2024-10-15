import 'package:flutter/cupertino.dart';

import '../RestAPI/RectClient.dart';


class ProductGridViewScreen extends StatefulWidget {
  const ProductGridViewScreen({super.key});

  @override
  State<ProductGridViewScreen> createState() => _ProductGridViewScreen();
}

class _ProductGridViewScreen extends State<ProductGridViewScreen> {

  List ProductList = [];
  bool isLoading = true;

  CallDate() async {
    isLoading = true;
    var data = await ProductGridViewListRequest();
    setState(() {
      ProductList = data;
      isLoading = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return const Placeholder();

  }
}
