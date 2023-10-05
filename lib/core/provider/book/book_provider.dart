import 'package:flutter/material.dart';
import 'package:dbook/core/repository/banner_repository.dart';

class BookProvider extends ChangeNotifier {
  BookProvider({
    required BookRepository repository,
    int limit = 0,
  });
}
