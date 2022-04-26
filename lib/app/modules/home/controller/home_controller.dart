import 'dart:async';
import 'package:contacts_list/app/domain/contacts/contacts.dart';
import 'package:contacts_list/app/domain/section_contact/section_contacts.dart';
import 'package:contacts_list/app/repositories/contacts/contacts_controller.dart';
import 'package:contacts_list/app/repositories/dio/dio_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

class UserOfStream {
  UserOfStream(app) {
    app.onExit.listen((String message) => print(message));
  }
}

abstract class HomeControllerBase with Store {
  final DioController _dioController = Modular.get();
  final ContactsController contactsController =
      Modular.get<ContactsController>();
  Timer? _debounce;

  @observable
  bool allContactsFilter = true;


  late final StreamController<List<Contacts>> _streamController;

  late ObservableStream<List<Contacts>> streamContacts;

  HomeControllerBase(){

    _streamController = StreamController<List<Contacts>>();
    streamContacts = ObservableStream(_streamController.stream, initialValue: []);


  }




  @action
  searchContactData(String contactName) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 1000), () {
      if (contactName.isEmpty) {
        contactsController.contactsList.clear();
        getContactsData();
      }
      List<Contacts> contactsList = [];
      for (Contacts cnt in contactsController.contactsList) {
        if (cnt.name.toLowerCase().contains(contactName.toLowerCase())) {
          contactsList.add(cnt);
        }
      }
      contactsController.contactsList.clear();
      contactsController.contactsList.addAll(contactsList);
    });
  }

  @action
  changeFilter() {
    if (allContactsFilter) {
      allContactsFilter = false;
    } else {
      allContactsFilter = true;
    }
  }

  @action
  Future<void> getSectionContactsData() async {
    contactsController.sectionContactsList
        .addAll(await _dioController.getSectionContacts());
  }

  @action
  Future<void> getContactsData() async {
    contactsController.contactsList
        .addAll(await _dioController.getContacts());
    // return _dioController.getContacts();
  }

  Stream<List<Contacts>> contactsStream() async* {
    while (true) {
      List<Contacts> sectionContactsList = await _dioController.getContacts();
      yield sectionContactsList;
      await Future.delayed(Duration(seconds: 240));
    }
  }

  Stream<List<SectionContacts>> sectionContactsStream() async* {
    while (true) {
      List<SectionContacts> sectionContactsList =
          await _dioController.getSectionContacts();
      yield sectionContactsList;
      await Future.delayed(Duration(seconds: 240));
    }
  }

  void dispose() async {
    _debounce?.cancel();
    await _streamController.close();
  }
}
