import 'package:contacts_list/app/domain/contacts/contacts.dart';
import 'package:contacts_list/app/domain/section_contact/section_contacts.dart';

class Helpers {
  static List<SectionContacts> mapSectionContactsList(
      List<dynamic> contactsResponse) {
    contactsResponse.sort((a, b) {
      return a['sectionLetter']
          .toLowerCase()
          .compareTo(b['sectionLetter'].toLowerCase());
    });
    List<SectionContacts> contactList = [];
    for (Map<String, dynamic> contacts in contactsResponse) {
      contactList.add(SectionContacts.fromJson(contacts));
    }
    return contactList;
  }

  static List<Contacts> mapContactsList(List<dynamic> contactsResponse) {
    contactsResponse.sort((a, b) {
      return a['name'].toLowerCase().compareTo(b['name'].toLowerCase());
    });
    List<Contacts> contactList = [];
    for (Map<String, dynamic> contacts in contactsResponse) {
      Contacts contact = Contacts.fromJson(contacts);
      contact.tag = contact.name[0].toUpperCase();
      contactList.add(contact);

    }
    return contactList;
  }
}
