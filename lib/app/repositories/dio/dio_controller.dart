import 'package:contacts_list/app/domain/contacts/contacts.dart';
import 'package:contacts_list/app/repositories/dio/helper/helpers.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'dio_controller.g.dart';

class DioController = DioControllerBase with _$DioController;

abstract class DioControllerBase with Store {
  var dio = Dio();

  Future<dynamic> getSectionContacts() async {
    dio.options.headers['secret-key'] =
        '\$2b\$10\$mQT86VKOy5DJEh/fXFEjZulqIv8p2tJ/yr/QsJ2t4uSBUBp3fOO/W';
    Response response =
        await dio.get('https://api.jsonbin.io/b/623bcbe0a703bb674933277f');
    return Helpers.mapSectionContactsList(response.data);
  }

  Future<List<Contacts>> getContacts() async {
    dio.options.headers['secret-key'] =
        '\$2b\$10\$mQT86VKOy5DJEh/fXFEjZulqIv8p2tJ/yr/QsJ2t4uSBUBp3fOO/W';
    Response response =
        await dio.get('https://api.jsonbin.io/b/623a4b19a703bb67493236a0/3');
    return Helpers.mapContactsList(response.data);
  }
}
