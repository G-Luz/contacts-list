import 'package:contacts_list/app/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MaterialApp.router(
      title: 'Contact list app',
      // theme: ThemeData.dark(),
      theme: ThemeData(
        brightness: Brightness.dark,
        accentColor: Colors.teal,
        primarySwatch: Colors.teal
        // bottomSheetTheme: BottomSheetThemeData(
        //     backgroundColor: Colors.black.withOpacity(0))
      ),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
