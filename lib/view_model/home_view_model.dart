import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeViewModel with ChangeNotifier {
  Stream<QuerySnapshot<Map<String, dynamic>>>? _stream;
  final Map<String, bool> _selectedCategories = {};

  get stream => _stream;
  get selectedCategories => _selectedCategories;

  setStream(newStream) {
    _stream = newStream;
    // notifyListeners();
  }

  setSelectedCategories(key, value) {
    _selectedCategories[key] = value;
    notifyListeners();
  }
}
