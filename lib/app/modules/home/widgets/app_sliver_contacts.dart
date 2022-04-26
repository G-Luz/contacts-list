import 'package:contacts_list/app/domain/section_contact/section_contacts.dart';
import 'package:contacts_list/app/modules/home/controller/home_controller.dart';
import 'package:contacts_list/app/widget/app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticky_headers/sticky_headers.dart';

class AppSliverContacts extends StatelessWidget {
  SectionContacts contact;

  // int index;

  AppSliverContacts({
    required this.contact,
  });

  final HomeController _homeController = Modular.get();

  @override
  Widget build(BuildContext context) {
    return StickyHeader(

      header: Container(
        height: 30,
        color: Colors.grey,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        alignment: Alignment.centerLeft,
        child: Text(
          '${contact.sectionLetter}',
          style: const TextStyle(color: Colors.white),
        ),
      ),
      content: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: contact.sectionContacts.length,
            // itemCount: _homeController
            //     .sectionContactsList[index].sectionContacts.length,
            itemBuilder: (context, i) {
              return GestureDetector(
                onTap: () {
                  Modular.to.pushNamed('/contact/contactDetails/',
                      arguments: contact.sectionContacts[i]);
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        text:
                            "${contact.sectionContacts[i].name} ${contact.sectionContacts[i].surname}",
                        // "${_homeController.sectionContactsList[index].sectionContacts[i].name} ${_homeController.sectionContactsList[index].sectionContacts[i].surname}",
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      const SizedBox(height: 2),
                      AppText(
                        text: "${contact.sectionContacts[i].email}",
                        // text:
                        //     "${_homeController.sectionContactsList[index].sectionContacts[i].email}",

                        fontSize: 13,
                        fontColor: Colors.tealAccent.withOpacity(0.8),
                      ),
                      const SizedBox(height: 15),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
