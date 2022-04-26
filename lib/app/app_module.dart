import 'package:contacts_list/app/modules/contact/contact_module.dart';
import 'package:contacts_list/app/modules/home/controller/home_controller.dart';
import 'package:contacts_list/app/modules/home/home_module.dart';
import 'package:contacts_list/app/repositories/contacts/contacts_controller.dart';
import 'package:contacts_list/app/repositories/dio/dio_controller.dart';
import 'package:contacts_list/app/routes.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => DioController(), isSingleton: true),
    Bind((i) => ContactsController(), isSingleton: true),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Routes.initialRoute, module: HomeModule()),
    ModuleRoute("/contact", module: ContactModule()),

  ];
}
