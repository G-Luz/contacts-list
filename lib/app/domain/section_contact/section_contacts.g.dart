// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'section_contacts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SectionContacts _$SectionContactsFromJson(Map<String, dynamic> json) =>
    SectionContacts(
      sectionLetter: json['sectionLetter'] as String,
      sectionContacts: (json['sectionContacts'] as List<dynamic>)
          .map((e) => Contacts.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SectionContactsToJson(SectionContacts instance) =>
    <String, dynamic>{
      'sectionLetter': instance.sectionLetter,
      'sectionContacts': instance.sectionContacts,
    };
