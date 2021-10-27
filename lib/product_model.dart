class ProductModel {
  int? id;
  String? image1;
  String? image2;
  String? image3;
  String? image4;
  String? image5;
  String? mobileName;
  String? mobileDescription;
  String? mobilePrice;
  String? mobileWarranty;
  String? mobileRam;
  String? mobileSize;
  String? mobileModelNumber;
  String? mobileColor;
  String? mobileSimType;
  String? mobileScreen;
  String? mobileStorage;
  String? mobileNetworkType;

  ProductModel(
      {this.id,
      this.image1,
      this.image2,
      this.image3,
      this.image4,
      this.image5,
      this.mobileName,
      this.mobileDescription,
      this.mobilePrice,
      this.mobileWarranty,
      this.mobileRam,
      this.mobileSize,
      this.mobileModelNumber,
      this.mobileColor,
      this.mobileSimType,
      this.mobileScreen,
      this.mobileNetworkType,
      this.mobileStorage});

  ProductModel.fromJson(dynamic json) {
    id = json['id'];
    image1 = json['image1'];
    image2 = json['image2'];
    image3 = json['image3'];
    image4 = json['image4'];
    image5 = json['image5'];
    mobileNetworkType = json['mobileNetworkType'];
    mobileName = json['mobileName'];
    mobileDescription = json['mobileDescription'];
    mobilePrice = json['mobilePrice'];
    mobileWarranty = json['mobileWarranty'];
    mobileRam = json['mobileRam'];
    mobileSize = json['mobileSize'];
    mobileModelNumber = json['mobileModelNumber'];
    mobileColor = json['mobileColor'];
    mobileSimType = json['mobileSimType'];
    mobileScreen = json['mobileScreen'];
    mobileStorage = json['mobileStorage'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['image1'] = image1;
    map['image2'] = image2;
    map['image3'] = image3;
    map['image4'] = image4;
    map['image5'] = image5;

    map['mobileName'] = mobileName;
    map['mobileDescription'] = mobileDescription;
    map['mobilePrice'] = mobilePrice;
    map['mobileWarranty'] = mobileWarranty;
    map['mobileRam'] = mobileRam;
    map['mobileSize'] = mobileSize;
    map['mobileModelNumber'] = mobileModelNumber;
    map['mobileColor'] = mobileColor;
    map['mobileSimType'] = mobileSimType;
    map['mobileScreen'] = mobileScreen;
    map['mobileStorage'] = mobileStorage;
    map['mobileNetworkType'] = mobileNetworkType;
    return map;
  }
}
