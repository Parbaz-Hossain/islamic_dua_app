import 'package:flutter/material.dart';
import '../core/utils/database_helper.dart';
import '../models/dua.dart';

class DuaService extends ChangeNotifier {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  List<Dua> _duas = [];
  List<Dua> _filteredDuas = [];
  bool _isLoading = false;

  List<Dua> get duas => _filteredDuas;
  bool get isLoading => _isLoading;

  // Load all duas
  Future<void> loadDuas() async {
    _isLoading = true;
    notifyListeners();

    try {
      _duas = await _dbHelper.getAllDuas();
      _filteredDuas = _duas;
    } catch (e) {
      print('Error loading duas: $e');
    }

    _isLoading = false;
    notifyListeners();
  }

  // Get duas by category
  Future<void> loadDuasByCategory(String category) async {
    _isLoading = true;
    notifyListeners();

    try {
      _filteredDuas = await _dbHelper.getDuasByCategory(category);
    } catch (e) {
      print('Error loading duas by category: $e');
    }

    _isLoading = false;
    notifyListeners();
  }

  // Search duas
  void searchDuas(String query) {
    if (query.isEmpty) {
      _filteredDuas = _duas;
    } else {
      _filteredDuas = _duas.where((dua) =>
        dua.bengaliTranslation.toLowerCase().contains(query.toLowerCase()) ||
        dua.englishTranslation.toLowerCase().contains(query.toLowerCase()) ||
        dua.transliteration.toLowerCase().contains(query.toLowerCase())
      ).toList();
    }
    notifyListeners();
  }

  // Get available categories
  List<String> getCategories() {
    return _duas.map((dua) => dua.category).toSet().toList();
  }
}