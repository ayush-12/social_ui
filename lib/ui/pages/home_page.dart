import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:socialui/ui/blocs/home_page_bloc/home_page_bloc.dart';
import 'package:socialui/common/navigation_classes/router.gr.dart' as Rt;
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../injector_container.dart';

List<String> homePageOnboardStrings = [
  "The best photos \nfrom good people",
  "The best photos \nfrom good people 2",
  "The best photos \nfrom good people 3",
  "The best photos \nfrom good people 4"
];
int pageIndex = 0;

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: buildBody(context)),
    );
  }

  BlocProvider<HomePageBloc> buildBody(BuildContext context) {
    final GlobalKey<State<StatefulWidget>> _pageIndicatorKey =
        new GlobalKey<State<StatefulWidget>>();
    return BlocProvider(
      create: (_) => sl<HomePageBloc>(),
      child:
          BlocBuilder<HomePageBloc, HomePageState>(builder: (context, state) {
        if (state is HomePageInitial) {
          return Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color.fromRGBO(242, 203, 208, 1),
                    Color.fromRGBO(244, 206, 217, 1)
                  ]),
                ),
              ),
              Column(
                children: [
                  Container(
                      //color: Colors.white,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 3,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(60.0),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: PageView.builder(
                                itemCount: homePageOnboardStrings.length,
                                scrollDirection: Axis.horizontal,
                                onPageChanged: (value) {
                                  pageIndex = value;
                                  _pageIndicatorKey.currentState
                                      .setState(() {});
                                },
                                itemBuilder: (BuildContext context, int index) {
                                  print("PAGE COUNT " + pageIndex.toString());
                                  return Container(
                                    margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      homePageOnboardStrings[index],
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 28,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  );
                                }),
                          ),
                          PageIndicatorsWidget(key: _pageIndicatorKey),
                        ],
                      )),
                  Expanded(
                    child: Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          color: Colors.white,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              Color.fromRGBO(242, 203, 208, 1),
                              Color.fromRGBO(244, 206, 217, 1)
                            ]),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(60.0),
                            ),
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                child: Container(
                                  width: MediaQuery.of(context).size.width - 60,
                                  child: Image.asset(
                                      'assets/images/home_page.png'),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Rt.Router.navigator.pushReplacementNamed(
                                      Rt.Router.timelinePage);
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width - 60,
                                  margin: EdgeInsets.only(bottom: 30),
                                  height: 60,
                                  decoration: BoxDecoration(
                                    // Commennted out because this gradient was not giving proper colors
                                    // hence used the image directly
                                    /*  gradient: LinearGradient(
                                      begin: Alignment.bottomLeft,
                                      end: Alignment.topRight,
                                      stops: [0.4, 0.5, 1.0, 1.0],
                                      colors: [
                                        Color.fromRGBO(255, 174, 136, 1),
                                        Color.fromRGBO(143, 147, 234, 1),
                                        Color.fromRGBO(95, 211, 255, 1),
                                        Color.fromRGBO(99, 214, 255, 0),
                                      ],
                                    ),*/
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/button_gradient.png")),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(100)),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "Get Started",
                                          textAlign: TextAlign.end,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 21,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                            margin: EdgeInsets.only(right: 40),
                                            width: 40,
                                            alignment: Alignment.centerRight,
                                            child: Image.asset(
                                                "assets/images/fwd_arrow.png")),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          );
        }
      }),
    );
  }
}

class PageIndicatorsWidget extends StatefulWidget {
  const PageIndicatorsWidget({
    Key key,
  }) : super(key: key);

  @override
  _PageIndicatorsWidgetState createState() => _PageIndicatorsWidgetState();
}

class _PageIndicatorsWidgetState extends State<PageIndicatorsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(40, 0, 40, 40),
      alignment: Alignment.center,
      height: 10,
      width: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: homePageOnboardStrings.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.only(right: 5),
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: pageIndex == index
                  ? Color.fromRGBO(160, 103, 132, 1)
                  : Color.fromRGBO(160, 103, 132, 0.16),
              borderRadius: BorderRadius.all(Radius.elliptical(10, 10)),
            ),
          );
        },
      ),
    );
  }
}
