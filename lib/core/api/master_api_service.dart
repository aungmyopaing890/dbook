import 'dart:convert';
import 'package:dbook/config/master_config.dart';
import 'package:dbook/core/viewobject/book.dart';
import 'package:http/http.dart' as http;

class MasterApiService {
  /// Load BookData
  ///

  Future<BookData> getRecentBookList() async {
    const String url = '${MasterConfig.app_url}recent';
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    var request = http.Request('GET', Uri.parse(url));
    request.headers.addAll(headers);
    final http.Response res =
        await http.Response.fromStream(await request.send());
    final dynamic hashMap = json.decode(res.body);
    return BookData().fromMap(hashMap);
  }

  /// Search Book
  ///

  Future<BookData> searchBook(String keyword) async {
    String url = '${MasterConfig.app_url}/search/$keyword';
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    var request = http.Request('GET', Uri.parse(url));
    request.headers.addAll(headers);
    final http.Response res =
        await http.Response.fromStream(await request.send());
    final dynamic hashMap = json.decode(res.body);
    return BookData().fromMap(hashMap);
  }
}
