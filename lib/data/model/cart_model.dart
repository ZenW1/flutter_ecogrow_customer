class CartModel {
  const CartModel({
    required this.id,
    required this.storeName,
    required this.products,
  });
  final String id;
  final String storeName;
  final List<CartProductModel> products;
}

class CartProductModel {
  const CartProductModel({
    required this.id,
    required this.productName,
    required this.productImage,
    required this.productPrice,
    required this.productQuantity,
  });
  final String id;
  final String productName;
  final String productImage;
  final String productPrice;
  final String productQuantity;
}
