class CategoryData {
  CategoryData({
    this.success,
    this.message,
    this.data,
  });
  bool? success;
  String? message;
  List<Category>? data;

  CategoryData fromMap(Map<String, dynamic> dynamicData) {
    return CategoryData(
      success: dynamicData['success'],
      message: dynamicData['message'],
      data: Category().fromMapList(dynamicData['data']),
    );
  }
}

class Category {
  Category({
    this.id,
    this.title,
    this.image,
  });

  int? id;
  String? title;
  String? image;

  String? getPrimaryKey() {
    return id.toString();
  }

  Category fromMap(dynamic dynamicData) {
    if (dynamicData != null) {
      return Category(
        id: dynamicData["id"],
        title: dynamicData["title"],
        image: dynamicData["image"],
      );
    } else {
      return Category(id: 0);
    }
  }

  Map<String, dynamic>? toMap(Category object) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = object.id;
    data['name'] = object.title;

    return data;
  }

  List<Category> fromMapList(List<dynamic> dynamicDataList) {
    final List<Category> subUserList = <Category>[];
    for (dynamic dynamicData in dynamicDataList) {
      if (dynamicData != null) {
        subUserList.add(fromMap(dynamicData));
      }
    }
    return subUserList;
  }

  List<Map<String, dynamic>?> toMapList(List<Category> objectList) {
    final List<Map<String, dynamic>?> mapList = <Map<String, dynamic>?>[];
    for (Category? data in objectList) {
      if (data != null) {
        mapList.add(toMap(data));
      }
    }
    return mapList;
  }
}
