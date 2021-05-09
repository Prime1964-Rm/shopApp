class CartItem {
  final String productName;
  final double basePrice;
  int quantity;
  final String id;
  final String imageLink;
  final double totalPrice;

  CartItem(
      {this.productName,
      this.basePrice,
      this.quantity,
      this.id,
      this.imageLink,
      this.totalPrice});
}
