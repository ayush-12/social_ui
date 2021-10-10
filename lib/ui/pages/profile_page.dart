import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialui/ui/blocs/profile_page_bloc/profile_page_bloc.dart';

import 'package:socialui/common/navigation_classes/router.gr.dart' as Rt;
import '../../injector_container.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Rt.Router.navigator.pop();
      },
      child: Scaffold(
        body: SafeArea(child: buildBody(context)),
      ),
    );
  }

  BlocProvider<ProfilePageBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ProfilePageBloc>(),
      child: BlocBuilder<ProfilePageBloc, ProfilePageState>(
          builder: (context, state) {
        if (state is ProfilePageInitial) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            padding: EdgeInsets.only(top: 20),
            child: Stack(
              children: [
                Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height / 3,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 240, 242, 1),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height / 3,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(60.0),
                            ),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        Rt.Router.navigator.pop();
                                      },
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        margin:
                                            EdgeInsets.fromLTRB(40, 0, 40, 0),
                                        child: Icon(
                                          Icons.arrow_back,
                                          color: Color.fromRGBO(34, 43, 69, 1),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                        alignment: Alignment.centerRight,
                                        margin:
                                            EdgeInsets.fromLTRB(40, 0, 40, 0),
                                        child: Image.asset(
                                            "assets/images/action_menu.png")),
                                  ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(40, 20, 40, 0),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "My Profile",
                                  style: TextStyle(
                                      color: Color.fromRGBO(106, 81, 94, 1),
                                      fontSize: 28,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              CircleAvatar(
                                radius: 48,
                                backgroundColor:
                                    Color.fromRGBO(242, 203, 208, 1),
                                backgroundImage:
                                    AssetImage("assets/images/new_char_1.png"),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 20),
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  "Anastasia Mari",
                                  style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                      color: Color.fromRGBO(106, 81, 94, 1)),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        child: Column(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height / 6,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(255, 240, 242, 1),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(60.0),
                                    bottomRight: Radius.circular(60.0)),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Text(
                                      "@ui.sia",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        color: Color.fromRGBO(199, 171, 186, 1),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  child: Text(
                                                    "Photos",
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(
                                                            199, 171, 186, 1),
                                                        fontSize: 18,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ),
                                                Container(
                                                  child: Text(
                                                    "567",
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(
                                                            106, 81, 94, 1),
                                                        fontSize: 24,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  child: Text(
                                                    "Followers",
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(
                                                            199, 171, 186, 1),
                                                        fontSize: 18,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ),
                                                Container(
                                                  child: Text(
                                                    "12,454",
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(
                                                            106, 81, 94, 1),
                                                        fontSize: 24,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  child: Text(
                                                    "Follows",
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(
                                                            199, 171, 186, 1),
                                                        fontSize: 18,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ),
                                                Container(
                                                  child: Text(
                                                    "127",
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(
                                                            106, 81, 94, 1),
                                                        fontSize: 24,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(255, 240, 242, 1),
                                    ),
                                  ),
                                  Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(60.0),
                                        ),
                                      ),
                                      padding: EdgeInsets.all(30),
                                      child: Image.asset(
                                        "assets/images/home_page.png",
                                        height: 60.0,
                                        width: 60.0,
                                      ))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        }
      }),
    );
  }
}
