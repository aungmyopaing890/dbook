import 'package:dbook/core/viewobject/book.dart';
import 'package:flutter/material.dart';
import 'package:dbook/core/repository/book_repository.dart';

class BookSearchProvider extends ChangeNotifier {
  BookSearchProvider({
    required BookRepository repository,
    int limit = 0,
  }) {
    _repository = repository;
  }

  BookRepository? _repository;
  BookData data = BookData();
  BookData totalData = BookData();
  int totalDatalLength = 0;
  bool isLoading = false;
  Future<void> loadDataList(String keyword) async {
    isLoading = true;
    BookData datalist = await _repository!.searchDataList(keyword);
    totalDatalLength = datalist.data?.length ?? 0;
    totalData = datalist;
    data.status = datalist.status;
    data.data = [
      datalist.data?[0] ?? Book(),
      datalist.data?[1] ?? Book(),
      datalist.data?[2] ?? Book(),
    ];
    isLoading = false;
    notifyListeners();
  }

  int count = 0;
  int index = 0;
  Future<void> loadNextDataList() async {
    isLoading = true;
    count = count + 1;
    index = index + 3;
    if (count < interval) {
      data.data!.addAll([
        totalData.data?[index] ?? Book(),
        totalData.data?[index + 1] ?? Book(),
        totalData.data?[index + 2] ?? Book()
      ]);
    }
    isLoading = false;
    notifyListeners();
  }

  bool get hasData {
    return datalength > 0;
  }

  int get interval {
    return (totalDatalLength / 3).ceil();
  }

  int get datalength {
    return data.data?.length ?? 0;
  }
}
