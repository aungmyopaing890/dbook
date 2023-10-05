class BlogData {
  BlogData({
    this.success,
    this.message,
    this.data,
  });
  bool? success;
  String? message;
  List<Blog>? data;

  BlogData fromMap(Map<String, dynamic> dynamicData) {
    return BlogData(
      success: dynamicData['status'],
      data: Blog().fromMapList(dynamicData['data']),
    );
  }
}

class Blog {
  Blog(
      {this.id,
      this.title,
      this.category,
      this.image,
      this.description,
      this.createdAt});

  int? id;
  String? title;
  List<dynamic>? image;
  String? category;
  String? description;
  String? createdAt;

  Blog fromMap(dynamic dynamicData) {
    if (dynamicData != null) {
      return Blog(
        id: dynamicData["id"],
        title: dynamicData["title"],
        category: dynamicData["category"],
        image: dynamicData["photos"],
        description: dynamicData["description"],
        createdAt: dynamicData["created_at"],
      );
    } else {
      return Blog(id: 0);
    }
  }

  Map<String, dynamic>? toMap(Blog object) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = object.id;
    data['title'] = object.title;
    data['image'] = object.image;
    data['description'] = object.description;
    data['created_at'] = object.createdAt;

    return data;
  }

  List<Blog> fromMapList(List<dynamic> dynamicDataList) {
    final List<Blog> subUserList = <Blog>[];
    for (dynamic dynamicData in dynamicDataList) {
      if (dynamicData != null) {
        subUserList.add(fromMap(dynamicData));
      }
    }
    return subUserList;
  }

  List<Map<String, dynamic>?> toMapList(List<Blog> objectList) {
    final List<Map<String, dynamic>?> mapList = <Map<String, dynamic>?>[];
    for (Blog? data in objectList) {
      if (data != null) {
        mapList.add(toMap(data));
      }
    }
    return mapList;
  }
}

class BlogDetailsData {
  BlogDetailsData({
    this.success,
    this.message,
    this.data,
  });
  bool? success;
  String? message;
  Blog? data;

  BlogDetailsData fromMap(Map<String, dynamic> dynamicData) {
    return BlogDetailsData(
      success: dynamicData['success'],
      data: Blog().fromMap(dynamicData['data']),
    );
  }
}

// class BlogDetails {
//   BlogDetails(
//       {this.id,
//       this.title,
//       this.image,
//       this.content,
//       this.category,
//       this.createdAt});

//   int? id;
//   String? title;
//   String? image;
//   String? content;
//   String? category;
//   String? createdAt;

//   BlogDetails fromMap(dynamic dynamicData) {
//     if (dynamicData != null) {
//       return BlogDetails(
//         id: dynamicData["id"],
//         title: dynamicData["title"],
//         image: dynamicData["image"],
//         content: dynamicData["content"],
//         // category: dynamicData["category"],
//         createdAt: dynamicData["created_at"],
//       );
//     } else {
//       return BlogDetails(id: 0);
//     }
//   }

//   Map<String, dynamic>? toMap(BlogDetails object) {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = object.id;
//     data['title'] = object.title;
//     data['image'] = object.image;
//     data['description'] = object.content;
//     data['category'] = object.category;
//     data['created_at'] = object.createdAt;

//     return data;
//   }

//   List<BlogDetails> fromMapList(List<dynamic> dynamicDataList) {
//     final List<BlogDetails> subUserList = <BlogDetails>[];
//     for (dynamic dynamicData in dynamicDataList) {
//       if (dynamicData != null) {
//         subUserList.add(fromMap(dynamicData));
//       }
//     }
//     return subUserList;
//   }

//   List<Map<String, dynamic>?> toMapList(List<BlogDetails> objectList) {
//     final List<Map<String, dynamic>?> mapList = <Map<String, dynamic>?>[];
//     for (BlogDetails? data in objectList) {
//       if (data != null) {
//         mapList.add(toMap(data));
//       }
//     }
//     return mapList;
//   }
// }
