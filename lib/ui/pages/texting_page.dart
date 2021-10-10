import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialui/models/chat_model.dart';
import 'package:socialui/ui/blocs/texting_page_bloc/texting_page_bloc.dart';

import '../../injector_container.dart';

List<ChatModel> messages = new List();

ChatModel message1 = new ChatModel(sendBy: "Jessica", message: "Hello!");
ChatModel message2 =
    new ChatModel(sendBy: "Jessica", message: "How your life is going?");
ChatModel message3 = new ChatModel(sendBy: "Self", message: "Perfect!");
ChatModel message4 = new ChatModel(sendBy: "Self", message: "What about you?");
ChatModel message5 =
    new ChatModel(sendBy: "Jessica", message: "Not so good...");

class TextingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: buildBody(context)),
    );
  }

  BlocProvider<TextingPageBloc> buildBody(BuildContext context) {
    messages = new List();
    messages.add(message1);
    messages.add(message2);
    messages.add(message3);
    messages.add(message4);
    messages.add(message5);
    return BlocProvider(
      create: (_) => sl<TextingPageBloc>(),
      child: BlocBuilder<TextingPageBloc, TextingPageState>(
          builder: (context, state) {
        if (state is TextingPageInitial) {
          return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromRGBO(255, 246, 248, 1),
                Color.fromRGBO(255, 240, 242, 1)
              ]),
            ),
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 4,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(60.0),
                        ),
                      ),
                      padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.bottomLeft,
                                      child: Text(
                                        "Online",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                            fontStyle: FontStyle.normal,
                                            color: Color.fromRGBO(
                                                210, 187, 199, 1)),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(top: 5),
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        "Jessica",
                                        style: TextStyle(
                                            fontSize: 28,
                                            fontWeight: FontWeight.w400,
                                            fontStyle: FontStyle.normal,
                                            color: Color.fromRGBO(
                                                160, 103, 132, 1)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Color.fromRGBO(242, 203, 208, 1),
                            backgroundImage:
                                AssetImage("assets/images/new_char_1.png"),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: Stack(
                      children: [
                        Container(color: Colors.white),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(60.0),
                            ),
                            gradient: LinearGradient(colors: [
                              Color.fromRGBO(255, 246, 248, 1),
                              Color.fromRGBO(255, 240, 242, 1)
                            ]),
                          ),
                          child: Column(
                            //mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height / 2,
                                child: ListView.builder(
                                    itemCount: messages.length,
                                    //shrinkWrap: true,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return messages[index]
                                                  .sendBy
                                                  .toLowerCase() ==
                                              "self"
                                          ? Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Container(
                                                  height: 52,
                                                  margin: EdgeInsets.fromLTRB(
                                                      20, 0, 20, 5),
                                                  padding: EdgeInsets.only(
                                                      left: 10, right: 10),
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(20.0),
                                                      bottomLeft:
                                                          Radius.circular(20.0),
                                                      bottomRight:
                                                          Radius.circular(20.0),
                                                    ),
                                                    gradient: LinearGradient(
                                                        colors: [
                                                          Color.fromRGBO(
                                                              228, 244, 255, 1),
                                                          Color.fromRGBO(
                                                              223, 241, 255, 1)
                                                        ]),
                                                  ),
                                                  child: Text(
                                                    messages[index].message,
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      color: Color.fromRGBO(
                                                          106, 81, 94, 1),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )
                                          : Row(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(
                                                      20, 0, 20, 5),
                                                  padding: EdgeInsets.only(
                                                      left: 10, right: 10),
                                                  height: 52,
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topRight:
                                                          Radius.circular(20.0),
                                                      bottomLeft:
                                                          Radius.circular(20.0),
                                                      bottomRight:
                                                          Radius.circular(20.0),
                                                    ),
                                                    gradient: LinearGradient(
                                                        colors: [
                                                          Color.fromRGBO(
                                                              255, 255, 255, 1),
                                                          Color.fromRGBO(
                                                              255, 255, 255, 0)
                                                        ]),
                                                  ),
                                                  child: Text(
                                                    messages[index].message,
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      color: Color.fromRGBO(
                                                          106, 81, 94, 1),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            );
                                    }),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(40, 20, 40, 20),
                                height: 60,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40)),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(left: 10),
                                        child: Text(
                                          "Write a message",
                                          style: TextStyle(
                                            color: Color.fromRGBO(
                                                217, 195, 206, 1),
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                            fontStyle: FontStyle.normal,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Stack(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.all(5),
                                          child: Image.asset(
                                              "assets/images/gradient_circle.png"),
                                        ),
                                        Container(
                                            margin: EdgeInsets.only(left: 20),
                                            alignment: Alignment.center,
                                            child: Transform.rotate(
                                              angle: 300 * math.pi / 180,
                                              child: Icon(Icons.send,
                                                  color: Colors.white),
                                            ))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ))
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
