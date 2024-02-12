import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class Categorymodel {
  String id;
  String name;
  bool isfeatured;
  String image;
  String parentid;
  Categorymodel(
      {required this.id,
      required this.isfeatured,
      required this.name,
      required this.image,
      this.parentid = ''});

  // empty hrlper function

  static Categorymodel empty() =>
      Categorymodel(id: '', isfeatured: false, name: '', image: '');

  // covert model to json
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'isfeatured': isfeatured,
      'parentid': parentid,
      'image': image
    };
  }

  factory Categorymodel.fromMap(Map<String, dynamic> data) {
    return Categorymodel(
        id: data['id'] ?? "",
        name: data['name'] ?? "",
        isfeatured: data['isfeatured'] ?? false,
        image: data['image'] ?? "",
        parentid: data['parentid'] ?? "");
  }
  factory Categorymodel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    if (documentSnapshot.data() != null) {
      final data = documentSnapshot.data();
      return Categorymodel(
          id: documentSnapshot.id,
          isfeatured: data!['isfeatured'] ?? false,
          name: data['name'] ?? "",
          image: data['image'] ?? "",
          parentid: data['parentid'] ?? "");
    } else {
      return Categorymodel.empty();
    }
  }
}
