class BookData {
  BookData({
    this.status,
    this.data,
  });
  String? status;
  List<Book>? data;

  BookData fromMap(Map<String, dynamic> dynamicData) {
    if (dynamicData['books'] == null) {
      return BookData(status: dynamicData['status'], data: []);
    } else {
      return BookData(
        status: dynamicData['status'],
        data: Book().fromMapList(dynamicData['books']),
      );
    }
  }
}

class Book {
  Book(
      {this.id,
      this.title,
      this.authors,
      this.subtitle,
      this.image,
      this.url,
      this.description,
      this.publisher,
      this.pages,
      this.year,
      this.download,
      this.status});
  String? id;
  String? title;
  String? authors;
  String? subtitle;
  String? image;
  String? url;
  String? description;
  String? publisher;
  String? pages;
  String? year;
  String? download;
  String? status;
  Book fromMap(dynamic dynamicData) {
    return Book(
      id: dynamicData["id"] ?? "",
      title: dynamicData["title"] ?? "",
      authors: dynamicData["authors"] ?? "",
      subtitle: dynamicData["subtitle"] ?? "",
      image: dynamicData["image"] ?? "",
      url: dynamicData["url"] ?? "",
      description: dynamicData["description"] ?? "",
      publisher: dynamicData["publisher"] ?? "",
      pages: dynamicData["pages"] ?? "",
      year: dynamicData["year"] ?? "",
      download: dynamicData["download"] ?? "",
      status: dynamicData["status"] ?? "",
    );
  }

  Map<String, dynamic>? toMap(Book object) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = object.id;
    data['title'] = object.title;
    data['authors'] = object.authors;
    data['subtitle'] = object.subtitle;
    data['image'] = object.image;
    data['url'] = object.url;
    data['description'] = object.description;
    data['publisher'] = object.publisher;
    data['pages'] = object.pages;
    data['year'] = object.year;
    data['download'] = object.download;
    data['status'] = object.status;
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
