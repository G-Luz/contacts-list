// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on HomeControllerBase, Store {
  final _$allContactsFilterAtom =
      Atom(name: 'HomeControllerBase.allContactsFilter');

  @override
  bool get allContactsFilter {
    _$allContactsFilterAtom.reportRead();
    return super.allContactsFilter;
  }

  @override
  set allContactsFilter(bool value) {
    _$allContactsFilterAtom.reportWrite(value, super.allContactsFilter, () {
      super.allContactsFilter = value;
    });
  }

  final _$getSectionContactsDataAsyncAction =
      AsyncAction('HomeControllerBase.getSectionContactsData');

  @override
  Future<void> getSectionContactsData() {
    return _$getSectionContactsDataAsyncAction
        .run(() => super.getSectionContactsData());
  }

  final _$getContactsDataAsyncAction =
      AsyncAction('HomeControllerBase.getContactsData');

  @override
  Future<void> getContactsData() {
    return _$getContactsDataAsyncAction.run(() => super.getContactsData());
  }

  final _$HomeControllerBaseActionController =
      ActionController(name: 'HomeControllerBase');

  @override
  dynamic searchContactData(String contactName) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.searchContactData');
    try {
      return super.searchContactData(contactName);
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeFilter() {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.changeFilter');
    try {
      return super.changeFilter();
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
allContactsFilter: ${allContactsFilter}
    ''';
  }
}
