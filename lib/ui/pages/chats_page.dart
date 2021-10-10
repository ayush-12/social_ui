import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialui/ui/blocs/chats_page_bloc/chats_page_bloc.dart';

import 'package:socialui/common/navigation_classes/router.gr.dart' as Rt;
import '../../injector_container.dart';

List<String> userNames = [
  "Jessica Parker",
  "Julia Green",
  "Miranda Bell",
  "Hanna Goldberg",
  "Mike Goldberg"
];
List<String> lastChat = [
  "How your life is going?",
  "Wow, that’s awesome!",
  "Bye-bye.",
  "It’s a sunny day.",
  "It’s a sunny day."
];

class ChatsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(child: buildBody(context)),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Container(
            child: Stack(
              children: [
                Container(
                  child: Image.asset("assets/images/gradient_circle.png"),
                ),
                Container(
                    margin: EdgeInsets.only(left: 20, right: 30),
                    alignment: Alignment.center,
                    child: Icon(Icons.edit, color: Colors.white)),
              ],
            ),
          ),
        ));
  }

  BlocProvider<ChatsPageBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ChatsPageBloc>(),
      child:
          BlocBuilder<ChatsPageBloc, ChatsPageState>(builder: (context, state) {
        if (state is ChatsPageInitial) {
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
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Rt.Router.navigator.pop();
                        },
                        child: Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
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
                          margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
                          child: Image.asset("assets/images/action_menu.png")),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(40, 20, 40, 0),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Conversations",
                    style: TextStyle(
                        color: Color.fromRGBO(106, 81, 94, 1),
                        fontSize: 28,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(40, 20, 40, 0),
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                  ),
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.all(5),
                            child: Image.asset(
                                "assets/images/gradient_circle.png"),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20, right: 30),
                            alignment: Alignment.center,
                            child:
                                Image.asset("assets/images/search_white.png"),
                          )
                        ],
                      ),
                      Text(
                        "Search a friend",
                        style: TextStyle(
                          color: Color.fromRGBO(217, 195, 206, 1),
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(40, 20, 40, 0),
                    child: ListView.builder(
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 10, right: 20),
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundColor:
                                      Color.fromRGBO(242, 203, 208, 1),
                                  backgroundImage: AssetImage(
                                      "assets/images/new_char_" +
                                          (index + 1).toString() +
                                          ".png"),
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    Rt.Router.navigator
                                        .pushNamed(Rt.Router.textingPage);
                                  },
                                  child: Container(
                                    height: 50,
                                    margin: EdgeInsets.only(
                                      bottom: 10,
                                    ),
                                    alignment: Alignment.centerLeft,
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              userNames[index],
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      106, 81, 94, 1),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w700,
                                                  fontStyle: FontStyle.normal),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              lastChat[index],
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      106, 81, 94, 1),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400,
                                                  fontStyle: FontStyle.normal),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          );
                        }),
                  ),
                )
              ],
            ),
          );
        }
      }),
    );
  }
}
