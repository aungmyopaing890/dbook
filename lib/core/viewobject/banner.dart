class BannerData {
  BannerData({
    this.success,
    this.message,
    this.data,
  });
  bool? success;
  String? message;
  List<Banner>? data;

  BannerData fromMap(Map<String, dynamic> dynamicData) {
    return BannerData(
      success: dynamicData['status'],
      message: 'Success',
      data: Banner().fromMapList(dynamicData['data']),
    );
  }
}

class Banner {
  Banner({this.image});

  String? image;

  Banner fromMap(dynamic dynamicData) {
    return Banner(
      image: dynamicData["image"],
    );
  }

  List<Banner> fromMapList(List<dynamic> dynamicDataList) {
    final List<Banner> subUserList = <Banner>[];
    for (dynamic dynamicData in dynamicDataList) {
      if (dynamicData != null) {
        subUserList.add(fromMap(dynamicData));
      }
    }
    return subUserList;
  }
}
