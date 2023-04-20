import 'package:flutter/material.dart';
import 'package:getwidget/components/accordion/gf_accordion.dart';

class ExamModuleView extends StatelessWidget {
  final String id;
  final String status;
  final String title;
  final String date;
  final String duration;

  const ExamModuleView(
      {Key? key,
      required this.id,
      required this.status,
      required this.title,
      required this.date,
      required this.duration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * (0.700),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: GFAccordion(
          title: title,
          contentChild: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [],
          ),
        ),
      ),
    );
  }
}
