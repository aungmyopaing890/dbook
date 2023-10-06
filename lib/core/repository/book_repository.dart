import 'package:dbook/core/viewobject/book.dart';

import '../api/master_api_service.dart';

class BookRepository {
  BookRepository({required MasterApiService apiService}) {
    _apiService = apiService;
  }

  MasterApiService? _apiService;

  Future<BookData> loadDataList() async {
    return await _apiService!.getRecentBookList();
  }

  Future<BookData> searchDataList(String keyword) async {
    return await _apiService!.searchBook(keyword);
  }
}
