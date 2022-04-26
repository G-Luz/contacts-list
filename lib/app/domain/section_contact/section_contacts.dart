import 'package:azlistview/azlistview.dart';
import 'package:contacts_list/app/domain/contacts/contacts.dart';

import 'package:json_annotation/json_annotation.dart';

part 'section_contacts.g.dart';

@JsonSerializable()
class SectionContacts {

  final String sectionLetter;
  final List<Contacts> sectionContacts;

  SectionContacts({required this.sectionLetter, required this.sectionContacts});

  factory SectionContacts.fromJson(Map<String, dynamic> json) =>
      _$SectionContactsFromJson(json);

  static Map<String, dynamic> toJson(SectionContacts sectionContacts) =>
      _$SectionContactsToJson(sectionContacts);

}
