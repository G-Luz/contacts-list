import 'package:contacts_list/app/modules/home/controller/home_controller.dart';
import 'package:contacts_list/app/modules/home/home_page.dart';
import 'package:contacts_list/app/routes.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const HomePage()),
  ];
}
