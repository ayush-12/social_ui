import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialui/ui/blocs/timeline_page_bloc/timeline_page_bloc.dart';
import 'package:socialui/common/navigation_classes/router.gr.dart' as Rt;
import '../../injector_container.dart';

class TimelinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: buildBody(context)),
    );
  }

  BlocProvider<TimelinePageBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<TimelinePageBloc>(),
      child: BlocBuilder<TimelinePageBloc, TimelinePageState>(
          builder: (context, state) {
        if (state is TimelinePageInitial) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromRGBO(255, 246, 248, 1),
                Color.fromRGBO(255, 240, 242, 1)
              ]),
            ),
            padding: EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hello,",
                              style: TextStyle(
                                fontSize: 18,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(210, 187, 199, 1),
                              ),
                            ),
                            Text(
                              "Anastasia",
                              style: TextStyle(
                                fontSize: 28,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(160, 103, 132, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(40, 40)),
                        ),
                        child: Image.asset("assets/images/search.png"),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(40, 20, 40, 0),
                  height: 65,
                  //width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return index == 0
                            ? Container(
                                margin: EdgeInsets.only(right: 10),
                                width: 65,
                                height: 65,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                      Radius.elliptical(65, 65)),
                                ),
                                child: Image.asset("assets/images/plus.png"))
                            : CircleAvatar(
                                radius: 48,
                                backgroundColor:
                                    Color.fromRGBO(242, 203, 208, 1),
                                backgroundImage: AssetImage(
                                    "assets/images/new_char_$index.png"),
                              );
                      }),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(40, 20, 40, 0),
                  height: MediaQuery.of(context).size.height / 2,
                  color: Colors.grey[10],
                  child: Stack(
                    children: [
                      Container(
                          height: MediaQuery.of(context).size.height / 2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(40.0),
                              topLeft: Radius.circular(40.0),
                              topRight: Radius.circular(40.0),
                            ),
                          ),
                          child: Image.asset("assets/images/home_page.png")),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height / 8,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(40.0),
                                bottomLeft: Radius.circular(40.0),
                                topLeft: Radius.circular(40.0),
                              ),
                            ),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 48,
                                  backgroundColor:
                                      Color.fromRGBO(242, 203, 208, 1),
                                  backgroundImage: AssetImage(
                                      "assets/images/new_char_3.png"),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Rt.Router.navigator
                                              .pushNamed(Rt.Router.profilePage);
                                        },
                                        child: Container(
                                          child: Text(
                                            "Jessica Parker",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700,
                                                fontStyle: FontStyle.normal,
                                                color: Color.fromRGBO(
                                                    106, 81, 94, 1)),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          "1 hour ago",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              fontStyle: FontStyle.normal,
                                              color: Color.fromRGBO(
                                                  215, 189, 202, 1)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                      alignment: Alignment.centerRight,
                                      margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
                                      child: Image.asset(
                                          "assets/images/action_menu.png")),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Rt.Router.navigator.pushNamed(Rt.Router.chatsPage);
                  },
                  child: Container(
                      margin: EdgeInsets.only(top: 40),
                      child: Text(
                        "Go to Conversation",
                        style: TextStyle(
                          fontSize: 18,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(160, 103, 132, 1),
                        ),
                      )),
                )
              ],
            ),
          );
        }
      }),
    );
  }
}
