class ExamSubjectModal {
  ExamSubjectModal({
    required this.error,
    required this.data,
  });
  late final bool error;
  late final List<Data> data;

  ExamSubjectModal.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    data = List.from(json['data']).map((e) => Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['error'] = error;
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.subjectName,
    required this.createdAt,
    this.updatedAt,
    required this.examSubjectTopic,
  });
  late final int id;
  late final String subjectName;
  late final String createdAt;
  late final String? updatedAt;
  late final List<ExamSubjectTopic> examSubjectTopic;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subjectName = json['subject_name'];
    createdAt = json['created_at'];
    updatedAt = null;
    examSubjectTopic = List.from(json['exam_subject_topic'])
        .map((e) => ExamSubjectTopic.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['subject_name'] = subjectName;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['exam_subject_topic'] =
        examSubjectTopic.map((e) => e.toJson()).toList();
    return _data;
  }
}

class ExamSubjectTopic {
  ExamSubjectTopic({
    required this.id,
    required this.subjectId,
    required this.topicName,
    required this.createdAt,
    this.updatedAt,
  });
  late final int id;
  late final String subjectId;
  late final String topicName;
  late final String createdAt;
  late final Null updatedAt;

  ExamSubjectTopic.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subjectId = json['subject_id'];
    topicName = json['topic_name'];
    createdAt = json['created_at'];
    updatedAt = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['subject_id'] = subjectId;
    _data['topic_name'] = topicName;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}
