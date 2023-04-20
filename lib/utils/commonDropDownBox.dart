// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DropdownButtonFormFieldTemplate extends StatefulWidget {
  String dropdownValue;
  List<String> list;
  DropdownButtonFormFieldTemplate({
    Key? key,
    required this.dropdownValue,
    required this.list,
  }) : super(key: key);

  @override
  State<DropdownButtonFormFieldTemplate> createState() =>
      _DropdownButtonFormFieldTemplateState();
}

class _DropdownButtonFormFieldTemplateState
    extends State<DropdownButtonFormFieldTemplate> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(10),
        enabledBorder: OutlineInputBorder(
          //<-- SEE HERE
          borderSide: BorderSide(
            color: Color.fromARGB(255, 212, 210, 210),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          //<-- SEE HERE
          borderSide: BorderSide(
            color: Color.fromARGB(255, 212, 210, 210),
          ),
        ),
        fillColor: Colors.greenAccent,
      ),
      dropdownColor: Colors.white,
      value: widget.dropdownValue,
      onChanged: (String? newValue) {
        setState(() {
          widget.dropdownValue = newValue!;
        });
      },
      items: widget.list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: TextStyle(fontSize: 12),
          ),
        );
      }).toList(),
    );
  }
}
