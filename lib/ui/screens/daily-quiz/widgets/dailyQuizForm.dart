import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pal_prashnotarri_teacher/utils/commonDropDownBox.dart';

class DropDownView extends StatefulWidget {
  const DropDownView({Key? key}) : super(key: key);

  @override
  State<DropDownView> createState() => _DropDownViewState();
}

class _DropDownViewState extends State<DropDownView> {
  final _formKey = GlobalKey<FormState>();
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
            // SizedBox(
            //   height: MediaQuery.of(context).size.height * (0.02),
            // ),

            DropdownButtonFormFieldTemplate(
                dropdownValue: 'Select Language',
                list: <String>['Select Language', 'Hindi', 'Gujarati']),
            SizedBox(
              height: MediaQuery.of(context).size.height * (0.02),
            ),
            DropdownButtonFormFieldTemplate(
                dropdownValue: 'Select Standard',
                list: <String>[
                  'Select Standard',
                  'STD 6',
                  'STD 7',
                  'STD 9',
                  'STD 10'
                ]),
            SizedBox(
              height: MediaQuery.of(context).size.height * (0.02),
            ),
            DropdownButtonFormFieldTemplate(
                dropdownValue: 'Select Subject',
                list: <String>[
                  'Select Subject',
                  'English',
                  'Gujarati',
                  'Science'
                ]),
            SizedBox(
              height: MediaQuery.of(context).size.height * (0.02),
            ),
            DropdownButtonFormFieldTemplate(
                dropdownValue: 'Select Chapter',
                list: <String>['Select Chapter']),
            SizedBox(
              height: MediaQuery.of(context).size.height * (0.02),
            ),

            filterData(),
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

// Filter The Question Based on Dropdownlist
  Widget filterData() {
    return Container(
      child: SizedBox(
        width: 300,
        child: Column(
          children: <Widget>[
            SizedBox(
              width: 300,
              child: CupertinoButton(
                child: Text("Filter Data"),
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
