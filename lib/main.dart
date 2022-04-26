import 'package:contacts_list/app/app.dart';
import 'package:contacts_list/app/app_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main(){
  return runApp(ModularApp(module: AppModule(), child: App()));
}