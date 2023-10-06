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
      this.status,
      this.isFavourite = false});
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
  bool isFavourite;
  Book fromMap(dynamic dynamicData) {
    return Book(
      id: dynamicData[BooksFields.id] ?? "",
      title: dynamicData[BooksFields.title] ?? "",
      authors: dynamicData[BooksFields.authors] ?? "",
      subtitle: dynamicData[BooksFields.subtitle] ?? "",
      image: dynamicData[BooksFields.image] ?? "",
      url: dynamicData[BooksFields.url] ?? "",
      description: dynamicData[BooksFields.description] ?? "",
      publisher: dynamicData[BooksFields.publisher] ?? "",
      pages: dynamicData[BooksFields.pages] ?? "",
      year: dynamicData[BooksFields.year] ?? "",
      download: dynamicData[BooksFields.download] ?? "",
      status: dynamicData[BooksFields.status] ?? "",
      isFavourite: dynamicData[BooksFields.isFavourite] ?? false,
    );
  }

  Map<String, Object> toMap(Book object) {
    final Map<String, Object> data = <String, Object>{};
    data[BooksFields.id] = object.id ?? "";
    data[BooksFields.title] = object.title ?? "";
    data[BooksFields.authors] = object.authors ?? "";
    data[BooksFields.subtitle] = object.subtitle ?? "";
    data[BooksFields.image] = object.image ?? "";
    data[BooksFields.url] = object.url ?? "";
    data[BooksFields.description] = object.description ?? "";
    data[BooksFields.publisher] = object.publisher ?? "";
    data[BooksFields.pages] = object.pages ?? "";
    data[BooksFields.year] = object.year ?? "";
    data[BooksFields.download] = object.download ?? "";
    data[BooksFields.status] = object.status ?? "";
    data[BooksFields.isFavourite] = object.isFavourite == true ? 1 : 0;
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

const String tableBook = 'books';

class BooksFields {
  static final List<String> values = [
    id,
    title,
    authors,
    subtitle,
    image,
    url,
    description,
    publisher,
    pages,
    year,
    download,
    status,
    isFavourite
  ];

  static const String id = 'id';
  static const String title = 'title';
  static const String authors = 'authors';
  static const String subtitle = 'subtitle';
  static const String image = 'image';
  static const String url = 'url';
  static const String description = 'description';
  static const String publisher = 'publisher';
  static const String pages = 'pages';
  static const String year = 'year';
  static const String download = 'download';
  static const String status = 'status';
  static const String isFavourite = 'is_favourite';
}
