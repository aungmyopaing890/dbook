import 'package:dbook/core/viewobject/user.dart';

// class LoginData {
//   LoginData({
//     this.status,
//     this.success,
//     this.message,
//     this.data,
//   });
//   bool? success;
//   String? message;
//   int? status;
//   Login? data;
//   LoginData fromMap(dynamic dynamicData) {
//     if (dynamicData != null) {
//       return LoginData(
//         success: dynamicData['status'],
//         data: Login().fromMap(dynamicData['data']),
//       );
//     } else {
//       return LoginData();
//     }
//   }
// }

class Login {
  Login({this.status, this.token, this.user, this.message});
  bool? status;
  String? token;
  User? user;
  String? message;
  Login fromMap(dynamic dynamicData) {
    if (dynamicData['status']) {
      return Login(
        token: dynamicData['token'],
        status: dynamicData['status'],
        user: User().fromMap(dynamicData['data']),
      );
    }
    return Login(
      status: dynamicData['status'],
      message: dynamicData['message'],
    );
  }

  Map<String, dynamic>? toMap(Login object) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = object.status;
    data['token'] = object.token;
    data['user'] = object.user;
    return data;
  }

  List<Login> fromMapList(List<dynamic> dynamicDataList) {
    final List<Login> subUserList = <Login>[];
    for (dynamic dynamicData in dynamicDataList) {
      if (dynamicData != null) {
        subUserList.add(fromMap(dynamicData));
      }
    }
    return subUserList;
  }

  List<Map<String, dynamic>?> toMapList(List<Login> objectList) {
    final List<Map<String, dynamic>?> mapList = <Map<String, dynamic>?>[];
    for (Login? data in objectList) {
      if (data != null) {
        mapList.add(toMap(data));
      }
    }
    return mapList;
  }
}
