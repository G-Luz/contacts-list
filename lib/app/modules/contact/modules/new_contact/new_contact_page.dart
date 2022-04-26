import 'package:contacts_list/app/domain/contacts/contacts.dart';
import 'package:contacts_list/app/modules/contact/modules/new_contact/controller/new_contact_controller.dart';
import 'package:contacts_list/app/modules/contact/widgets/app_add_new_field.dart';
import 'package:contacts_list/app/modules/contact/widgets/app_bottom_button.dart';
import 'package:contacts_list/app/modules/contact/widgets/app_dialog.dart';
import 'package:contacts_list/app/modules/contact/widgets/app_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class NewContactPage extends StatefulWidget {
  const NewContactPage({Key? key}) : super(key: key);

  @override
  _NewContactPagrState createState() => _NewContactPagrState();
}

class _NewContactPagrState
    extends ModularState<NewContactPage, NewContactController> {
  @override
  Widget build(BuildContext context) {
    final snackBar = SnackBar(
      content: const Text('Preencha os campos corretamente!'),
      action: SnackBarAction(
        label: 'Fechar',
        onPressed: () {},
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Criar contato"),
        centerTitle: true,
        leading: IconButton(
            onPressed: () => {Modular.to.pop()}, icon: const Icon(Icons.close)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                if (controller.createNewContact()) {
                  String name = controller.txtNameController.text;
                  String surname = controller.txtSurnameController.text;
                  String phoneNumber = controller.txtPhoneNumberController.text;
                  String email = controller.txtEmailController.text;

                  Contacts contact = Contacts(
                      name: name,
                      surname: surname,
                      phone: phoneNumber,
                      email: email);

                  AppDialog.show(context, contact);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              icon: const Icon(Icons.check))
        ],
      ),
      bottomSheet: Container(
        height: 75,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            AppBottomButton(
                buttonText: 'Digitalizar cartão', icon: Icons.credit_card),
            AppBottomButton(buttonText: 'Importar', icon: Icons.person_add_alt),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin:
                const EdgeInsets.only(left: 20, right: 20, bottom: 85, top: 10),
            child: Observer(builder: (context) {
              return Column(
                children: [
                  AppTextfield(
                      labelName: 'Nome',
                      controller: controller.txtNameController),
                  AppTextfield(
                      labelName: 'Sobrenome',
                      controller: controller.txtSurnameController),
                  for (Widget phoneNumberField in controller.phoneNumberList)
                    phoneNumberField,
                  AppAddNewField(
                      addFieldText: 'Adicionar telefone',
                      addNewFieldCallback: () {
                        controller.addNewField('phoneNumber');
                      }),
                  for (Widget emailField in controller.emailFieldList)
                    emailField,
                  AppAddNewField(
                      addFieldText: 'Adicionar e-mail',
                      addNewFieldCallback: () {
                        controller.addNewField('email');
                      }),
                  AppTextfield(
                      labelName: 'Idioma',
                      isEnable: false,
                      controller: controller.txtLanguageController),
                  AppTextfield(
                    labelName: 'Observações',
                    maxLines: 2,
                    controller: TextEditingController(),
                  ),
                  AppTextfield(
                    labelName: 'Numero do cliente',
                    controller: TextEditingController(),
                  ),
                  AppTextfield(
                    labelName: 'RGPD',
                    controller: TextEditingController(),
                  ),
                  AppTextfield(
                    labelName: 'Empresas',
                    controller: TextEditingController(),
                  ),
                  AppTextfield(
                    labelName: 'Setor de atividade',
                    controller: TextEditingController(),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
