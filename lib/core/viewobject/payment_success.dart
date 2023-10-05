import 'package:dbook/core/viewobject/user.dart';

class PaymentSuccess {
  PaymentSuccess({this.status, this.message, this.user});

  bool? status;
  String? message;
  User? user;
  PaymentSuccess fromMap(Map<String, dynamic> dynamicData) {
    return PaymentSuccess(
        status: dynamicData['status'],
        message: dynamicData['message'],
        user: User().fromMap(dynamicData['data']));
  }
}
