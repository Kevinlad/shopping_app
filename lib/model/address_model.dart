class AddressModel {
  String? id;
  String name;
  String phoneNumber;
  String street;
  String postalCode;
  String city;
  String state;
  String country;

  AddressModel({
    this.id,
    required this.name,
    required this.phoneNumber,
    required this.street,
    required this.postalCode,
    required this.city,
    required this.state,
    required this.country,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phoneNumber': phoneNumber,
      'street': street,
      'postalCode': postalCode,
      'city': city,
      'state': state,
      'country': country,
    };
  }

  static AddressModel fromMap(Map<String, dynamic> map) {
    return AddressModel(
      id: map['id'],
      name: map['name'],
      phoneNumber: map['phoneNumber'],
      street: map['street'],
      postalCode: map['postalCode'],
      city: map['city'],
      state: map['state'],
      country: map['country'],
    );
  }
}
