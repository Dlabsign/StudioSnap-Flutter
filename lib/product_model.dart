class ProductModel {
  int? id;
  String? nama, email, password;

  ProductModel({this.id, this.nama, this.email, this.password});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      nama: json['nama'],
      email: json['email'],
      password: json['password'],
    );
  }
}
