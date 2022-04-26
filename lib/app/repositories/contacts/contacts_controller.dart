import 'package:contacts_list/app/domain/contacts/contacts.dart';
import 'package:contacts_list/app/domain/section_contact/section_contacts.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'contacts_controller.g.dart';

class ContactsController = ContactsControllerBase with _$ContactsController;

abstract class ContactsControllerBase with Store {

  @observable
  ObservableList<SectionContacts> sectionContactsList =
  <SectionContacts>[].asObservable();

  @observable
  ObservableList<Contacts> contactsList =
  <Contacts>[].asObservable();



}
