class BookData {
  BookData({
    this.status,
    this.data,
  });
  String? status;
  List<Book>? data;

  BookData fromMap(Map<String, dynamic> dynamicData) {
    return BookData(
      status: dynamicData['status'],
      data: Book().fromMapList(dynamicData['data']),
    );
  }
}

class Book {
  Book({this.title, this.authors, this.subtitle, this.image, this.url});

  String? title;
  String? authors;
  String? subtitle;
  String? image;
  String? url;
  Book fromMap(dynamic dynamicData) {
    return Book(
      title: dynamicData["title"],
      authors: dynamicData["authors"],
      subtitle: dynamicData["subtitle"],
      image: dynamicData["image"],
      url: dynamicData["url"],
    );
  }

  Map<String, dynamic>? toMap(Book object) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = object.title;
    data['authors'] = object.authors;
    data['subtitle'] = object.subtitle;
    data['image'] = object.image;
    data['url'] = object.url;
    return data;
  }

  List<Book> fromMapList(List<dynamic> dynamicDataList) {
    final List<Book> subUserList = <Book>[];
    for (dynamic dynamicData in dynamicDataList) {
      if (dynamicData != null) {
        subUserList.add(fromMap(dynamicData));
      }
    }
    return subUserList;
  }

  List<Map<String, dynamic>?> toMapList(List<Book> objectList) {
    final List<Map<String, dynamic>?> mapList = <Map<String, dynamic>?>[];
    for (Book? data in objectList) {
      if (data != null) {
        mapList.add(toMap(data));
      }
    }
    return mapList;
  }
}
