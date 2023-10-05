// ignore_for_file: use_build_context_synchronously
import 'package:dbook/core/repository/auth_repositroy.dart';
import 'package:dbook/core/viewobject/change_password.dart';
import 'package:dbook/screen/common/dialog/error_dialog.dart';
import 'package:dbook/screen/common/dialog/success_dialog.dart';
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

  Future<void> login(BuildContext context,
      {required String username,
      required String password,
      required Function callBackAfterLoginSuccess}) async {
    await MasterProgressDialog.showDialog(context);
    UserData resource = await _authRepository!
        .loginUser(username: username, password: password);
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

  Future<void> changeUserPassword(
    BuildContext context, {
    required String id,
    required String oldPassword,
    required String newPassword,
  }) async {
    await MasterProgressDialog.showDialog(context);
    ChangePasswordReturn resource = await _authRepository!.changeUserPassword(
        id: id, oldPassword: oldPassword, newPassword: newPassword);
    MasterProgressDialog.dismissDialog();
    if (resource.success ?? false) {
      ///
      /// Success
      ///
      showDialog<dynamic>(
          context: context,
          builder: (BuildContext context) {
            return SuccessDialog(
              message: resource.message,
              onPressed: () {
                Navigator.pop(context);
              },
            );
          });
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

  Future<void> deleteUser(BuildContext context,
      {required Function callBackAfterDeleteSuccess}) async {
    await MasterProgressDialog.showDialog(context);
    int resource = await _authRepository!.deleteUser();
    MasterProgressDialog.dismissDialog();
    if (resource == 1) {
      ///
      /// Success
      ///
      callBackAfterDeleteSuccess();
    } else {
      showDialog<dynamic>(
          context: context,
          builder: (BuildContext context) {
            return const ErrorDialog(
              message: "Successfully Deleted!",
            );
          });
    }
    notifyListeners();
  }

  Future<void> logoutUser(BuildContext context,
      {required Function logout}) async {
    logout();
    await MasterProgressDialog.showDialog(context);
    await _authRepository!.logoutUser();
    MasterProgressDialog.dismissDialog();
    showDialog<dynamic>(
        context: context,
        builder: (BuildContext context) {
          return const SuccessDialog(
            message: "Successfully Logout!",
          );
        });
    notifyListeners();
  }
}
