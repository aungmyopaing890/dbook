class LogoutStatus {
  LogoutStatus({this.success, this.message});

  bool? success;
  String? message;

  LogoutStatus fromMap(dynamic dynamicData) {
    return LogoutStatus(
      success: dynamicData['success'],
      message: dynamicData['message'],
    );
  }
}
