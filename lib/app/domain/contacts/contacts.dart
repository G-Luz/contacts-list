import 'package:azlistview/azlistview.dart';
import 'package:json_annotation/json_annotation.dart';

part 'contacts.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class Contacts extends ISuspensionBean {
  @JsonKey()
  String name;
  @JsonKey()
  String surname;
  @JsonKey()
  String phone;
  @JsonKey()
  String email;

  String tag;

  Contacts(
      {required this.name,
      required this.surname,
      required this.phone,
      required this.email, this.tag = ''});

  factory Contacts.fromJson(Map<String, dynamic> json) =>
      _$ContactsFromJson(json);

  Map<String, dynamic> toJson() => _$ContactsToJson(this);

  static Map<String, dynamic> staticToJson(Contacts contacts) =>
      _$ContactsToJson(contacts);

  @override
  String getSuspensionTag() => tag;
}
