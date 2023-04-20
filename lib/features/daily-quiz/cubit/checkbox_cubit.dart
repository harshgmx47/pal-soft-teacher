import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pal_prashnotarri_teacher/features/daily-quiz/model/questions.dart';
import 'package:pal_prashnotarri_teacher/utils/constants.dart';

part 'checkbox_state.dart';

class CheckboxCubit extends Cubit<CheckboxSuccess> {
  CheckboxCubit()
      : super(CheckboxSuccess(list: questionsList)); //list is initialized

  //this function will show a list of data
  //where we can check our value with true and false
  //default value is false
  void toggleNotification(int index, bool? newValue) {
    emit(
      state.copyWith(
        list: List.from(state.list)..[index].isChecked = newValue!,
      ),
    );
    // selectedItem.addAllstate.list)
    //..where((element) => element['isChecked'] = newValue));
  }

  // void additem(int index, bool? newValue) {
  //   emit(state.copyWith(list: List.from(selectedItem)));
  // }
}
