import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pal_prashnotarri_teacher/utils/commontextbox.dart';

class ExamModuleFormView extends StatefulWidget {
  const ExamModuleFormView({Key? key}) : super(key: key);

  @override
  State<ExamModuleFormView> createState() => _ExamModuleFormViewState();
}

class _ExamModuleFormViewState extends State<ExamModuleFormView> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController dateinput = TextEditingController();
  TextEditingController edtDuration = TextEditingController();
  TextEditingController editTitle = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsetsDirectional.only(
            start: MediaQuery.of(context).size.width * .04,
            end: MediaQuery.of(context).size.height * .04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * (0.02),
            ),
            // _DropDownViewCommon('Select Language',
            //     <String>['Select Language', 'Hindi', 'Gujarati']),
            TextFormFieldTemplate(
                initialValue: "0",
                labelText: "Title",
                hintText: "Enter Title",
                controller: editTitle),
            SizedBox(
              height: MediaQuery.of(context).size.height * (0.02),
            ),
            TextFormFieldTemplate(
                initialValue: "0",
                labelText: "Date",
                hintText: "Date",
                controller: dateinput,
                // onChanged: (value) {},
                onSubmitted: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(
                          2000), //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2101));

                  if (pickedDate != null) {
                    print(
                        pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                    String formattedDate =
                        DateFormat('dd-MM-yyyy').format(pickedDate);
                    print(
                        formattedDate); //formatted date output using intl package =>  2021-03-16
                    //you can implement different kind of Date Format here according to your requirement

                    setState(() {
                      dateinput.text =
                          formattedDate; //set output date to TextField value.
                    });
                  } else {
                    print("Date is not selected");
                  }
                }),
            SizedBox(
              height: MediaQuery.of(context).size.height * (0.02),
            ),
            TextFormFieldTemplate(
              initialValue: "0",
              labelText: "Duration",
              hintText: "Duration (in minutes)",
              controller: edtDuration,
              //onChanged: (value) {},
              //onSubmitted: () {},
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * (0.02),
            ),
            sumbitButton(),
            SizedBox(
              height: MediaQuery.of(context).size.height * (0.02),
            ),
            Container(
              color: Theme.of(context).primaryColor.withOpacity(0.25),
              height: 1.75,
            )
          ],
        ),
      ),
    );
  }

  Widget sumbitButton() {
    return Container(
      child: SizedBox(
        width: 300,
        child: Column(
          children: <Widget>[
            SizedBox(
              width: 300,
              child: CupertinoButton(
                child: Text("Submit"),
                // child: Center(
                //     child: CircularProgressContainer(
                //   heightAndWidth: 40,
                //   useWhiteLoader: true,
                // )),
                color: Theme.of(context).primaryColor,
                onPressed: (() {}),
              ),
            )
          ],
        ),
      ),
    );
  }
}
