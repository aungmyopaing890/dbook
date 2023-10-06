class UserData {
  UserData({
    this.success,
    this.message,
    this.user,
  });
  bool? success;
  String? message;
  User? user;

  UserData fromMap(Map<String, dynamic> dynamicData) {
    return UserData(
      success: dynamicData["success"],
      message: dynamicData["message"],
      user: User().fromMap(dynamicData['data']),
    );
  }
}

class User {
  User({
    this.id,
    this.name,
    this.email,
    this.password,
  });

  String? id;
  String? name;
  String? email;
  String? password;

  User fromMap(dynamic dynamicData) {
    return User(
      id: dynamicData['id'].toString(),
      name: dynamicData['name'],
      email: dynamicData['email'],
      password: dynamicData['password'],
    );
  }

  Map<String, dynamic>? toMap(User object) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = object.id;
    data['name'] = object.name;
    data['email'] = object.email;
    data['password'] = object.password;
    return data;
  }

  List<User> fromMapList(List<dynamic> dynamicDataList) {
    final List<User> subUserList = <User>[];
    for (dynamic dynamicData in dynamicDataList) {
      if (dynamicData != null) {
        subUserList.add(fromMap(dynamicData));
      }
    }
    return subUserList;
  }

  List<Map<String, dynamic>?> toMapList(List<User> objectList) {
    final List<Map<String, dynamic>?> mapList = <Map<String, dynamic>?>[];
    for (User? data in objectList) {
      if (data != null) {
        mapList.add(toMap(data));
      }
    }
    return mapList;
  }
}

const String tableUser = 'users';

class UserFields {
  static final List<String> values = [
    id,
    name,
    email,
  ];

  static const String id = 'id';
  static const String name = 'name';
  static const String email = 'email';
  static const String password = 'password';
}
