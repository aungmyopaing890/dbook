import 'package:dbook/core/repository/book_repository.dart';
import 'package:dbook/core/viewobject/book.dart';
import 'package:flutter/material.dart';

class BookFavouriteProvider extends ChangeNotifier {
  BookFavouriteProvider({
    required BookRepository repository,
    int limit = 0,
  }) {
    _repository = repository;
  }

  BookRepository? _repository;
  List<Book> dataList = [];
  bool isLoading = false;
  bool isFav = false;
  Future<void> insertBook({
    required Book book,
  }) async {
    await _repository!.insertBook(book);
    notifyListeners();
  }

  Future<void> favBook({
    required Book book,
  }) async {
    await _repository!.favBook(book);
    notifyListeners();
  }

  Future<void> checkfavBook({
    required String id,
  }) async {
    isFav = await _repository!.checkfavBook(id) ?? false;
    notifyListeners();
  }

  Future<void> loadDataList() async {
    isLoading = true;
    dataList = await _repository!.loadFavBooks();
    isLoading = false;
    notifyListeners();
  }

  bool get hasData => datalength > 0;
  int get datalength => dataList.length;
}
