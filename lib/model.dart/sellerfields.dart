class SellerFields {
  static const String id = 'id';
  static const String name = 'name';
  static const String email = 'email';
  static const String demoVideoLink = 'demoVideoLink';
  static const String productDescription = 'productDescription';

  static List<String> getFields() =>
      [id, name, email, demoVideoLink, productDescription];
}

class SellerModel {
  final int? id;
  final String name;
  final String email;
  final String demoVideoLink;
  final String productDescription;
  const SellerModel(
      {this.id,
      required this.demoVideoLink,
      required this.email,
      required this.name,
      required this.productDescription});

  SellerModel copy(
          {int? id,
          String? name,
          String? email,
          String? demoVideoLink,
          String? productDescription}) =>
      SellerModel(
          demoVideoLink: demoVideoLink ?? this.demoVideoLink,
          email: email ?? this.email,
          name: name ?? this.name,
          productDescription: productDescription ?? this.productDescription,
          id: id ?? this.id);
  Map<String, dynamic> toJson() => {
        SellerFields.id: id,
        SellerFields.email: email,
        SellerFields.name: name,
        SellerFields.demoVideoLink: demoVideoLink,
        SellerFields.productDescription: productDescription
      };
}
