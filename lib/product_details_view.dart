import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
// import 'dart:math';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/model/cart_item.dart';
import 'package:shopapp/model/product_details.dart';
import 'package:shopapp/providers/cart_provider.dart';
// import 'package:carousel_slider/carousel_slider.dart';
import './providers/cart_provider.dart';

class ProductDetailsview extends StatefulWidget {
  static String id = 'productdetailview';

  // ProductDetailsview({this.productDetails});
  @override
  _ProductDetailsviewState createState() => _ProductDetailsviewState();
}

class _ProductDetailsviewState extends State<ProductDetailsview> {
  PageController _pageController = PageController();
  double currentPage = 0;
  var likeStatus = false;

  @override
  void initState() {
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ProductDetails productDetails =
        ModalRoute.of(context).settings.arguments as ProductDetails;
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [HexColor('#64E8DE'), HexColor('#00B8BA')])),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
            height: 350,
            child: PageView(
              scrollDirection: Axis.horizontal,
              controller: _pageController,
              children: productDetails.imageList
                  .map(
                    (e) => Container(
                      margin: EdgeInsets.fromLTRB(6, 0, 6, 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage(e),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          DotsIndicator(
            position: currentPage,
            dotsCount: productDetails.imageList.length,
          ),
          Container(
            // padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 65,
                  child: Card(
                    elevation: 7,
                    shape: CircleBorder(),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          likeStatus = !likeStatus;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
                        child: Image(
                          height: 30,
                          image: AssetImage(likeStatus
                              ? 'assets/images/heartfilled.png'
                              : 'assets/images/heart.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 65,
                  child: Card(
                    elevation: 7,
                    shape: CircleBorder(),
                    child: InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Center(
                          child: Image(
                            height: 30,
                            image: AssetImage('assets/images/share.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Price :  ',
                      style: TextStyle(
                          fontFamily: 'Cormorant Garamond',
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Colors.black),
                    ),
                    Text(
                      '₹ ' + productDetails.price.toString(),
                      style: TextStyle(
                          fontFamily: 'Cormorant Garamond',
                          fontSize: 30,
                          fontWeight: FontWeight.w300,
                          color: Colors.teal),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Text(
                      'Product Name : ',
                      style: TextStyle(
                          fontFamily: 'Ubuntu',
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Colors.black),
                    ),
                    Text(
                      productDetails.productname,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Description : ',
                  style: TextStyle(
                      fontFamily: 'Ubuntu',
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  productDetails.description,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w200),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  child: RaisedButton(
                    padding: EdgeInsets.all(10),
                    onPressed: () {},
                    color: Colors.amber,
                    child: Text(
                      'Buy Now',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: RaisedButton(
                    padding: EdgeInsets.all(10),
                    onPressed: () {
                      // final List<CartItem> cartItemList =
                      //     Provider.of<CartProvider>(context).getCartItems;
                      // CartItem temp = cartItemList.firstWhere(
                      //     (element) => element.id == productDetails.productid);
                      // CartItem cartItem;
                      // if (temp != null) {
                      //   cartItem = new CartItem(
                      //       productName: productDetails.productname,
                      //       id: productDetails.productid,
                      //       quantity: temp.quantity + 1);
                      // } else {
                      //   cartItem = new CartItem(
                      //       productName: productDetails.productname,
                      //       id: productDetails.productid,
                      //       quantity: 0);
                      // }

                      CartItem cartItem = new CartItem(
                        productName: productDetails.productname,
                        id: productDetails.productid,
                        basePrice: productDetails.price,
                        imageLink: productDetails.imageList[0],
                      );

                      Provider.of<CartProvider>(context, listen: false)
                          .addItem(cartItem);
                    },
                    color: Colors.amber[900],
                    child: Text(
                      'Add To Cart',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
