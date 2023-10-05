import 'package:dbook/core/viewobject/category.dart';

class MedicineData {
  MedicineData({this.success, this.data, this.total, this.hasMorePage});
  bool? success;
  List<Medicine>? data;
  bool? hasMorePage;
  int? total;
  MedicineData fromMap(Map<String, dynamic> dynamicData) {
    return MedicineData(
        success: dynamicData['status'],
        data: Medicine().fromMapList(dynamicData['data']),
        total: dynamicData['total'],
        hasMorePage: dynamicData['can_load_more']);
  }
}

class MedicineDetailsData {
  MedicineDetailsData({this.success, this.data, this.total, this.hasMorePage});
  bool? success;
  Medicine? data;
  bool? hasMorePage;
  int? total;
  MedicineDetailsData fromMap(Map<String, dynamic> dynamicData) {
    return MedicineDetailsData(
        success: dynamicData['success'],
        data: Medicine().fromMap(dynamicData['data']),
        total: dynamicData['total'],
        hasMorePage: dynamicData['can_load_more']);
  }
}

class Medicine {
  Medicine(
      {this.id,
      this.name,
      this.description,
      this.category,
      this.sideEffect,
      this.image,
      this.type,
      this.benfits});

  int? id;
  String? name;
  String? description;
  Category? category;
  String? sideEffect;
  String? image;
  String? type;
  String? benfits;

  String? getPrimaryKey() {
    return id.toString();
  }

  Medicine fromMap(dynamic dynamicData) {
    return Medicine(
      id: dynamicData["id"],
      name: dynamicData["name"],
      image: dynamicData["photo"],
      type: dynamicData["type"],
      sideEffect: dynamicData["side_effect"].toString(),
      benfits: dynamicData["benfits"],
      description: dynamicData["description"],
    );
  }

  Map<String, dynamic>? toMap(Medicine object) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = object.id;
    data["name"] = object.name;
    data['description'] = object.description;
    data["price"] = object.sideEffect;
    data["category"] = Category().toMap(object.category!);
    data['image'] = object.image;

    return data;
  }

  List<Medicine> fromMapList(List<dynamic> dynamicDataList) {
    List<Medicine> prolist = List<Medicine>.from(dynamicDataList.map((x) {
      return fromMap(x);
    }));
    return prolist;
  }

  List<Map<String, dynamic>?> toMapList(List<Medicine> objectList) {
    final List<Map<String, dynamic>?> mapList = <Map<String, dynamic>?>[];
    for (Medicine? data in objectList) {
      if (data != null) {
        mapList.add(toMap(data));
      }
    }
    return mapList;
  }
}

// class ProductDetailData {
//   ProductDetailData({this.success, this.data, this.total, this.hasMorePage});
//   bool? success;
//   ProductDetail? data;
//   bool? hasMorePage;
//   int? total;
//   ProductDetailData fromMap(Map<String, dynamic> dynamicData) {
//     return ProductDetailData(
//         success: dynamicData['success'],
//         data: ProductDetail().fromMap(dynamicData['data']),
//         total: dynamicData['total'],
//         hasMorePage: dynamicData['can_load_more']);
//   }
// }

// class ProductDetail {
//   ProductDetail({
//     this.id,
//     this.name,
//     this.description,
//     this.price,
//     this.title,
//     this.image,
//   });

//   int? id;
//   String? name;
//   String? description;
//   String? price;
//   List<dynamic>? image;
//   String? title;
//   String? getPrimaryKey() {
//     return id.toString();
//   }

//   ProductDetail fromMap(dynamic dynamicData) {
//     return ProductDetail(
//       id: dynamicData["id"],
//       name: dynamicData["name"],
//       description: dynamicData["description"],
//       title: dynamicData["title"],
//       price: dynamicData["price"].toString(),
//       image: dynamicData["images"],
//     );
//   }
// }

// class Meta {
//   Meta({
//     this.totalProduct,
//     this.currentPage,
//     this.lastPage,
//     this.hasMorePage,
//   });

//   int? totalProduct;
//   int? currentPage;
//   int? lastPage;
//   bool? hasMorePage;

//   Meta fromMap(Map<String, dynamic> dynamicData) {
//     return Meta(
//       totalProduct: dynamicData["total_product"],
//       currentPage: dynamicData["current_page"],
//       lastPage: dynamicData["last_page"],
//       hasMorePage: dynamicData["has_more_page"],
//     );
//   }
// }
