// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'checkbox_cubit.dart';

@immutable
abstract class CheckboxState {}

class CheckboxInitial extends CheckboxState {}

class CheckBoxError extends CheckboxState {
  final String errorMessage;
  CheckBoxError(this.errorMessage);
}

// ignore: must_be_immutable
class CheckboxSuccess extends CheckboxState {
  List<QuestionModel> list; // list model

  CheckboxSuccess({
    required this.list,
  });
  //initialize list and fetch details from list
  CheckboxSuccess copyWith({
    List<QuestionModel>? list,
  }) {
    return CheckboxSuccess(
      list: list ?? this.list,
    );
  }
}
