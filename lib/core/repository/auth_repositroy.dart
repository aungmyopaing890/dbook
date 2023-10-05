import 'package:dbook/core/db/database_helper.dart';
import 'package:dbook/core/db/master_shared_preferences.dart';
import 'package:dbook/core/viewobject/change_password.dart';
import 'package:dbook/core/viewobject/user.dart';

class AuthRepository {
  AuthRepository({required DatabaseHelper db}) {
    _databaseHelper = db;
  }

  DatabaseHelper? _databaseHelper;

  Future<UserData> registerUser({required User user}) async {
    final UserData resource = await _databaseHelper!.createUser(user);
    if (resource.success ?? false) {
      setLoginUserData(resource.user!);
    }
    return resource;
  }

  Future<UserData> loginUser(
      {required String username, required String password}) async {
    final UserData resource =
        await _databaseHelper!.checkUser(username, password);
    if (resource.success ?? false) {
      setLoginUserData(resource.user!);
    }
    return resource;
  }

  Future<ChangePasswordReturn> changeUserPassword({
    required String id,
    required String oldPassword,
    required String newPassword,
  }) async {
    return await _databaseHelper!.changeUserPassword(
        id: id, oldPassword: oldPassword, newPassword: newPassword);
  }

  Future<int> deleteUser() async {
    String? userid = await MasterSharedPreferences.instance.getLoginUserID();
    final int resource = await _databaseHelper!.deleteUser(userid ?? "0");
    if (resource == 1) {
      setLoginUserData(User());
    }
    return resource;
  }

  Future<dynamic> setLoginUserData(User user) async {
    await MasterSharedPreferences.instance.setLoginUserData(
      id: user.id ?? '',
      name: user.name ?? '',
      email: user.email ?? '',
    );
  }

  Future<dynamic> logoutUser() async {
    setLoginUserData(User());
    return true;
  }
}
