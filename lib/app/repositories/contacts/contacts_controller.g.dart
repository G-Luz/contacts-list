// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contacts_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ContactsController on ContactsControllerBase, Store {
  final _$sectionContactsListAtom =
      Atom(name: 'ContactsControllerBase.sectionContactsList');

  @override
  ObservableList<SectionContacts> get sectionContactsList {
    _$sectionContactsListAtom.reportRead();
    return super.sectionContactsList;
  }

  @override
  set sectionContactsList(ObservableList<SectionContacts> value) {
    _$sectionContactsListAtom.reportWrite(value, super.sectionContactsList, () {
      super.sectionContactsList = value;
    });
  }

  final _$contactsListAtom = Atom(name: 'ContactsControllerBase.contactsList');

  @override
  ObservableList<Contacts> get contactsList {
    _$contactsListAtom.reportRead();
    return super.contactsList;
  }

  @override
  set contactsList(ObservableList<Contacts> value) {
    _$contactsListAtom.reportWrite(value, super.contactsList, () {
      super.contactsList = value;
    });
  }

  @override
  String toString() {
    return '''
sectionContactsList: ${sectionContactsList},
contactsList: ${contactsList}
    ''';
  }
}
