import 'package:dbook/core/repository/auth_repositroy.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  AuthProvider({
    required AuthRepository authRepository,
    int limit = 0,
  }) {
    // _authRepository = authRepository;
  }

  // AuthRepository? _authRepository;
}
