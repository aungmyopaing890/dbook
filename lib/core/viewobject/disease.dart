class DiseaseData {
  DiseaseData({
    this.success,
    this.message,
    this.data,
  });
  bool? success;
  String? message;
  List<Disease>? data;

  DiseaseData fromMap(Map<String, dynamic> dynamicData) {
    return DiseaseData(
      success: dynamicData['status'],
      message: 'Success',
      data: Disease().fromMapList(dynamicData['data']),
    );
  }
}

class DiseaseDetailsData {
  DiseaseDetailsData({
    this.success,
    this.message,
    this.data,
  });
  bool? success;
  String? message;
  Disease? data;

  DiseaseDetailsData fromMap(Map<String, dynamic> dynamicData) {
    return DiseaseDetailsData(
      success: dynamicData['status'],
      message: 'Success',
      data: Disease().fromMap(dynamicData['data']),
    );
  }
}

class Disease {
  Disease({this.id, this.name, this.image, this.questions});
  String? id;
  String? name;
  String? image;
  List<Question>? questions;
  Disease fromMap(dynamic dynamicData) {
    return Disease(
        id: dynamicData["id"].toString(),
        name: dynamicData["name"],
        image: dynamicData["photo"],
        questions: dynamicData["questions"] == null
            ? null
            : Question().fromMapList(dynamicData["questions"]));
  }

  List<Disease> fromMapList(List<dynamic> dynamicDataList) {
    final List<Disease> subUserList = <Disease>[];
    for (dynamic dynamicData in dynamicDataList) {
      if (dynamicData != null) {
        subUserList.add(fromMap(dynamicData));
      }
    }
    return subUserList;
  }
}

class Question {
  Question({
    this.id,
    this.question,
    this.isSelected,
    this.isYes,
  });
  String? id;
  String? question;
  bool? isSelected;
  bool? isYes;

  Question fromMap(dynamic dynamicData) {
    return Question(
        id: dynamicData["id"].toString(),
        question: dynamicData["question"],
        isSelected: false,
        isYes: false);
  }

  List<Question> fromMapList(List<dynamic> dynamicDataList) {
    final List<Question> subUserList = <Question>[];
    for (dynamic dynamicData in dynamicDataList) {
      if (dynamicData != null) {
        subUserList.add(fromMap(dynamicData));
      }
    }
    return subUserList;
  }
}
