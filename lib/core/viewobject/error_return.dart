class ErrorReturn {
  ErrorReturn({
    this.status,
    this.message,
  });
  bool? status;
  String? message;

  String getPrimaryKey() {
    return message ?? '';
  }

  ErrorReturn fromMap(dynamic dynamicData) {
    if (dynamicData != null) {
      return ErrorReturn(
        status: dynamicData['success'],
        // message: dynamicData['message'],
      );
    } else {
      return ErrorReturn(message: '');
    }
  }
}

// class ErrorMassage {
//   ErrorMassage({
//     this.status,
//     this.message,
//   });
//   bool? status;
//   String? message;

//   String getPrimaryKey() {
//     return message ?? '';
//   }

//   ErrorReturn fromMap(dynamic dynamicData) {
//     if (dynamicData != null) {
//       return ErrorReturn(
//         status: dynamicData['success'],
//         message: dynamicData['message'],
//       );
//     } else {
//       return ErrorReturn(message: '');
//     }
//   }
// }
