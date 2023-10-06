import 'dart:convert';
import 'package:dbook/config/master_config.dart';
import 'package:dbook/core/viewobject/book.dart';
import 'package:http/http.dart' as http;

class MasterApiService {
  /// Load BookData
  ///

  Future<BookData> getBookList(String token) async {
    const String url = '${MasterConfig.app_url}banners';
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var request = http.Request('GET', Uri.parse(url));
    request.headers.addAll(headers);
    final http.Response res =
        await http.Response.fromStream(await request.send());
    final dynamic hashMap = json.decode(res.body);
    return BookData().fromMap(hashMap);
  }
}
