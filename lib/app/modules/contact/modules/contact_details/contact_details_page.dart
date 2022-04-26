import 'package:contacts_list/app/domain/contacts/contacts.dart';
import 'package:contacts_list/app/modules/contact/modules/contact_details/controller/contact_details_controller.dart';
import 'package:contacts_list/app/modules/contact/widgets/app_textfield.dart';
import 'package:contacts_list/app/widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ContactDetailsPage extends StatefulWidget {
  Contacts contacts;
  ContactDetailsPage({Key? key, required this.contacts}) : super(key: key);

  @override
  _ContactDetailsPageState createState() => _ContactDetailsPageState();
}

class _ContactDetailsPageState
    extends ModularState<ContactDetailsPage, ContactDetailsController> {
  Contacts contacts = Modular.args.data;

  @override
  Widget build(BuildContext context) {
    print("Modular args: ${Contacts.staticToJson(Modular.args.data)}");

    print("Widget: ${Contacts.staticToJson(widget.contacts)}");

    controller.getContact(contacts.email);

    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Detalhe do contato"),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.edit))
            ],
          ),
          body: SingleChildScrollView(
            child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                text: "${contacts.name} ${contacts.surname}",
                                fontSize: 27,
                                fontWeight: FontWeight.bold,
                              ),
                              AppText(
                                text: "${contacts.name} ${contacts.surname}",
                                fontColor: Colors.tealAccent,
                                fontSize: 18,
                              )
                            ],
                          ),
                          const Icon(
                            Icons.star_rate,
                            color: Colors.tealAccent,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            height: 55,
                            width: 55,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: Colors.tealAccent, width: 1)),
                            child: Icon(Icons.email_outlined)),
                        Container(
                            height: 55,
                            width: 55,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: Colors.tealAccent, width: 1)),
                            child: Icon(Icons.call)),
                        Container(
                            height: 55,
                            width: 55,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: Colors.tealAccent, width: 1)),
                            child: Icon(Icons.sms_outlined)),
                        Container(
                            height: 55,
                            width: 55,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: Colors.tealAccent, width: 1)),
                            child: Icon(Icons.whatsapp_outlined)),
                      ],
                    ),
                    Container(
                      child: const TabBar(
                        tabs: [
                          Tab(text: 'Pessoas'),
                          Tab(text: 'Empresas'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: 350,
                      child: TabBarView(
                        children: [
                          Column(
                            children: [
                              AppTextfield(
                                labelName: 'Telefone',
                                controller:
                                    TextEditingController(text: contacts.phone),
                                isEnable: false,
                              ),
                              AppTextfield(
                                labelName: 'E-mail',
                                controller:
                                    TextEditingController(text: contacts.email),
                                isEnable: false,
                              ),
                              AppTextfield(
                                labelName: 'Pais',
                                controller:
                                    TextEditingController(text: 'Brasil'),
                                isEnable: false,
                              ),
                              AppTextfield(
                                labelName: 'Empresa',
                                controller:
                                    TextEditingController(text: 'NewGo'),
                                isEnable: false,
                              ),
                              AppTextfield(
                                labelName: 'Cargo',
                                controller: TextEditingController(text: 'Dev'),
                                isEnable: false,
                              ),
                            ],
                          ),
                          Center(child: AppText(text: 'Time line')),
                        ],
                      ),
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
