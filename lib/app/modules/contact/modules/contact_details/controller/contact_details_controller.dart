import 'package:contacts_list/app/domain/contacts/contacts.dart';
import 'package:contacts_list/app/domain/section_contact/section_contacts.dart';
import 'package:contacts_list/app/modules/home/controller/home_controller.dart';
import 'package:contacts_list/app/repositories/dio/dio_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'contact_details_controller.g.dart';

class ContactDetailsController = ContactDetailsControllerBase
    with _$ContactDetailsController;

abstract class ContactDetailsControllerBase with Store {

  final HomeController _homeController = Modular.get();

  final DioController _dioController = Modular.get();
  Dio dio = Dio();



  getContact(String email){
    // for(SectionContacts sct in _homeController.sectionContactsList){
    //   if(sct.sectionContacts.map((it) => it.email)
    //       .contains(email)){
    //     print("Email existe: $email");
    //   }
    // }


    dio.get('https//:nosso-servidor?$email');

  }

}
