class QuestionModel {
  String title;
  bool isChecked;
  QuestionModel({
    required this.title,
    this.isChecked = false,
  });
  @override
  String toString() => title;
}
