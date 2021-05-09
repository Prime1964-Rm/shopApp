import 'package:flutter/material.dart';
import 'package:shopapp/data/product_data.dart';
import 'package:shopapp/model/product_details.dart';
import '../views/searched_list.dart';

class SearchBar extends StatelessWidget {
  final searchedText = TextEditingController();
  final List<ProductDetails> productList =
      Product_Data.laptopList + Product_Data.mobileList;

  @override
  Widget build(BuildContext context) {
    List<ProductDetails> filter(String searchedText) {
      return productList
          .where((element) => (element.productname
                  .toLowerCase()
                  .contains(searchedText.toLowerCase()) ||
              (element.description
                  .toLowerCase()
                  .contains(searchedText.toLowerCase()))))
          .toList();
    }

    return Container(
      color: Colors.white,
      child: TextField(
        controller: searchedText,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            suffixIcon: InkWell(
              child: Icon(Icons.search),
              onTap: () {
                if (searchedText.text.isNotEmpty)
                  Navigator.pushNamed(context, SearchedListView.id,
                      arguments: filter(searchedText.text));
              },
            ),
            hintText: 'Search'),
      ),
    );
  }
}
