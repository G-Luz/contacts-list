import 'package:contacts_list/app/modules/contact/modules/new_contact/controller/new_contact_controller.dart';
import 'package:contacts_list/app/modules/contact/modules/new_contact/new_contact_page.dart';
import 'package:contacts_list/app/routes.dart';
import 'package:flutter_modular/flutter_modular.dart';

class NewContactModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => NewContactController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute("/", child: (_, args) => const NewContactPage()),
  ];
}
