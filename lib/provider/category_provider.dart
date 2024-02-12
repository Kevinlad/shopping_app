

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/model/CategoryModel.dart';

import '../model/category_model.dart';

class CategoryProvider extends ChangeNotifier {
  final _db = FirebaseFirestore.instance;

  // get all ccategories

  // Future<List<Categorymodel>> getAllCategores() async {
  //   try {
  //     final snapshot = await _db.collection('categories').get();
  //     final list =
  //         snapshot.docs.map((e) => Categorymodel.fromSnapshot(e)).toList();
  //     return list;
  //   } catch (e) {
  //     throw 'something went wrong';
  //   }
  // }

   late List<Categorymodel> _categories;

  List<Categorymodel> get categories => _categories;

  CategoryProvider() {
    _categories = [];
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('categories').get();
      _categories = querySnapshot.docs
          .map((doc) => Categorymodel.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
      notifyListeners();
    } catch (error) {
      print('Error fetching categories: $error');
    }
  }
}
