import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/product_showcase_layout.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shopapp/providers/cart_provider.dart';
import 'package:shopapp/views/cart_item_list.dart';
import 'package:shopapp/views/searched_list.dart';
import 'package:shopapp/views/view_all_products.dart';
import 'package:shopapp/widgets/search_bar.dart';
import './product_details_view.dart';
import './data/product_data.dart';
import 'package:badges/badges.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        home: ShopApp(),
        routes: {
          ProductDetailsview.id: (context) => ProductDetailsview(),
          SearchedListView.id: (context) => SearchedListView(),
          ViewAllProducts.id: (context) => ViewAllProducts(),
          CartItemList.id: (context) => CartItemList()
        },
        theme: ThemeData(
          fontFamily: 'Montserrat',
        ),
      ),
    ),
  );
}

class ShopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [HexColor('#64E8DE'), HexColor('#00B8BA')]),
          ),
        ),
        bottom: PreferredSize(
          child: Container(
            padding: EdgeInsets.all(15),
            child: SearchBar(),
          ),
          preferredSize: Size(50, 90),
        ),
        backgroundColor: Colors.black87,
        title: Container(
          height: 50,
          child: Image(image: AssetImage('assets/images/pngegg.png')),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
            iconSize: 30,
            color: HexColor('#ffffff'),
          ),
          Consumer<CartProvider>(
            builder: (context, cart, child) {
              return cart.getCartItems.length == 0
                  ? IconButton(
                      icon: Icon(Icons.shopping_cart, size: 30),
                      onPressed: () {
                        Navigator.pushNamed(context, CartItemList.id);
                      },
                    )
                  : Badge(
                      position: BadgePosition.topEnd(top: 2, end: 2),
                      badgeContent: Text(
                        cart.getCartItems.length.toString(),
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.shopping_cart, size: 30),
                        onPressed: () {
                          Navigator.pushNamed(context, CartItemList.id);
                        },
                      ),
                    );
            },
          )
        ],
        elevation: 10,
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [HexColor('#64E8DE'), HexColor('#00B8BA')])),
        child: ListView(
          children: [
            Container(
              child: Image(image: AssetImage('assets/images/mainimage.jpg')),
            ),
            CarouselSlider(
              items: [
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: AssetImage('assets/images/banner2.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: AssetImage('assets/images/shoesale.jfif'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: AssetImage('assets/images/banner3.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
              options: CarouselOptions(
                height: 180.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 12,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 1,
              ),
            ),
            ProductShowcaseLayout(
                productList: Product_Data.mobileList,
                title: 'Top Rated Mobiles',
                listType: 'mobileList'),
            ProductShowcaseLayout(
                productList: Product_Data.laptopList,
                title: 'Best Selling Laptops',
                listType: 'mobileList'),
          ],
        ),
      ),
      drawer: Drawer(),
    ));
  }
}
