import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/cart_provider.dart';
import '../model/cart_item.dart';
import 'package:hexcolor/hexcolor.dart';

class CartItemList extends StatelessWidget {
  static String id = 'cartItemList';
  // int quantity = 1;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context, listen: true);
    return Scaffold(
        appBar: AppBar(
          title: Text('Cart'),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [HexColor('#64E8DE'), HexColor('#00B8BA')]),
            ),
          ),
        ),
        body: cart.getCartItems.length == 0
            ? Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LottieBuilder.asset('assets/emptycart1.json'),
                  Text(
                    'Your cart is empty',
                    style: TextStyle(fontSize: 20, color: Colors.black87),
                  ),
                ],
              ))
            : Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * .7,
                    child: ListView.builder(
                      itemBuilder: (ctx, index) {
                        return Card(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                child: Image(
                                  height: 150,
                                  width: 150,
                                  image: AssetImage(cart.getCartItems.values
                                      .toList()[index]
                                      .imageLink),
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      width: 90,
                                      child: Text(cart.getCartItems.values
                                          .toList()[index]
                                          .productName)),
                                  SizedBox(height: 8),
                                  Text(
                                      '\$ ${cart.getCartItems.values.toList()[index].totalPrice.toString()}'),
                                  Chip(
                                    label: Text('4.5'),
                                    avatar: Icon(
                                      Icons.star,
                                      size: 20,
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text('Quantity : '),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                          icon: cart.getCartItems.values
                                                      .toList()[index]
                                                      .quantity ==
                                                  1
                                              ? Icon(
                                                  Icons.delete,
                                                )
                                              : Icon(Icons.remove),
                                          splashRadius: 20,
                                          onPressed: () {
                                            if (cart.getCartItems.values
                                                    .toList()[index]
                                                    .quantity ==
                                                1) {
                                              cart.removeItem(cart
                                                  .getCartItems.values
                                                  .toList()[index]
                                                  .id);
                                            } else {
                                              //decrease it
                                              cart.decreaseQuantity(cart
                                                  .getCartItems.values
                                                  .toList()[index]);
                                            }
                                          },
                                          // icon: Icon(Icons.delete),
                                        ),
                                        Text(cart.getCartItems.values
                                            .toList()[index]
                                            .quantity
                                            .toString()),
                                        IconButton(
                                          icon: Icon(Icons.add),
                                          splashRadius: 20,
                                          onPressed: () {
                                            cart.increaseQuantity(cart
                                                .getCartItems.values
                                                .toList()[index]);
                                          },
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                      itemCount: cart.getCartItems.length,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Card(
                        child: Column(
                      children: [
                        ListTile(
                          leading: Text('Total Price :'),
                          trailing:
                              Text('\$ ${cart.getTotalPrice().toString()}'),
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
                      ],
                    )),
                  ),
                ],
              ));
  }
}
