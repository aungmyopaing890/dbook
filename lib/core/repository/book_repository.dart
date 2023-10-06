import 'package:dbook/core/db/database_helper.dart';
import 'package:dbook/core/viewobject/book.dart';

import '../api/master_api_service.dart';

class BookRepository {
  BookRepository(
      {required MasterApiService apiService,
      required DatabaseHelper dbService}) {
    _apiService = apiService;
    _dbService = dbService;
  }

  MasterApiService? _apiService;
  DatabaseHelper? _dbService;

  Future<BookData> loadDataList() async {
    return await _apiService!.getRecentBookList();
  }

  Future<BookData> searchDataList(String keyword) async {
    return await _apiService!.searchBook(keyword);
  }

  Future<Book> loadData(String id) async {
    return await _apiService!.getBookDetail(id);
  }

  Future<int> insertBook(Book book) async {
    return await _dbService!.insertBook(book);
  }

  Future<int> favBook(Book book) async {
    return await _dbService!.favBook(book);
  }

  Future<bool?> checkfavBook(String id) async {
    return await _dbService!.checkfavBook(id);
  }

  Future<List<Book>> loadFavBooks() async {
    return await _dbService!.getFavBooks();
  }
}
