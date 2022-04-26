import 'dart:async';
import 'package:contacts_list/app/domain/contacts/contacts.dart';
import 'package:contacts_list/app/domain/section_contact/section_contacts.dart';
import 'package:contacts_list/app/modules/home/controller/home_controller.dart';
import 'package:contacts_list/app/modules/home/widgets/app_contact_filter.dart';
import 'package:contacts_list/app/modules/home/widgets/app_sliver_contacts.dart';
import 'package:contacts_list/app/routes.dart';
import 'package:contacts_list/app/widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rxdart/rxdart.dart';
import 'package:azlistview/azlistview.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  void initState() {
    super.initState();
    controller.getContactsData();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("A:360°"),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.menu_outlined))
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Modular.to.pushNamed('/contact/newContact/');
            },
            // child: Icon(Icons.group_add),
            backgroundColor: Colors.teal,
            child: Icon(Icons.add),
          ),
          body: Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(text: 'Contatos', fontSize: 25),
                      Observer(builder: (context) {
                        return AppContactFilter(
                            allContacts: controller.allContactsFilter,
                            changeFilterCallback: () {
                              controller.changeFilter();
                            });
                      }),
                    ],
                  ),
                ),
                Container(
                  child: const TabBar(
                    tabs: [
                      Tab(text: 'Pessoas'),
                      Tab(text: 'Empresas'),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 40,
                            margin: EdgeInsets.only(top: 15, bottom: 30),
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(5)),
                            child: TextField(
                              cursorColor: Colors.teal,
                              style: const TextStyle(fontSize: 17),
                              decoration: const InputDecoration(
                                  hintText: 'Pesquisar',
                                  border: InputBorder.none,
                                  prefixIcon:
                                      Icon(Icons.search, color: Colors.teal)),
                              onChanged: (value) {
                                controller.searchContactData(value);
                              },
                            ),
                          ),

                          Expanded(
                            child: Observer(builder: (context) {
                              final value = store.streamContacts.value;
                              print("StreamValue: ${value}");

                              if (controller
                                  .contactsController.contactsList.isNotEmpty) {
                                SuspensionUtil.sortListBySuspensionTag(
                                    controller.contactsController.contactsList);



                                return Observer(builder: (context) {
                                  SuspensionUtil.setShowSuspensionStatus(
                                      controller.contactsController.contactsList);

                                  return AzListView(
                                    data: controller
                                        .contactsController.contactsList,
                                    itemCount: controller
                                        .contactsController.contactsList.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      Contacts contact = controller
                                          .contactsController
                                          .contactsList[index];

                                      final tag = contact.getSuspensionTag();
                                      final offstage =
                                          !contact.isShowSuspension;

                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Offstage(
                                            offstage: offstage,
                                            child: Container(
                                              height: 30,
                                              color: Colors.grey,
                                              margin: EdgeInsets.only(
                                                  right: 30,
                                                  top: 10,
                                                  bottom: 5),
                                              padding: EdgeInsets.only(left: 5),
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                tag,
                                                softWrap: false,
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Modular.to.pushNamed(
                                                  '/contact/contactDetails/',
                                                  arguments: contact);
                                            },
                                            child: Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 15),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  AppText(
                                                    text:
                                                        "${contact.name} ${contact.surname}",
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                  ),
                                                  const SizedBox(height: 2),
                                                  AppText(
                                                    text: "${contact.email}",
                                                    fontSize: 13,
                                                    fontColor: Colors.tealAccent
                                                        .withOpacity(0.8),
                                                  ),
                                                  const SizedBox(height: 15),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                    physics: const BouncingScrollPhysics(),
                                    indexBarData: ['☆', ...kIndexBarData],
                                    indexHintBuilder: (context, hint) =>
                                        Container(
                                            width: 45,
                                            height: 45,
                                            alignment: Alignment.center,
                                            decoration: const BoxDecoration(
                                              color: Colors.teal,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Text(hint,
                                                style: const TextStyle(
                                                    fontSize: 30,
                                                    color: Colors.white))),
                                    indexBarItemHeight: 14,
                                    indexBarOptions: const IndexBarOptions(
                                      needRebuild: true,
                                      ignoreDragCancel: true,
                                      downTextStyle: TextStyle(
                                          fontSize: 12, color: Colors.white),
                                      downItemDecoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.teal,
                                      ),
                                      indexHintWidth: 50,
                                      indexHintHeight: 50,
                                      indexHintAlignment: Alignment.centerRight,
                                      indexHintChildAlignment:
                                          Alignment(-0.25, 0.0),
                                      indexHintOffset: Offset(-20, 0),
                                    ),
                                  );
                                });
                              } else {
                                return const Center(
                                  child: CircularProgressIndicator(
                                      color: Colors.teal),
                                );
                              }
                            }),
                          ),

                        ],
                      ),
                      Container(
                        child: const Center(child: Text("Empresas")),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
