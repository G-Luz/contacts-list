import 'package:contacts_list/app/modules/contact/controller/contact_controller.dart';
import 'package:contacts_list/app/modules/contact/modules/contact_details/contact_details_module.dart';
import 'package:contacts_list/app/modules/contact/modules/new_contact/new_contact_module.dart';
import 'package:contacts_list/app/modules/contact/modules/new_contact/new_contact_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ContactModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ContactController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/newContact', module: NewContactModule()),
    ModuleRoute('/contactDetails', module: ContactDetailsModule()),
  ];
}
