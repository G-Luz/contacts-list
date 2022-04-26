import 'dart:async';
import 'package:contacts_list/app/domain/section_contact/section_contacts.dart';
import 'package:contacts_list/app/modules/home/controller/home_controller.dart';
import 'package:contacts_list/app/modules/home/widgets/app_sliver_contacts.dart';
import 'package:contacts_list/app/widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rxdart/rxdart.dart';

class HomePageStream extends StatefulWidget {
  const HomePageStream({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePageStream, HomeController> {
  final StreamController<List<SectionContacts>> _streamController =
      BehaviorSubject();

  @override
  void initState() {
    super.initState();
    _streamController.addStream(controller.sectionContactsStream());
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
            onPressed: () {},
            // child: Icon(Icons.group_add),
            backgroundColor: Colors.teal,
            child: Icon(Icons.add),
          ),
          body: Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 30),
                  child: Row(
                    children: [
                      AppText(text: 'Contatos', fontSize: 25),
                    ],
                  ),
                ),
                Container(
                  child: const TabBar(
                    physics: BouncingScrollPhysics(),
                    // isScrollable: true,
                    tabs: [
                      Tab(text: 'Pessoas'),
                      Tab(text: 'Empresas'),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 40,
                            margin: EdgeInsets.only(top: 15, bottom: 30),
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(5)),
                            child: const TextField(
                              cursorColor: Colors.teal,
                              style: TextStyle(fontSize: 17),
                              decoration: InputDecoration(
                                  hintText: 'Pesquisar',
                                  border: InputBorder.none,
                                  prefixIcon:
                                      Icon(Icons.search, color: Colors.teal)),
                            ),
                          ),
                          Expanded(
                            child: StreamBuilder<List<SectionContacts>>(
                                stream: _streamController.stream,
                                builder: (context, snapshot) {
                                  if (snapshot.hasError) {
                                    print(snapshot.error);
                                    return Center(
                                        child: AppText(
                                      text:
                                          'Houve um erro durante o processamento',
                                    ));
                                  } else {
                                    if (snapshot.hasData) {
                                      List<SectionContacts> listContacts =
                                          snapshot.data
                                              as List<SectionContacts>;
                                      return ListView.builder(
                                        itemCount: listContacts.length,
                                        itemBuilder: (context, index) {
                                          return AppSliverContacts(
                                            contact: listContacts[index],
                                            // index: index,
                                          );
                                        },
                                      );
                                    } else {
                                      return const Center(
                                        child: CircularProgressIndicator(
                                            color: Colors.teal),
                                      );
                                    }
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


// // Expanded(
//                           //   child: Row(
//                           //     children: [
//                           //       Expanded(
//                           //         flex: 11,
//                           //         child: Observer(builder: (context) {
//                           //           if (controller.contactsController
//                           //               .sectionContactsList.isNotEmpty) {
//                           //             return ListView.builder(
//                           //               shrinkWrap: true,
//                           //               itemCount: controller.contactsController
//                           //                   .sectionContactsList.length,
//                           //               itemBuilder: (context, index) {
//                           //                 return AppSliverContacts(
//                           //                   contact: controller.contactsController
//                           //                       .sectionContactsList[index],
//                           //                 );
//                           //               },
//                           //             );
//                           //           } else {
//                           //             return const Center(
//                           //               child: CircularProgressIndicator(
//                           //                   color: Colors.teal),
//                           //             );
//                           //           }
//                           //         }),
//                           //       ),
//                           //       Expanded(
//                           //           flex: 1,
//                           //           child: Container(
//                           //             color: Colors.yellow.withOpacity(0.2),
//                           //             child: Column(
//                           //               children: [
//                           //                 Text("A"),
//                           //                 Text("B"),
//                           //                 Text("C"),
//                           //                 Text("D"),
//                           //                 Text("E"),
//                           //                 Text("F"),
//                           //                 Text("G"),
//                           //               ],
//                           //             ),
//                           //           )),
//                           //     ],
//                           //   ),
//                           // ),