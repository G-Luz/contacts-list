import 'package:contacts_list/app/domain/contacts/contacts.dart';
import 'package:contacts_list/app/widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppDialog {
  static void show(BuildContext context, Contacts contacts) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xff2d2d2d),
          title: AppText(text: "Contato criado com sucesso!", fontSize: 17, fontWeight: FontWeight.bold,),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppText(
                  text: "A informação foi enviada para validação.",
                  textAlign: TextAlign.center,
                  fontSize: 13,
                  fontColor: Colors.grey),
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Modular.to.pushNamed('/contact/contactDetails', arguments: contacts);
                },
                child: Image.asset(
                  'assets/images/check.gif',
                  width: 180,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
