import 'package:contacts_list/app/modules/contact/modules/contact_details/contact_details_page.dart';
import 'package:contacts_list/app/modules/contact/modules/contact_details/controller/contact_details_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ContactDetailsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ContactDetailsController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute("/",
        child: (_, args) => ContactDetailsPage(
              contacts: args.data,
            )),
  ];
}
