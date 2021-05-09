import 'package:flutter/material.dart';
import 'package:shopapp/data/product_data.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shopapp/model/product_details.dart';
import 'package:shopapp/product_details_view.dart';

class ViewAllProducts extends StatelessWidget {
  static String id = 'viewAllProducts';
  @override
  Widget build(BuildContext context) {
    final List<ProductDetails> productList =
        ModalRoute.of(context).settings.arguments as List<ProductDetails>;
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [HexColor('#64E8DE'), HexColor('#00B8BA')]),
          ),
        ),
        title: Text(
          'Top Rated Mobiles',
          style: TextStyle(fontWeight: FontWeight.w200),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: GridView(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200, //width
              crossAxisSpacing: 5, ////horizontal space bt two tiles
              // mainAxisExtent: 100, //height
              mainAxisSpacing: 5, //vertical space bt two tiles
              childAspectRatio: 3 / 4),
          children: productList
              .map(
                (e) => InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, ProductDetailsview.id,
                        arguments: e);
                  },
                  child: Card(
                    child: Container(
                      padding: EdgeInsets.all(5),
                      child: Column(
                        children: [
                          Image(
                            height: 135,
                            image: AssetImage(e.imageList[0]),
                            fit: BoxFit.fill,
                          ),
                          Text(
                            e.productname,
                            style: TextStyle(fontWeight: FontWeight.w800),
                            textAlign: TextAlign.left,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Rating : ',
                                style: TextStyle(fontWeight: FontWeight.w800),
                              ),
                              Chip(
                                backgroundColor: HexColor('#00B8BA'),
                                label: Text(
                                  '4.5',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Price : ',
                                style: TextStyle(fontWeight: FontWeight.w800),
                              ),
                              Text('\$ ${e.price}')
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
              .toList(),

          // GridTile(child: )
        ),
      ),
    );
  }
}
