class SubciptionFeeData {
  SubciptionFeeData({
    this.status,
    this.data,
  });
  bool? status;
  List<SubciptionFee>? data;
  SubciptionFeeData fromMap(Map<String, dynamic> dynamicData) {
    return SubciptionFeeData(
      status: dynamicData['status'],
      data: SubciptionFee().fromMapList(dynamicData['data']),
    );
  }
}

class SubciptionFee {
  SubciptionFee({
    this.id,
    this.name,
    this.fee,
    this.numberOfMonths,
  });

  int? id;
  String? name;
  String? fee;
  String? numberOfMonths;

  String getPrimaryKey() {
    return id.toString();
  }

  SubciptionFee fromMap(dynamic dynamicData) {
    if (dynamicData != null) {
      return SubciptionFee(
        id: dynamicData["id"],
        name: dynamicData["name"],
        fee: dynamicData["fee"].toString(),
        numberOfMonths: dynamicData["number_of_months"].toString(),
      );
    } else {
      return SubciptionFee();
    }
  }

  Map<String, dynamic>? toMap(SubciptionFee object) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = object.id;
    data['name'] = object.name;
    data['fee'] = object.fee;
    data['number_of_months'] = object.numberOfMonths;

    return data;
  }

  List<SubciptionFee> fromMapList(List<dynamic> dynamicDataList) {
    final List<SubciptionFee> subUserList = <SubciptionFee>[];
    for (dynamic dynamicData in dynamicDataList) {
      if (dynamicData != null) {
        subUserList.add(fromMap(dynamicData));
      }
    }
    return subUserList;
  }

  List<Map<String, dynamic>?> toMapList(List<SubciptionFee> objectList) {
    final List<Map<String, dynamic>?> mapList = <Map<String, dynamic>?>[];
    for (SubciptionFee? data in objectList) {
      if (data != null) {
        mapList.add(toMap(data));
      }
    }
    return mapList;
  }
}
