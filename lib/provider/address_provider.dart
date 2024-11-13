import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/model/address_model.dart';

class AddressProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<AddressModel> _addresses = [];
  List<AddressModel> get addresses => _addresses;
   AddressModel? _selectedAddress;

  AddressModel? get selectedAddress => _selectedAddress;

  // Method to set addresses (you'll call this after fetching addresses from Firestore)
  void setAddresses(List<AddressModel> addresses) {
    _addresses = addresses;
    notifyListeners();
  }

  // Method to select an address
  void selectAddress(AddressModel address) {
    _selectedAddress = address;
    notifyListeners();
  }
  Future<void> addAddress(AddressModel address) async {
    User? user = _auth.currentUser;

    if (user != null) {
      try {
        await _firestore
            .collection('users')
            .doc(user.uid)
            .collection('addresses')
            .add(address.toMap());
        notifyListeners();
      } catch (e) {
        print('Failed to add address: $e');
      }
    }
  }

  Future<List<AddressModel>> getUserAddresses() async {
    User? user = _auth.currentUser;

    if (user != null) {
      try {
        final snapshot = await _firestore
            .collection('users')
            .doc(user.uid)
            .collection('addresses')
            .get();
        return snapshot.docs.map((doc) {
          final data = doc.data();
          return AddressModel.fromMap(data)..id = doc.id;
        }).toList();
      } catch (e) {
        print('Failed to fetch addresses: $e');
        return [];
      }
    }
    return [];
  }

  Future<void> fetchAddresses() async {
    User? user = _auth.currentUser;

    if (user != null) {
      try {
        final snapshot = await _firestore
            .collection('users')
            .doc(user.uid)
            .collection('addresses')
            .get();
        _addresses = snapshot.docs.map((doc) {
          final data = doc.data();
          return AddressModel.fromMap(data)..id = doc.id;
        }).toList();
        notifyListeners();
      } catch (e) {
        print('Failed to fetch addresses: $e');
      }
    }
  }
}
