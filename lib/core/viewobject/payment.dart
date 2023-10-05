class PaymentData {
  PaymentData({
    this.success,
    this.data,
  });
  bool? success;
  List<Payment>? data;
  PaymentData fromMap(Map<String, dynamic> dynamicData) {
    return PaymentData(
      success: dynamicData['status'],
      data: Payment().fromMapList(dynamicData['data']),
    );
  }
}

class Payment {
  Payment({
    this.id,
    this.logo,
    this.type,
    this.name,
    this.number,
  });

  int? id;
  String? logo;
  String? type;
  String? name;
  String? number;

  String getPrimaryKey() {
    return id.toString();
  }

  Payment fromMap(dynamic dynamicData) {
    if (dynamicData != null) {
      return Payment(
        id: dynamicData["id"],
        logo: dynamicData["photo"],
        type: dynamicData["payment_name"],
        name: dynamicData["account_name"],
        number: dynamicData["account"],
      );
    } else {
      return Payment();
    }
  }

  Map<String, dynamic>? toMap(Payment object) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = object.id;
    data['logo'] = object.logo;
    data['type'] = object.type;
    data['name'] = object.name;
    data['number'] = object.number;

    return data;
  }

  List<Payment> fromMapList(List<dynamic> dynamicDataList) {
    final List<Payment> subUserList = <Payment>[];
    for (dynamic dynamicData in dynamicDataList) {
      if (dynamicData != null) {
        subUserList.add(fromMap(dynamicData));
      }
    }
    return subUserList;
  }

  List<Map<String, dynamic>?> toMapList(List<Payment> objectList) {
    final List<Map<String, dynamic>?> mapList = <Map<String, dynamic>?>[];
    for (Payment? data in objectList) {
      if (data != null) {
        mapList.add(toMap(data));
      }
    }
    return mapList;
  }
}
