class AddressModel {
  final List<Datum>? data;

  AddressModel({
    this.data,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        data: json["data"] == null
            ? []
            : List<Datum>.from(
                json["data"]!.map(
                  (x) => Datum.fromJson(x),
                ),
              ),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  final int? id;
  final String? name;
  final String? firstname;
  final String? lastname;
  final String? mobile;
  final String? title;
  final String? subTitle;
  final String? description;
  final String? email;
  final String? address1;
  final double? lat;
  final double? lng;
  final bool? datumDefault;

  Datum({
    this.id,
    this.name,
    this.firstname,
    this.lastname,
    this.mobile,
    this.title,
    this.subTitle,
    this.description,
    this.email,
    this.address1,
    this.lat,
    this.lng,
    this.datumDefault,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] ,
        name: json["name"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        mobile: json["mobile"],
        title: json["title"],
        subTitle: json["subTitle"],
        description: json["description"],
        email: json["email"],
        address1: json["address_1"],
        lat: json["lat"]?.toDouble(),
        lng: json["lng"]?.toDouble(),
        datumDefault: json["default"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "firstname": firstname,
        "lastname": lastname,
        "mobile": mobile,
        "title": title,
        "subTitle": subTitle,
        "description": description,
        "email": email,
        "address_1": address1,
        "lat": lat,
        "lng": lng,
        "default": datumDefault,
      };
}
