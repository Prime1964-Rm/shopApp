import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lottie/lottie.dart';
import 'package:shopapp/data/product_data.dart';
import 'package:shopapp/model/product_details.dart';
import 'package:shopapp/product_details_view.dart';

class SearchedListView extends StatelessWidget {
  static String id = 'searchedListView';

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
      ),
      body: Container(
        child: productList.length == 0
            ? Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Image(image: AssetImage('assets/images/notfound.png')),
                  LottieBuilder.asset('assets/lottie_notfound.json'),
                  Text(
                    'Sorry!! No Product Found',
                    style: TextStyle(fontSize: 20, color: Colors.black87),
                  ),
                ],
              ))
            : ListView(
                children: productList
                    .map(
                      (e) => InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, ProductDetailsview.id,
                              arguments: e);
                        },
                        child: Card(
                          // elevation: 5,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              leading: Image(
                                image: AssetImage(e.imageList[0]),
                              ),
                              title: Text(e.productname),
                              subtitle: Row(
                                children: [
                                  Text('Rating : '),
                                  Chip(
                                    label: Text(
                                      '4.6',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w800),
                                    ),
                                    backgroundColor: HexColor('#00B8BA'),
                                  )
                                ],
                              ),
                              trailing: Text(
                                'INR ' + e.price.toString(),
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'CormorantGaramond',
                                    color: Colors.black54),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
      ),
    );
  }
}
