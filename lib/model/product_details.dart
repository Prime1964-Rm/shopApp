class ProductDetails {
  final List<String> imageList;
  final String productid;
  final String productname;
  final double price;
  final String description;
  final bool isFavorite;

  ProductDetails(
      {this.imageList,
      this.productid,
      this.productname,
      this.description,
      this.price,
      this.isFavorite});
}
