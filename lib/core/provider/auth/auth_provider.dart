// ignore_for_file: use_build_context_synchronously

import 'package:dbook/core/repository/auth_repositroy.dart';
import 'package:dbook/screen/common/dialog/error_dialog.dart';
import 'package:dbook/screen/common/progress_dialog.dart';
import 'package:dbook/core/viewobject/user.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  AuthProvider({
    required AuthRepository authRepository,
    int limit = 0,
  }) {
    _authRepository = authRepository;
  }

  AuthRepository? _authRepository;

  Future<void> registerUser(BuildContext context,
      {required User user, required Function callBackAfterLoginSuccess}) async {
    await MasterProgressDialog.showDialog(context);
    UserData resource = await _authRepository!.registerUser(
      user: user,
    );
    MasterProgressDialog.dismissDialog();
    if (resource.success ?? false) {
      ///
      /// Success
      ///
      callBackAfterLoginSuccess();
    } else {
      showDialog<dynamic>(
          context: context,
          builder: (BuildContext context) {
            return ErrorDialog(
              message: resource.message,
            );
          });
    }
    notifyListeners();
  }
}
