import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pal_prashnotarri_teacher/features/daily-quiz/cubit/addChecked_cubit.dart';
import 'package:pal_prashnotarri_teacher/features/daily-quiz/cubit/checkbox_cubit.dart';
//import 'package:pal_prashnotarri_teacher/app/appLocalization.dart';
import 'package:pal_prashnotarri_teacher/ui/screens/dashboard/widgets/navigation_drawer.dart';
import 'package:pal_prashnotarri_teacher/ui/screens/exam_module/widgets/ExamModuleForm.dart';
import 'package:pal_prashnotarri_teacher/ui/screens/exam_module/widgets/exammoduleview.dart';
import 'package:pal_prashnotarri_teacher/ui/widgets/customBackButton.dart';
import 'package:pal_prashnotarri_teacher/utils/uiUtils.dart';

class ExamModule extends StatefulWidget {
  const ExamModule({Key? key}) : super(key: key);

  @override
  State<ExamModule> createState() => _ExamModuleState();
  static Route<dynamic> route(RouteSettings routeSettings) {
    return CupertinoPageRoute(
        builder: (context) => MultiBlocProvider(providers: [
              BlocProvider<CheckboxCubit>(
                create: (_) => CheckboxCubit(),
              ),
              BlocProvider<SelectedQuestionCubit>(
                create: (_) => SelectedQuestionCubit(),
              )
            ], child: ExamModule()));
  }
}

class _ExamModuleState extends State<ExamModule> {
  //static final padding = EdgeInsets.symmetric(horizontal: 20);
  // static final color = Color.fromRGBO(0, 0, 0, 0.03);

  Widget _buildEducationTile({
    required BuildContext context,
  }) {
    return LayoutBuilder(builder: (context, boxConstraints) {
      return Container(
        //decoration: BoxDecoration(border: Border.all()),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  //decoration: BoxDecoration(border: Border.all()),
                  width: boxConstraints.maxWidth * (0.9),
                  child: ExpansionTile(
                    initiallyExpanded: true,
                    title: Text("Create Exam form"),
                    children: [ExamModuleFormView()],
                  ),
                )
              ],
            ),
            Spacer(),
          ],
        ),
        width: boxConstraints.maxWidth * (0.9),
        //height: 50,
      );
    });
  }

  Widget _buildExamModuleContainer(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * (0.84),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Theme.of(context).backgroundColor,
          boxShadow: [UiUtils.buildBoxShadow()]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * (0.025),
          ),
          Container(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: CustomBackButton(
                      iconColor: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Exam Module",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor, fontSize: 20.0),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * (0.025),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Center(
                child: Container(
                  child: Column(
                    children: [
                      // Align(
                      //   alignment: Alignment.centerLeft,
                      //   child: Padding(
                      //     padding: const EdgeInsets.all(8.0),
                      //     child: Text(
                      //       "",
                      //       style: TextStyle(
                      //           color: Theme.of(context).primaryColor,
                      //           fontSize: 14.0),
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: MediaQuery.of(context).size.height * (0.025),
                      // ),
                      Container(
                        color: Theme.of(context).primaryColor.withOpacity(0.25),
                        height: 1.75,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * (0.015),
                      ),
                      _buildEducationTile(
                        context: context,
                      ),

                      SizedBox(
                        height: MediaQuery.of(context).size.height * (0.015),
                      ),
                      Align(
                        alignment: AlignmentDirectional.topCenter,
                        child: Padding(
                          padding: EdgeInsetsDirectional.only(
                              start: MediaQuery.of(context).size.width * .04,
                              end: MediaQuery.of(context).size.height * .04),
                          child: Text(
                            "Exam Module View / Update / Delete",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * (0.005),
                      ),
                      ExamModuleView(
                        date: "30-01-2023",
                        duration: '5',
                        status: 'Active',
                        id: '1',
                        title: 'Maths',
                      ),
                      // QuestionsTabBarView(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * (0.015),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top,
            ),
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  _buildExamModuleContainer(context),
                  SizedBox(
                    height: 30.0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
