class SearchKeyword {
  SearchKeyword({
    this.id,
    this.searchKeyword,
  });

  String? id;
  String? searchKeyword;

  String getPrimaryKey() {
    return id.toString();
  }

  SearchKeyword fromMap(dynamic dynamicData) {
    if (dynamicData != null) {
      return SearchKeyword(
        id: dynamicData['keyword_id'],
        searchKeyword: dynamicData['keyword'],
      );
    } else {
      return SearchKeyword();
    }
  }

  Map<String, dynamic>? toMap(SearchKeyword object) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['keyword_id'] = object.id;
    data['keyword'] = object.searchKeyword;
    return data;
  }

  List<SearchKeyword> fromMapList(List<dynamic> dynamicDataList) {
    final List<SearchKeyword> subUserList = <SearchKeyword>[];
    for (dynamic dynamicData in dynamicDataList) {
      if (dynamicData != null) {
        subUserList.add(fromMap(dynamicData));
      }
    }
    return subUserList;
  }

  List<Map<String, dynamic>?> toMapList(List<SearchKeyword> objectList) {
    final List<Map<String, dynamic>?> mapList = <Map<String, dynamic>?>[];
    for (SearchKeyword? data in objectList) {
      if (data != null) {
        mapList.add(toMap(data));
      }
    }
    return mapList;
  }
}
