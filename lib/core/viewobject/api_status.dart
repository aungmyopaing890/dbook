class ApiStatus {
  ApiStatus({
    this.status,
    this.message,
  });

  bool? status;
  String? message;

  List<ApiStatus?> fromMapList(List<dynamic> dynamicDataList) {
    final List<ApiStatus?> subCategoryList = <ApiStatus?>[];
    for (dynamic dynamicData in dynamicDataList) {
      if (dynamicData != null) {
        subCategoryList.add(fromMap(dynamicData));
      }
    }
    return subCategoryList;
  }

  ApiStatus fromMap(dynamic dynamicData) {
    return ApiStatus(
      status: dynamicData['status'],
      message: dynamicData['message'],
    );
  }

  Map<String, dynamic>? toMap(ApiStatus? object) {
    if (object != null) {
      final Map<String, dynamic> data = <String, dynamic>{};
      data['status'] = object.status;
      data['message'] = object.message;

      return data;
    } else {
      return null;
    }
  }

  List<Map<String, dynamic>?> toMapList(List<ApiStatus?> objectList) {
    final List<Map<String, dynamic>?> mapList = <Map<String, dynamic>?>[];
    for (ApiStatus? data in objectList) {
      if (data != null) {
        mapList.add(toMap(data));
      }
    }
    return mapList;
  }
}
