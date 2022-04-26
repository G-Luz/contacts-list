import 'package:contacts_list/app/widget/app_text.dart';
import 'package:flutter/material.dart';

class AppAddNewField extends StatelessWidget {
  String addFieldText;
  Function addNewFieldCallback;

  AppAddNewField({required this.addFieldText, required this.addNewFieldCallback});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: () {
          addNewFieldCallback();
        },
        child: Row(
          children: [Icon(Icons.add, size: 20), AppText(text: addFieldText)],
        ),
        style: ButtonStyle(
          elevation: MaterialStateProperty.all<double>(0),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
      ),
    );
  }
}
