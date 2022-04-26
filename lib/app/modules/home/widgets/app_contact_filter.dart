import 'package:contacts_list/app/widget/app_text.dart';
import 'package:flutter/material.dart';

class AppContactFilter extends StatelessWidget {
  bool allContacts;
  Function changeFilterCallback;

  AppContactFilter(
      {Key? key, required this.changeFilterCallback, required this.allContacts})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        changeFilterCallback();
      },
      child: Row(
        children: [
          Container(
            width: 45,
            height: 35,
            decoration: BoxDecoration(
              color: allContacts ? Colors.teal : Colors.transparent,
              // border: Border.all(color: Colors.teal),
              borderRadius: BorderRadius.circular(3),
            ),
            child: Center(
                child: AppText(
              text: 'Todos',
              fontSize: 12,
              fontColor: allContacts ? Colors.white : Colors.grey,
            )),
          ),
          Container(
            width: 45,
            height: 35,
            decoration: BoxDecoration(
              color: !allContacts ? Colors.teal : Colors.transparent,
              // border: Border.all(color: Colors.teal),
              borderRadius: BorderRadius.circular(3),
            ),
            child: Center(
                child: AppText(
              text: 'Meus',
              fontSize: 12,
              fontColor: !allContacts ? Colors.white : Colors.grey,
            )),
          ),
        ],
      ),
    );
  }
}
