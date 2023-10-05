import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

import '../constant/master_constants.dart';
import '../utils/utils.dart';
import '../viewobject/common/master_value_holder.dart';

class MasterSharedPreferences {
  MasterSharedPreferences._() {
    Utils.masterPrint('init MasterSharePerference $hashCode');
    futureShared = SharedPreferences.getInstance();
    futureShared.then((SharedPreferences shared) {
      this.shared = shared;
      loadValueHolder();
    });
  }

  late Future<SharedPreferences> futureShared;
  late SharedPreferences shared;

  // Singleton instance
  static final MasterSharedPreferences _singleton = MasterSharedPreferences._();

  // Singleton accessor
  static MasterSharedPreferences get instance => _singleton;

  final StreamController<MasterValueHolder> _valueController =
      StreamController<MasterValueHolder>();

  Stream<MasterValueHolder> get masterValueHolder => _valueController.stream;

  void loadValueHolder() {
    final String? loginUserId =
        shared.getString(MasterConst.VALUE_HOLDER__USER_ID);
    final String? loginUserName =
        shared.getString(MasterConst.VALUE_HOLDER__USER_NAME);
    final String? loginUserEmail =
        shared.getString(MasterConst.VALUE_HOLDER__USER_EMAIL);
    final MasterValueHolder valueHolder = MasterValueHolder(
      loginUserId: loginUserId ?? '',
      loginUserName: loginUserName ?? '',
      loginUserEmail: loginUserEmail ?? '',
    );

    _valueController.add(valueHolder);
  }

  Future<String?> getLoginUserID() async {
    return shared.getString(MasterConst.VALUE_HOLDER__USER_ID);
  }

  Future<dynamic> replaceLoginUserId(String loginUserId) async {
    await shared.setString(MasterConst.VALUE_HOLDER__USER_ID, loginUserId);
  }

  Future<dynamic> replaceLoginUserName(String loginUserName) async {
    await shared.setString(MasterConst.VALUE_HOLDER__USER_NAME, loginUserName);
  }

  Future<dynamic> setLoginUserData({
    required String id,
    required String name,
    required String email,
  }) async {
    await shared.setString(MasterConst.VALUE_HOLDER__USER_ID, id);
    await shared.setString(MasterConst.VALUE_HOLDER__USER_NAME, name);
    await shared.setString(MasterConst.VALUE_HOLDER__USER_EMAIL, email);
    loadValueHolder();
  }
}
