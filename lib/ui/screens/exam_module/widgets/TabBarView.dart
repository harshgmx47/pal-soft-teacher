import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pal_prashnotarri_teacher/features/daily-quiz/cubit/addChecked_cubit.dart';
import 'package:pal_prashnotarri_teacher/features/daily-quiz/cubit/checkbox_cubit.dart';
import 'package:pal_prashnotarri_teacher/utils/uiUtils.dart';
//import 'package:pal_prashnotarri_teacher/utils/uiUtils.dart';

class QuestionsTabBarView extends StatefulWidget {
  const QuestionsTabBarView({Key? key}) : super(key: key);
  @override
  State<QuestionsTabBarView> createState() => _QuestionsTabBarViewState();
}

class _QuestionsTabBarViewState extends State<QuestionsTabBarView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Container(
              height: 48,
              decoration: BoxDecoration(
                  color: Color(0xFF292639),
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(7.0),
                child: TabBar(
                    indicator: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(8)),
                    tabs: [
                      Tab(
                        child: Text(
                          'Select Question',
                          style: TextStyle(
                              color: Colors.orangeAccent, fontSize: 12),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Selected',
                          style: TextStyle(
                              color: Colors.orangeAccent, fontSize: 12),
                        ),
                      )
                    ]),
              ),
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height * (0.9),
                child: TabBarView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * (0.8),
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 20.0),
                            Padding(
                              padding: EdgeInsetsDirectional.only(
                                  start: MediaQuery.of(context).size.height *
                                      0.001,
                                  end:
                                      MediaQuery.of(context).size.width * 0.02),
                              child: TextField(
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor:
                                        Theme.of(context).primaryColorLight,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: BorderSide.none,
                                    ),
                                    hintText: "eg :animals ",
                                    prefixIcon: Icon(Icons.search),
                                    prefixIconColor:
                                        Theme.of(context).primaryColorDark),
                              ),
                            ),
                            SizedBox(height: 15.0),
                            BlocBuilder<CheckboxCubit, CheckboxSuccess>(
                              builder: (context, state) {
                                return Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.0),
                                      color: Theme.of(context).backgroundColor,
                                      boxShadow: [UiUtils.buildBoxShadow()]),
                                  height: MediaQuery.of(context).size.height *
                                      (0.700),
                                  child: ListView.builder(
                                      itemCount: state.list.length,
                                      itemBuilder: (context, index) {
                                        return CheckboxListTile(
                                            title:
                                                Text(state.list[index].title),
                                            value: state.list[index].isChecked,
                                            onChanged: (newValue) => context
                                                .read<CheckboxCubit>()
                                                .toggleNotification(
                                                    index, newValue));
                                      }),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          BlocBuilder<SelectedQuestionCubit,
                              SelectedQuestionSuccess>(
                            builder: (context, state) {
                              return Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4.0),
                                    color: Theme.of(context).backgroundColor,
                                    boxShadow: [UiUtils.buildBoxShadow()]),
                                height: MediaQuery.of(context).size.height *
                                    (0.700),
                                child: ListView.builder(
                                    itemCount: state.list.length,
                                    itemBuilder: (context, index) {
                                      return ListTile(
                                        leading: IconButton(
                                          onPressed: () {
                                            context
                                                .read<SelectedQuestionCubit>()
                                                .removeItem(index);
                                          },
                                          icon: Icon(Icons.delete_rounded),
                                        ),
                                        title: Text(state.list[index].title),
                                      );
                                    }), //QuestionCheckBoxWidget()
                              );
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
