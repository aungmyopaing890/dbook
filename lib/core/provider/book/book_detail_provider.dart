import 'package:dbook/core/viewobject/book.dart';
import 'package:flutter/material.dart';
import 'package:dbook/core/repository/book_repository.dart';

class BookDetailProvider extends ChangeNotifier {
  BookDetailProvider({
    required BookRepository repository,
    int limit = 0,
  }) {
    _repository = repository;
  }

  BookRepository? _repository;
  Book? data;
  bool isLoading = false;
  Future<void> loadData(String id) async {
    isLoading = true;
    data = await _repository!.loadData(id);
    isLoading = false;
    notifyListeners();
  }

  bool get hasData {
    return data != null;
  }
}
