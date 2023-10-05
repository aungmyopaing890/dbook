class ChangePasswordReturn {
  ChangePasswordReturn({
    this.success,
    this.message,
    this.data,
  });
  bool? success;
  String? message;
  String? data;

  ChangePasswordReturn fromMap(Map<String, dynamic> dynamicData) {
    return ChangePasswordReturn(
      success: dynamicData['success'],
      data: dynamicData['data'],
      message: dynamicData['message'],
    );
  }
}
