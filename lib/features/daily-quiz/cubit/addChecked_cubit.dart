// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pal_prashnotarri_teacher/features/daily-quiz/model/questions.dart';
import 'package:pal_prashnotarri_teacher/utils/constants.dart';

abstract class SelectedQuestionState {}

class SelectedQuestionInitialState extends SelectedQuestionState {
  late final List<QuestionModel> list;
}

class SelectedQuestionInProgress extends SelectedQuestionState {}

class SelectedQuestionSuccess extends SelectedQuestionState {
  List<QuestionModel> list;
  SelectedQuestionSuccess({
    required this.list,
  });

  SelectedQuestionSuccess copyWith({
    List<QuestionModel>? list,
  }) {
    return SelectedQuestionSuccess(
      list: list ?? this.list,
    );
  }
}

class SelectedQuestionError extends SelectedQuestionState {
  final String errorMessage;
  SelectedQuestionError(this.errorMessage);
}

class SelectedQuestionCubit extends Cubit<SelectedQuestionSuccess> {
  SelectedQuestionCubit() : super(SelectedQuestionSuccess(list: selectedItem));

  void addData(int index, bool value) {
    if (value == true) {
      emit(state.copyWith(
          list: List.from(state.list)..add(questionsList.elementAt(index))));
    } else {
      return;
    }
  }

  void removeItem(int index) {
    emit(state.copyWith(list: List.from(state.list)..removeAt(index)));
  }
}
