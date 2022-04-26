import 'package:contacts_list/app/domain/contacts/contacts.dart';
import 'package:contacts_list/app/domain/section_contact/section_contacts.dart';
import 'package:contacts_list/app/modules/contact/widgets/app_textfield.dart';
import 'package:contacts_list/app/modules/home/controller/home_controller.dart';
import 'package:contacts_list/app/repositories/contacts/contacts_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'new_contact_controller.g.dart';

class NewContactController = NewContactControllerBase
    with _$NewContactController;

abstract class NewContactControllerBase with Store {
  // final HomeController _homeController = Modular.get();
  final ContactsController _contactsController = Modular.get();


  TextEditingController txtNameController = TextEditingController(text: 'Test');
  TextEditingController txtSurnameController = TextEditingController(text: "surname");
  TextEditingController txtPhoneNumberController = TextEditingController(text: 'phoe');
  TextEditingController txtEmailController = TextEditingController(text: 'email@email.com');
  TextEditingController txtLanguageController =
      TextEditingController(text: 'Português');

  @observable
  ObservableList<Widget> phoneNumberList = <Widget>[].asObservable();

  @observable
  ObservableList<Widget> emailFieldList = <Widget>[].asObservable();

  NewContactControllerBase() {
    phoneNumberList.add(AppTextfield(
      labelName: 'Telefone',
      controller: txtPhoneNumberController,
    ));

    emailFieldList.add(
      AppTextfield(
        labelName: 'E-mail',
        controller: txtEmailController,
      ),
    );
  }

  @action
  addNewField(String typeField) {
    if (typeField == 'email') {
      emailFieldList.add(
        AppTextfield(
          labelName: 'E-mail',
          suffixIcon: IconButton(
            onPressed: () {
              removeField('email');
            },
            icon: const Icon(Icons.remove),
          ),
          controller: TextEditingController(),
        ),
      );
    } else {
      phoneNumberList.add(
        AppTextfield(
            labelName: 'Telefone',
            suffixIcon: IconButton(
              onPressed: () {
                removeField('phoneNumber');
              },
              icon: const Icon(Icons.remove),
            ),
            controller: TextEditingController()),
      );
    }
  }


  @action
  removeField(String typeField) {
    if (typeField == 'email') {
      if (emailFieldList.length > 1) {
        emailFieldList.removeLast();
      }
    } else {
      if (phoneNumberList.length > 1) {
        phoneNumberList.removeLast();
      }
    }
  }

  @action
  bool createNewContact() {
    String name = txtNameController.text;
    String surname = txtSurnameController.text;
    String phoneNumber = txtPhoneNumberController.text;
    String email = txtEmailController.text;

    if (name.isEmpty ||
        surname.isEmpty ||
        phoneNumber.isEmpty ||
        email.isEmpty) {
      return false;
    }

    String sectionLetter = name.substring(0, 1).toUpperCase();
    Contacts contacts = Contacts(
        name: name, surname: surname, phone: phoneNumber, email: email);

    for (int i = 0; i < (_contactsController.sectionContactsList.length); i++) {
      if (_contactsController.sectionContactsList[i].sectionLetter ==
          sectionLetter) {
        _contactsController.sectionContactsList[i].sectionContacts.add(contacts);
        return true;
      } else if (!_contactsController.sectionContactsList
          .map((it) => it.sectionLetter)
          .contains(sectionLetter)) {
        if (!_contactsController.sectionContactsList[i].sectionContacts
            .contains(contacts)) {
          _contactsController.sectionContactsList.add(SectionContacts(
              sectionLetter: sectionLetter, sectionContacts: [contacts]));
          _contactsController.sectionContactsList.sort((a, b) {
            return a.sectionLetter
                .toLowerCase()
                .compareTo(b.sectionLetter.toLowerCase());
          });
        }

        return true;
      }
    }

    return true;
  }
}
