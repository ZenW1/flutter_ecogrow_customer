class ProductListResponseModel {
  final List<ProductListModel>? data;

  ProductListResponseModel({
    this.data,
  });

  factory ProductListResponseModel.fromJson(Map<String, dynamic> json) =>
      ProductListResponseModel(
        data: json["data"] == null
            ? []
            : List<ProductListModel>.from(json["data"]!.map((x) => ProductListModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class ProductListModel {
  final int? id;
  final String? name;
  final int? price;
  final int? specialPrice;
  final String? promotionType;
  final String? promotionDescription;
  final int? quantity;
  final String? subtractStock;
  final String? quality;
  final String? dateAvailable;
  final int? sortOrder;
  final String? status;
  final String? primaryImage;
  final List<Categoy>? categoies;
  final bool? reviewable;

  ProductListModel({
    this.id,
    this.name,
    this.price,
    this.specialPrice,
    this.promotionType,
    this.promotionDescription,
    this.quantity,
    this.subtractStock,
    this.quality,
    this.dateAvailable,
    this.sortOrder,
    this.status,
    this.primaryImage,
    this.categoies,
    this.reviewable,
  });

  factory ProductListModel.fromJson(Map<String, dynamic> json) => ProductListModel(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        specialPrice: json["special_price"],
        promotionType: json["promotion_type"],
        promotionDescription: json["promotion_description"],
        quantity: json["quantity"],
        subtractStock: json["subtract_stock"],
        quality: json["Quality"],
        dateAvailable: json["date_available"],
        sortOrder: json["sort_order"],
        status: json["status"],
        primaryImage: json["primary_image"],
        categoies: json["categoies"] == null
            ? []
            : List<Categoy>.from(
                json["categoies"]!.map((x) => Categoy.fromJson(x))),
        reviewable: json["reviewable"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "special_price": specialPrice,
        "promotion_type": promotionType,
        "promotion_description": promotionDescription,
        "quantity": quantity,
        "subtract_stock": subtractStock,
        "Quality": quality,
        "date_available": dateAvailable,
        "sort_order": sortOrder,
        "status": status,
        "primary_image": primaryImage,
        "categoies": categoies == null
            ? []
            : List<dynamic>.from(categoies!.map((x) => x.toJson())),
        "reviewable": reviewable,
      };
}

class Categoy {
  final int? id;
  final String? name;

  Categoy({
    this.id,
    this.name,
  });

  factory Categoy.fromJson(Map<String, dynamic> json) => Categoy(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
