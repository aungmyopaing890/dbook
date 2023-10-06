import 'package:dbook/core/viewobject/book.dart';
import 'package:flutter/material.dart';
import 'package:dbook/core/repository/book_repository.dart';

class BookProvider extends ChangeNotifier {
  BookProvider({
    required BookRepository repository,
    int limit = 0,
  }) {
    _repository = repository;
  }

  BookRepository? _repository;
  BookData data = BookData();
  bool isLoading = false;
  Future<void> loadDataList() async {
    isLoading = true;
    BookData datalist = await _repository!.loadDataList();
    data = datalist;
    isLoading = false;
    notifyListeners();
  }

  bool get hasData {
    return datalength > 0;
  }

  int get datalength {
    return data.data?.length ?? 0;
  }
}
