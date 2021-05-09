import 'package:flutter/material.dart';
import 'package:shopapp/model/product_details.dart';

class ProductCard extends StatelessWidget {
  // final String productid;
  // final String productname;
  // final double price;
  // final String description;
  // final String imagelink;

  // ProductCard(
  //     {this.imagelink,
  //     this.productid,
  //     this.productname,
  //     this.description,
  //     this.price});

  ProductDetails productDetails;
  ProductCard(this.productDetails);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                height: 140,
                width: 150,
                margin: EdgeInsets.only(bottom: 5),
                //  padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
                child: Image(
                  image: AssetImage(productDetails.imageList[0]),
                ),
              ),
              Text(
                productDetails.productname,
                style: TextStyle(fontFamily: 'Montserrat', fontSize: 20),
              ),
              Text('\$ ${productDetails.price}')
            ],
          ),
        ),
      ),
    );
  }
}
