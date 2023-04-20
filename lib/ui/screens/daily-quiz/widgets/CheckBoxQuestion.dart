import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:pal_prashnotarri_teacher/features/daily_quiz/model/questions.dart';
// import 'package:pal_prashnotarri_teacher/utils/constants.dart';

class QuestionCheckBoxWidget extends StatefulWidget {
  QuestionCheckBoxWidget({Key? key}) : super(key: key);

  @override
  State<QuestionCheckBoxWidget> createState() => _QuestionCheckBoxWidgetState();
}

class _QuestionCheckBoxWidgetState extends State<QuestionCheckBoxWidget> {
  // final allSet_true = QuestionModel(title: 'Select all');
  // @override
  // void initState() {
  //   log(" message:${selectedItem}");
  //   selectedItem.clear();
  //   super.initState();
  // }

  // Widget buildCheckbox({
  //   required QuestionModel questionModel,
  //   required VoidCallback onClicked,
  // }) =>
  //     ListTile(
  //       onTap: onClicked,
  //       leading: (Checkbox(
  //         value: questionModel.value,
  //         onChanged: (value) => onClicked(),
  //       )),
  //       title: Text(
  //         questionModel.title,
  //         style: TextStyle(
  //           fontSize: 12,
  //         ),
  //       ),
  //     );

  // Widget buildSingleCheckbox(QuestionModel questionModel) => buildCheckbox(
  //       questionModel: questionModel,
  //       onClicked: () {
  //         setState(() {
  //           final newValue = !questionModel.value;
  //           questionModel.value = newValue;

  //           if (!newValue) {
  //             allSet_true.value = false; //if all checkebox is not set true
  //           } else {
  //             //set single chekcbox true
  //             final allow =
  //                 questionsList.every((questionModel) => questionModel.value);
  //             allSet_true.value = allow;
  //             selectedItem
  //                 .addAll(questionsList.where((element) => element.value));
  //             print(selectedItem);
  //             print(selectedItem.length);
  //           }
  //         });
  //       },
  //     );
  // Widget buildToggleCheckbox(QuestionModel questionModel) => buildCheckbox(
  //     questionModel: questionModel,
  //     onClicked: () {
  //       final newValue = !questionModel.value;
  //       setState(() {
  //         allSet_true.value = newValue;
  //         questionsList.forEach((questionModel) {
  //           questionModel.value = newValue;
  //           // selectedItem.addAll(questionsList.where((element) {
  //           //   log("data:${element.value} /n message:${selectedItem}");
  //           //   return element.value;
  //           // }));

  //           print(selectedItem);
  //           print(selectedItem.length);
  //         });
  //       });
  //     });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            //buildToggleCheckbox(allSet_true),
            Divider(),
            // ...questionsList.map(buildSingleCheckbox).toList(),
          ],
        ),
      ),
    );
  }
}
