import 'package:flutter/material.dart';
import 'package:shopapp/model/product_details.dart';
import 'package:shopapp/product_details_view.dart';
import 'package:shopapp/views/view_all_products.dart';
import './product_card.dart';

class ProductShowcaseLayout extends StatelessWidget {
  final List<ProductDetails> productList;
  final String title;
  final String listType;

  ProductShowcaseLayout({this.productList, this.title, this.listType});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title),
                FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, ViewAllProducts.id,
                          arguments: productList);
                    },
                    child: Row(
                      children: [Text('View All'), Icon(Icons.arrow_right)],
                    ))
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: productList
                  .map((e) => InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            ProductDetailsview.id,
                            arguments: e,
                          );
                        },
                        child: ProductCard(e),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
