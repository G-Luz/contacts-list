// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_contact_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NewContactController on NewContactControllerBase, Store {
  final _$phoneNumberListAtom =
      Atom(name: 'NewContactControllerBase.phoneNumberList');

  @override
  ObservableList<Widget> get phoneNumberList {
    _$phoneNumberListAtom.reportRead();
    return super.phoneNumberList;
  }

  @override
  set phoneNumberList(ObservableList<Widget> value) {
    _$phoneNumberListAtom.reportWrite(value, super.phoneNumberList, () {
      super.phoneNumberList = value;
    });
  }

  final _$emailFieldListAtom =
      Atom(name: 'NewContactControllerBase.emailFieldList');

  @override
  ObservableList<Widget> get emailFieldList {
    _$emailFieldListAtom.reportRead();
    return super.emailFieldList;
  }

  @override
  set emailFieldList(ObservableList<Widget> value) {
    _$emailFieldListAtom.reportWrite(value, super.emailFieldList, () {
      super.emailFieldList = value;
    });
  }

  final _$NewContactControllerBaseActionController =
      ActionController(name: 'NewContactControllerBase');

  @override
  dynamic addNewField(String typeField) {
    final _$actionInfo = _$NewContactControllerBaseActionController.startAction(
        name: 'NewContactControllerBase.addNewField');
    try {
      return super.addNewField(typeField);
    } finally {
      _$NewContactControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeField(String typeField) {
    final _$actionInfo = _$NewContactControllerBaseActionController.startAction(
        name: 'NewContactControllerBase.removeField');
    try {
      return super.removeField(typeField);
    } finally {
      _$NewContactControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool createNewContact() {
    final _$actionInfo = _$NewContactControllerBaseActionController.startAction(
        name: 'NewContactControllerBase.createNewContact');
    try {
      return super.createNewContact();
    } finally {
      _$NewContactControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
phoneNumberList: ${phoneNumberList},
emailFieldList: ${emailFieldList}
    ''';
  }
}
