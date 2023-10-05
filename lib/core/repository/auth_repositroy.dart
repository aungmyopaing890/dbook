import 'package:dbook/core/db/database_helper.dart';
import 'package:dbook/core/db/master_shared_preferences.dart';
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

  Future<dynamic> setLoginUserData(User user) async {
    await MasterSharedPreferences.instance.setLoginUserData(
      id: user.id ?? '',
      name: user.name ?? '',
      email: user.email ?? '',
    );
  }
}
